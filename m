From: Mike Frysinger <vapier@gentoo.org>
Subject: ptrace interface does not permit modification of syscall return
Date: Mon, 21 Dec 2015 12:55:58 -0500
Message-ID: <20151221175558.GA11489@vapier.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cT3pUeUTdOCG/Tz8"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--cT3pUeUTdOCG/Tz8
Content-Type: multipart/mixed; boundary="vz6iKb9bTbvQNgYh"
Content-Disposition: inline


--vz6iKb9bTbvQNgYh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

i have a ptrace program that watches for specific syscalls and when
matched, will:
 - on entry change the syscall nr to -1 (so the kernel will skip it)
 - on exit change the return to -EPERM so the userspace sees a denial

i have this working on most arches (x86, x86_64, arm, alpha, ia64, etc...).
on parisc, the kernel (using 3.18.7 currently) appears to be wrong.  in my
tests, if i don't mess with the syscall nr, i can change the return value
fine (to EPERM or whatever).  but the syscall executed which i do not want.
if i change the syscall to -1, then i can't change the return value (so the
child sees ENOSYS), but the kernel still executes the original syscall.

i have a simple test case attached to show the issue.  the code does:
 - spawn a child with the parent tracing it
 - child will do:
  - dupe stderr to another fd
  - unlink a file named ".test.flag"
  - write a message through the new fd
  - close a magic # so the parent knows to start denying
    - should see EPERM but it sees ENOSYS
  - close the new fd
    - should see EPERM but it is closed!
  - write to the new fd
    - should work, but the fd is closed
  - call create on ".test.flag"
    - should see EPERM, but the file is created!
 - parent will do:
  - log the syscalls until child runs close(-12345)
  - the parent will then try to deny all close/creat calls
  - uses PTRACE_POKEUSER w/PT_GR20 to set syscall to -1
  - uses PTRACE_POKEUSER w/PT_GR28 to set return to -EPERM

you can run the test case by doing:
$ gcc test.c && ./a.out
-mike

--vz6iKb9bTbvQNgYh
Content-Type: text/x-c; charset=utf-8
Content-Disposition: attachment; filename="test.c"

#define _GNU_SOURCE

#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <sched.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/ptrace.h>
#include <sys/syscall.h>
#include <sys/wait.h>
#include <asm/offset.h>
#include <asm/ptrace.h>

static pid_t trace_pid;

static long _do_ptrace(enum __ptrace_request request, const char *srequest, void *addr, void *data)
{
	long ret;
 try_again:
	errno = 0;
	ret = ptrace(request, trace_pid, addr, data);
	if (ret == -1) {
		/* Child hasn't gotten to the next marker yet ? */
		if (errno == ESRCH) {
			int status;
			if (waitpid(trace_pid, &status, 0) == -1) {
				/* nah, it's dead ... should we whine though ? */
				_exit(0);
			}
			sched_yield();
			goto try_again;
		} else if (errno == EIO || errno == EFAULT) {
			/* This comes up when the child itself tries to use a bad pointer.
			 * That's not something the sandbox should abort on. #560396
			 */
			return ret;
		} else if (!errno)
			if (request == PTRACE_PEEKDATA ||
			    request == PTRACE_PEEKTEXT ||
			    request == PTRACE_PEEKUSER)
				return ret;

		err(1, "do_ptrace: ptrace(%s, ..., %p, %p)", srequest, addr, data);
	}
	return ret;
}
#define do_ptrace(request, addr, data) _do_ptrace(request, #request, addr, data)

static long do_peekuser(long offset)
{
	return do_ptrace(PTRACE_PEEKUSER, (void *)offset, NULL);
}

static long do_pokeuser(long offset, long val)
{
	return do_ptrace(PTRACE_POKEUSER, (void *)offset, (void *)val);
}

static void trace_child_signal(int signo, siginfo_t *info, void *context)
{
#if 0
	warnx("got sig %s(%i): code:%s(%i) status:%s(%i)",
		strsignal(signo), signo,
		"---", info->si_code,
		strsignal(info->si_status), info->si_status);
#endif

	switch (info->si_code) {
		case CLD_DUMPED:
		case CLD_KILLED:
			_exit(128 + info->si_status);

		case CLD_EXITED:
			_exit(info->si_status);

		case CLD_TRAPPED:
			switch (info->si_status) {
				case SIGSTOP:
					kill(trace_pid, SIGCONT);
				case SIGTRAP:
				case SIGCONT:
					return;
			}

			/* For whatever signal the child caught, let's ignore it and
			 * continue on.  If it aborted, segfaulted, whatever, that's
			 * its problem, not ours, so don't whine about it.  We just
			 * have to be sure to bubble it back up.  #265072
			 */
			do_ptrace(PTRACE_CONT, NULL, (void *)(long)info->si_status);
			return;
	}

	errx(1, "unhandled signal case");
}

static const char *lookup_syscall(long nr)
{
	switch (nr) {
#define X(n) case SYS_##n: return #n;
	X(access)
	X(brk)
	X(close)
	X(creat)
	X(dup)
	X(fstat64)
	X(mmap)
	X(mprotect)
	X(munmap)
	X(open)
	X(read)
	X(uname)
	X(write)
#undef X
	}
	return "";
}

