Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp9.xs4all.nl (smtp9.xs4all.nl [194.109.127.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id B1D0F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Sep 2001 13:13:41 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp9.xs4all.nl (8.9.3/8.9.3) with ESMTP id VAA01231
	for <parisc-linux@lists.parisc-linux.org>; Fri, 7 Sep 2001 21:13:39 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Fri, 7 Sep 2001 21:13:31 +0200
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Trace/Breakpoint trap on "make mrproper"
Message-ID: <20010907211331.A6859@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <200109071356.HAA22153@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109071356.HAA22153@udlkern.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 07, 2001 at 07:56:42AM -0600, John Marvin wrote:
> >
> > It looks like this patch:
> > >Date: Thu, 6 Sep 2001 03:48:16 -0600 (MDT)
> > >From: John Marvin jsm@udlkern.fc.hp.com
> > >Subject: [parisc-linux-cvs] Patch for SMP support, etc.>
> > >A rather large patch that includes my current SMP support changes, plus
> > >a variety of other fixes/changes.
> >
> > did something. But it's so large I'm not sure what exactly :-)
> >
> > Jurriaan
> >
> 
> I was pretty sure my changes to handle_break (in traps.c) would fix that
> problem.  When I read your note I remembered that I had seen a similar
> problem and fixed it.  The kernel would hang when a user program executed
> a break instruction (either intentionally or not) without an attached
> debugger. That is the problem you were seeing.
> 
> However, now that the machine doesn't hang, I am not sure if the remaining
> problem you are seeing is a kernel bug or a userland bug.  It would appear
> that you are executing 0's (0x00000000 is a break instruction). That
> should cause the kernel to send you a SIGTRAP signal. I just checked some
> of your old mail, and it looks like you are getting a SIGTRAP. One thing
> that looks strange is that you are getting signals delivered using stack
> addresses both at ~0xfaf00000 and ~0xbff00000. I wonder if make is using
> an alternate signal stack?
> 
Well, I browsed the source of make-3.79.1 (the latest) and found the
following parts with 'signal' in them:

./job.c:              exit_sig = process_signal(hPID);
./job.c:extern sigset_t fatal_signal_set;
./job.c:  (void) sigprocmask (SIG_BLOCK, &fatal_signal_set, (sigset_t *) 0);
./job.c:  (void) sigblock (fatal_signal_mask);
./job.c:    (void) sigblock (fatal_signal_mask);
./job.c:    (void) sigsetmask (sigblock (0) & ~(fatal_signal_mask));
./job.c:			lib$signal(status);
./job.c:		lib$signal(status);
./job.c:		lib$signal(status);
./job.c:  signal (SIGCHLD,SIG_IGN);
./main.c:extern RETSIGTYPE fatal_error_signal PARAMS ((int sig));
./main.c:sigset_t fatal_signal_set;
./main.c:int fatal_signal_mask;
./main.c:debug_signal_handler (sig)
./main.c:  sigemptyset (&fatal_signal_set);
./main.c:#define	ADD_SIG(sig)	sigaddset (&fatal_signal_set, sig)
./main.c:#define	ADD_SIG(sig)	fatal_signal_mask |= sigmask (sig)
./main.c:  if (signal ((sig), fatal_error_signal) == SIG_IGN)			      \
./main.c:    (void) signal ((sig), SIG_IGN);					      \
./main.c:  (void) signal (SIGCHLD, SIG_DFL);
./main.c:  (void) signal (SIGCLD, SIG_DFL);
./main.c:#  define HANDLESIG(s) signal (s, child_handler)
./main.c:  (void) signal (SIGUSR1, debug_signal_handler);
./amiga.c:    if (SetSignal(0L,0L) & SIGBREAKF_CTRL_C)
./signame.c:  init_sig (SIGUSR1, "USR1", _("User defined signal 1"));
./signame.c:  init_sig (SIGUSR2, "USR2", _("User defined signal 2"));
./signame.c:  init_sig (SIGSTOP, "STOP", _("Stopped (signal)"));
./signame.c:  init_sig (SIGDANGER, "DANGER", _("Danger signal"));

I've snipped lots of comments etc., and I see no mention of 'stack'
anywhere.

[the following is all tested on a 32-bit linux-2.4.9-pa16 kernel, with
default configuration (CPU=PA8x00) and gcc-3.0.2 20010825]

I'll add the output of 'strace make mrproper', but even the operation of 
strace or gdb seems to change the nature of the bug:

gdb /usr/bin/make && run mrproper doesn't crash
strace -o ../make.log make mrproper doesn't crash
strace make mrproper > ../make2.log 2>&1 doesn't crash
strace make mrproper crashes
make mrproper crashes

So I'll include a part of the make2.log and indicate where it crashes:
This log has been run through 'uniq-c' - scroll down to the 6134 lines
of rt_sigreturn(0) and you'll see why. This is exactly the point where
it normally crashes - the exact number of 'sigreturn(0)' lines differs.
There's also some interesting kernel messages in /var/log/messages, I'll
add them below.

      1	newuname({sys="Linux", node="pa8200", ...}) = 0
      1	brk(0)                                  = 0x44000
      1	open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
      1	open("/etc/ld.so.cache", O_RDONLY)      = 3
      1	idle()                                  = 0
      1	mmap(NULL, 6556, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40019000
      1	close(3)                                = 0
      1	open("/lib/libc.so.6", O_RDONLY)        = 3
      1	read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\300"..., 1024) = 1024
      1	idle()                                  = 0
      1	mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001b000
      1	mmap(NULL, 1417616, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4002a000
      1	mprotect(0x40167000, 119184, PROT_NONE) = 0
      1	mmap(0x40176000, 45056, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x13c000) = 0x40176000
      1	mmap(0x40181000, 12688, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40181000
      1	close(3)                                = 0
      1	mprotect(0x10000, 135168, PROT_READ|PROT_WRITE) = 0
      1	mprotect(0x10000, 135168, PROT_READ|PROT_EXEC) = 0
      1	munmap(0x40019000, 6556)                = 0
      1	getpid()                                = 284
      1	brk(0)                                  = 0x44000
      1	brk(0x44030)                            = 0x44030
      1	brk(0x45000)                            = 0x45000
      1	rt_sigaction(SIGHUP, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
      1	rt_sigaction(SIGQUIT, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
      1	rt_sigaction(SIGINT, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
      1	rt_sigaction(SIGTERM, {0x40c2e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
      1	rt_sigaction(SIGXCPU, {0x40c2e, [HUP], SA_RESTART}, {SIG_DFL}, 8) = 0
      1	rt_sigaction(SIGXFSZ, {0x40c2e, [INT], SA_RESTART}, {SIG_DFL}, 8) = 0
      1	rt_sigaction(SIGCHLD, {SIG_DFL}, {SIG_DFL}, 8) = 0
      1	getcwd("/home/jurriaan/source/linux", 4095) = 28
      1	ioperm(0x2cee4, 0xbff01d48, 0xbff01d48) = 0
      1	ioperm(0x2cef4, 0xbff01d48, 0xbff01d48) = -1 ENOENT (No such file or directory)
      1	ioperm(0x2cf08, 0xbff01d48, 0xbff01d48) = 0
      1	ioperm(0x2cee4, 0xbff01d48, 0xbff01d48) = 0
      1	rt_sigaction(SIGCHLD, {0x40dae, [], SA_INTERRUPT}, NULL, 8) = 0
      1	rt_sigaction(SIGUSR1, {0x40ace, [], SA_RESTART}, {SIG_DFL}, 8) = 0
      1	brk(0x46000)                            = 0x46000
      1	brk(0x47000)                            = 0x47000
      1	brk(0x48000)                            = 0x48000
      1	brk(0x49000)                            = 0x49000
      1	ioperm(0x2aabc, 0xbff01e88, 0xbff01e88) = 0
      1	open(".", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
      1	idle()                                  = 0
      1	fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
      1	brk(0x4b000)                            = 0x4b000
      1	SYS_201(0x3, 0x48050, 0x1000, 0xd78beec7, 0) = 672
      1	SYS_201(0x3, 0x48050, 0x1000, 0x40178ca8, 0x2a0) = 0
      1	close(3)                                = 0
      1	open("Makefile", O_RDONLY|O_LARGEFILE)  = 3
      1	idle()                                  = 0
      1	mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
      1	read(3, "VERSION = 2\nPATCHLEVEL = 4\nSUBLE"..., 4096) = 4096
      1	pipe([4, 5])                            = 0
      1	fork()                                  = 285
      1	close(5)                                = 0
      1	read(4, "parisc\n", 200)                = 7
      1	read(4, "\230", 193)                    = -512
      1	--- SIGCHLD (Child exited) ---
      1	rt_sigreturn(0)                         = -1 EINTR (Interrupted system call)
      1	read(4, "", 193)                        = 0
      1	close(4)                                = 0
      1	wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 285
      1	pipe([4, 5])                            = 0
      1	fork()                                  = 288
      1	close(5)                                = 0
      1	read(4, "/bin/sh\n", 200)               = 8
      1	read(4, "", 192)                        = -512
      1	--- SIGCHLD (Child exited) ---
      1	rt_sigreturn(0)                         = -1 EINTR (Interrupted system call)
      1	read(4, "", 192)                        = 0
      1	close(4)                                = 0
      1	wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 288
      1	pipe([4, 5])                            = 0
      1	fork()                                  = 289
      1	--- SIGCHLD (Child exited) ---
      1	rt_sigreturn(0)                         = 289
      1	close(5)                                = 0
      1	read(4, "/home/jurriaan/source/linux\n", 200) = 28
      1	read(4, "", 172)                        = 0
      1	close(4)                                = 0
      1	wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 289
      1	read(3, "+= drivers/scsi/scsidrv.o\nDRIVER"..., 4096) = 4096
      1	brk(0x4c000)                            = 0x4c000
      1	open("arch/parisc/Makefile", O_RDONLY|O_LARGEFILE) = 4
      1	idle()                                  = 0
      1	mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
      1	read(4, "#\n# parisc/Makefile\n#\n# This fil"..., 4096) = 3156
      1	pipe([5, 6])                            = 0
      1	fork()                                  = 290
      1	--- SIGCHLD (Child exited) ---
   6134	rt_sigreturn(0)                         = 290
      1	close(6)                                = 0
      1	read(5, "parisc\n", 200)                = 7
      1	read(5, "", 193)                        = 0
      1	close(5)                                = 0
      1	wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 290
      1	read(4, "", 4096)                       = 0
      1	brk(0x4d000)                            = 0x4d000
      1	close(4)                                = 0
      1	munmap(0x4001a000, 4096)                = 0
      1	read(3, "; ln -sf asm-$(ARCH) asm)\n\t@if ["..., 4096) = 4096

Here are the messages in /var/log/messages during a single 
strace make mrproper:

Sep  7 23:01:32 pa8200 kernel: 0 000004e1
Sep  7 23:01:33 pa8200 kernel: <0 000004e1
Sep  7 23:02:04 pa8200 last message repeated 36 times
Sep  7 23:03:06 pa8200 last message repeated 66 times
Sep  7 23:04:09 pa8200 last message repeated 82 times
Sep  7 23:05:11 pa8200 last message repeated 90 times
Sep  7 23:06:12 pa8200 last message repeated 82 times
Sep  7 23:06:19 pa8200 last message repeated 12 times
Sep  7 23:06:20 pa8200 kernel: <0 000004e1

I have different ones from earlier runs:

pa8200:/home/jurriaan/source# tail -f /var/log/messages
Sep  7 22:38:32 pa8200 kernel: VFS: Mounted root (ext2 filesystem) readonly.
Sep  7 22:38:32 pa8200 kernel: Adding Swap: 1041400k swap-space (priority -1)
Sep  7 22:38:32 pa8200 kernel: eth0: Setting half-duplex based on MII#1 link partner capability of 0021.
Sep  7 22:55:54 pa8200 kernel: 0001 00000000 00040130
Sep  7 22:55:54 pa8200 kernel: 0001 00000000 00040130
Sep  7 22:56:30 pa8200 kernel: 0 000002e6
Sep  7 22:56:30 pa8200 kernel: <0 000002e6
Sep  7 22:56:34 pa8200 last message repeated 7 times
Sep  7 22:56:42 pa8200 kernel: 0001 00000000 00040130
Sep  7 22:57:16 pa8200 kernel: <0 000003dd
Sep  7 22:57:31 pa8200 last message repeated 25 times
Sep  7 22:57:53 pa8200 kernel: 0001 00000000 00040130
Sep  7 22:58:09 pa8200 kernel: 0001 00000000 00040130

What else can I do to help debugging this?

Greetings,
Jurriaan