void child_main(void)
{
	char test_file[] = ".test.flag";
	char msg[] = "child: you should see two of these\n";
	int fd = dup(2);

	unlink(test_file);
	write(fd, msg, sizeof(msg));

	/* Marker for the parent to watch. */
	errno = 0;
	close(-12345);
	fprintf(stderr, "child: close marker (should be EPERM): %m\n");
	errno = 0;
	close(fd);
	fprintf(stderr, "child: real close (should be EPERM): %m\n");
	errno = 0;
	write(fd, msg, sizeof(msg));
	fprintf(stderr, "child: write (should be success): %m\n");
	errno = 0;
	creat(test_file, 0660);
	fprintf(stderr, "child: creat (should be EPERM): %m\n");
	errno = 0;
	access(test_file, F_OK);
	fprintf(stderr, "child: access (should be ENOENT): %m\n");

	unlink(test_file);
	exit(0);
}

static void parent_main(void)
{
	int status;
	long nr, arg1;

	/* Wait for the child to exec. */
	while (1) {
		do_ptrace(PTRACE_SYSCALL, NULL, NULL);
		waitpid(trace_pid, &status, 0);

		unsigned event = ((unsigned)status >> 16);
		if (event == PTRACE_EVENT_EXEC) {
			warnx("parent: hit exec!");
			break;
		} else
			warnx("parent: waiting for exec; status: %#x", status);
	}

	/* Main loop. */
	bool saw_close = false;
	bool before_syscall = false;
	bool fake_syscall_ret = false;
	while (1) {
		do_ptrace(PTRACE_SYSCALL, NULL, NULL);
		waitpid(trace_pid, &status, 0);

		nr = do_peekuser(PT_GR20);
		arg1 = do_peekuser(PT_GR26);
		if (before_syscall) {
			warnx("parent: NR:%3li %s", nr, lookup_syscall(nr));
			/* Once the child hits the marker, deny all close & creat calls */
			if (nr == __NR_close || nr == __NR_creat) {
				if (saw_close || arg1 == -12345) {
					saw_close = true;
					warnx("parent: setting NR to -1");
					do_pokeuser(PT_GR20, -1);
					fake_syscall_ret = true;
				}
			}
		} else if (fake_syscall_ret) {
			warnx("parent: forcing EPERM");
			do_pokeuser(PT_GR28, -EPERM);
			fake_syscall_ret = false;
		}

		before_syscall = !before_syscall;
	}
}

int main(int argc, char *argv[])
{
	struct sigaction sa, old_sa;

	/* Child will re-exec us so the ptrace is clean for the parent. */
	if (argc > 1)
		child_main();

	/* Set up signal handler to watch for child events. */
	sa.sa_flags = SA_RESTART | SA_SIGINFO;
	sa.sa_sigaction = trace_child_signal;
	sigaction(SIGCHLD, &sa, &old_sa);

	/* Fork a child and have the parent do some early ptrace init. */
	trace_pid = fork();
	if (trace_pid == -1) {
		err(1, "fork() failed");
	} else if (trace_pid) {
		warn("parent waiting for child (pid=%i) to signal", trace_pid);
		waitpid(trace_pid, NULL, 0);
		do_ptrace(PTRACE_SETOPTIONS, NULL,
			(void *)(PTRACE_O_TRACESYSGOOD | PTRACE_O_TRACEEXEC));
		parent_main();
		errx(1, "child should have quit, as should we");
	}

	/* Have the child set itself up for tracing before execing again. */
	warnx("child setting up ...");
	sigaction(SIGCHLD, &old_sa, NULL);
	do_ptrace(PTRACE_TRACEME, NULL, NULL);
	kill(getpid(), SIGSTOP);
	execl(argv[0], argv[0], "--child", NULL);

	return 0;
}

--vz6iKb9bTbvQNgYh--

--cT3pUeUTdOCG/Tz8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWeD0uAAoJEEFjO5/oN/WBKAQQAM3zXZyl59wUW9Ds8w3hsKYq
9fwG45cml73fmXqviCBmGbmqoyawsUsH0AOq34wT9gsmGp7ColabwnZLipwC51NM
lV5zRslevIU2IQpizj4V+wkIu/4Hg9Qk0SR/6HzxRy6Uf9ptwhOG6dYzJ/8yansZ
VBAZYe/vhmYJMNvYcHuX5HRzdqPPAdsi2Lrh1tUq+87BEKKb54+8DfgYUieC50RT
VGAM3NnqF1GIQZMBSxWSTQGEWmDMZJfIQF1IRxVoqBubUmjBNynOOPjfKm55CEA7
+aPKgeI+GaMoGXC97M3TD6nDdmX3ylH9IUY13rFVXAYxEr1yGZ2Gi+QLDLHL8HI1
Tnth/ik4g2/U7tAf8vO5Rg6O5MpW3ALoBu6UAREzEnOND5VQRCXUO5JaLDRhJz10
0EOa7q3sUfD6KGcUvt5WiMi0afaXo/JKEDGfI0hgDv+ak+Fu6kKA4EVMItHCM9cl
2L3d5OWIVjRtea4dwNI5xPLqF1oTn2zARcBxXvo/l4RwWEOV8Gr0XFbuSXspyPf6
24IDAej46jm5azH95osmrf/5s2E4aZ0QhjR+BE9T/RfYYJxrT0kCgTc37ycBcVHS
OhZpTJ5zzqm1z6QzgYHyETAHdl0YUtl08lXEerfMFeh+81DOIVVfKSjQ5mzxcIx0
mmbokBT8onoGBmV0TKPt
=BEnT
-----END PGP SIGNATURE-----

--cT3pUeUTdOCG/Tz8--
