Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 27E6348BE
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 11:45:04 -0600 (MDT)
Date: Sun, 28 Sep 2003 13:42:26 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Randolph Chung <tausq@debian.org>
Message-ID: <20030928174226.GA3040@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="wRRV7LY7NUeQGEoC"
Subject: [parisc-linux] pthread attributes and stack positions (gcc related?)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


I've noticed that we've regressed on a pthread test "tst-attr1" and it
seems to complain that our thread variables are stored outside the stack
that the thred "thinks" is it's stack.

The following code is a simplified case of tst-attr1.c in the glibc
testsuite. I would recommend that you look at the original code too.

The question I have is... how is this supposed to work? If anyone is
more cluefull than me on this I would appreciate a pointer in the right
direction :)

===
./test-attr
In child
&a=0xfaf00ac8, stackaddr=0x40046e60, stacksize=0xbffb91a0
./test-attr: pthread_attr_getstack returned range does not cover main's stack
In parent
&a=0xfaf00ac8, stackaddr=0x40046e60, stacksize=0xbffb91a0
./test-attr: pthread_attr_getstack returned range does not cover main's stack
===

The variable is definately on the process stack. The thread's stack 
address seems to be inside the libraries 'writable' space and the stack 
size is wrong (or uninitialized). Perhaps I should just be looking for 
arch-dependant init code that we might be missing.

=== tst-attr1 from glibc ===
tst-attr1: pthread_attr_getstack returned range does not cover main's stack
thread stack 0x40245000-0x40a44000 (0x7ff000)
thread guardsize 4096
thread stack 0x40a45000-0x40c44000 (0x1ff000)
thread guardsize 4096
thread stack 0x40245000-0x40444000 (0x1ff000)
thread guardsize 65536
===

Attached is the Makefile to build the simplified tst-attr1.c (requires
test-skeleton.c wrapper, included aswell) or rather test-attr.c

Input and thoughts appreciated. This failure in glibc is rather
orthogonal to the release of 2.3.2, I'm still concentrating on the last
sysdep cancel failure (last bug to fix before a working release).

c.



--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=Makefile


all: test-attr.o
	gcc -lpthread -o test-attr test-attr.o
test:
	./test-attr
clean:
	rm -rf *.o
	rm -rf test-attr


--wRRV7LY7NUeQGEoC
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="tst-attr1.c"

/* pthread_getattr_np test.
   Copyright (C) 2003 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   Contributed by Jakub Jelinek <jakub@redhat.com>, 2003.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#include <errno.h>
#include <error.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <stackinfo.h>

static void *
tf (void *arg)
{
  pthread_attr_t a, *ap, a2;
  int err;
  void *result = NULL;

  if (arg == NULL)
    {
      ap = &a2;
      err = pthread_attr_init (ap);
      if (err)
        {
          error (0, err, "pthread_attr_init failed");
          return tf;
        }
    }
  else
    ap = (pthread_attr_t *) arg;

  err = pthread_getattr_np (pthread_self (), &a);
  if (err)
    {
      error (0, err, "pthread_getattr_np failed");
      result = tf;
    }

  int detachstate1, detachstate2;
  err = pthread_attr_getdetachstate (&a, &detachstate1);
  if (err)
    {
      error (0, err, "pthread_attr_getdetachstate failed");
      result = tf;
    }
  else
    {
      err = pthread_attr_getdetachstate (ap, &detachstate2);
      if (err)
	{
	  error (0, err, "pthread_attr_getdetachstate failed");
	  result = tf;
	}
      else if (detachstate1 != detachstate2)
	{
	  error (0, 0, "detachstate differs %d != %d",
		 detachstate1, detachstate2);
	  result = tf;
	}
    }

  void *stackaddr;
  size_t stacksize;
  err = pthread_attr_getstack (&a, &stackaddr, &stacksize);
  if (err)
    {
      error (0, err, "pthread_attr_getstack failed");
      result = tf;
    }
  else if ((void *) &a < stackaddr
	   || (void *) &a >= stackaddr + stacksize)
    {
      error (0, 0, "pthread_attr_getstack returned range does not cover thread's stack");
      result = tf;
    }
  else
    printf ("thread stack %p-%p (0x%zx)\n", stackaddr, stackaddr + stacksize,
	    stacksize);

  size_t guardsize1, guardsize2;
  err = pthread_attr_getguardsize (&a, &guardsize1);
  if (err)
    {
      error (0, err, "pthread_attr_getguardsize failed");
      result = tf;
    }
  else
    {
      err = pthread_attr_getguardsize (ap, &guardsize2);
      if (err)
	{
	  error (0, err, "pthread_attr_getguardsize failed");
	  result = tf;
	}
      else if (guardsize1 != guardsize2)
	{
	  error (0, 0, "guardsize differs %zd != %zd",
		 guardsize1, guardsize2);
	  result = tf;
	}
      else
	printf ("thread guardsize %zd\n", guardsize1);
    }

  int scope1, scope2;
  err = pthread_attr_getscope (&a, &scope1);
  if (err)
    {
      error (0, err, "pthread_attr_getscope failed");
      result = tf;
    }
  else
    {
      err = pthread_attr_getscope (ap, &scope2);
      if (err)
	{
	  error (0, err, "pthread_attr_getscope failed");
	  result = tf;
	}
      else if (scope1 != scope2)
	{
	  error (0, 0, "scope differs %d != %d",
		 scope1, scope2);
	  result = tf;
	}
    }

  err = pthread_attr_destroy (&a);
  if (err)
    {
      error (0, err, "pthread_attr_destroy failed");
      result = tf;
    }

  if (ap == &a2)
    {
      err = pthread_attr_destroy (ap);
      if (err)
	{
	  error (0, err, "pthread_attr_destroy failed");
	  result = tf;
	}
    }

  return result;
}


static int
do_test (void)
{
  int result = 0;
  pthread_attr_t a;

  int err = pthread_attr_init (&a);
  if (err)
    {
      error (0, err, "pthread_attr_init failed");
      result = 1;
    }

  err = pthread_attr_destroy (&a);
  if (err)
    {
      error (0, err, "pthread_attr_destroy failed");
      result = 1;
    }

  err = pthread_getattr_np (pthread_self (), &a);
  if (err)
    {
      error (0, err, "pthread_getattr_np failed");
      result = 1;
    }

  int detachstate;
  err = pthread_attr_getdetachstate (&a, &detachstate);
  if (err)
    {
      error (0, err, "pthread_attr_getdetachstate failed");
      result = 1;
    }
  else if (detachstate != PTHREAD_CREATE_JOINABLE)
    {
      error (0, 0, "initial thread not joinable");
      result = 1;
    }

  void *stackaddr;
  size_t stacksize;
  err = pthread_attr_getstack (&a, &stackaddr, &stacksize);
  if (err)
    {
      error (0, err, "pthread_attr_getstack failed");
      result = 1;
    }
  else if ((void *) &a < stackaddr
	   || (void *) &a >= stackaddr + stacksize)
    {
      error (0, 0, "pthread_attr_getstack returned range does not cover main's stack");
      result = 1;
    }
  else
    printf ("initial thread stack %p-%p (0x%zx)\n", stackaddr,
	    stackaddr + stacksize, stacksize);

  size_t guardsize;
  err = pthread_attr_getguardsize (&a, &guardsize);
  if (err)
    {
      error (0, err, "pthread_attr_getguardsize failed");
      result = 1;
    }
  else if (guardsize != 0)
    {
      error (0, 0, "pthread_attr_getguardsize returned %zd != 0",
	     guardsize);
      result = 1;
    }

  int scope;
  err = pthread_attr_getscope (&a, &scope);
  if (err)
    {
      error (0, err, "pthread_attr_getscope failed");
      result = 1;
    }
  else if (scope != PTHREAD_SCOPE_SYSTEM)
    {
      error (0, 0, "pthread_attr_getscope returned %d != PTHREAD_SCOPE_SYSTEM",
	     scope);
      result = 1;
    }

  int inheritsched;
  err = pthread_attr_getinheritsched (&a, &inheritsched);
  if (err)
    {
      error (0, err, "pthread_attr_getinheritsched failed");
      result = 1;
    }
  else if (inheritsched != PTHREAD_INHERIT_SCHED)
    {
      error (0, 0, "pthread_attr_getinheritsched returned %d != PTHREAD_INHERIT_SCHED",
	     inheritsched);
      result = 1;
    }

  err = pthread_attr_destroy (&a);
  if (err)
    {
      error (0, err, "pthread_attr_destroy failed");
      result = 1;
    }

  pthread_t th;
  err = pthread_create (&th, NULL, tf, NULL);
  if (err)
    {
      error (0, err, "pthread_create #1 failed");
      result = 1;
    }
  else
    {
      void *ret;
      err = pthread_join (th, &ret);
      if (err)
	{
	  error (0, err, "pthread_join #1 failed");
	  result = 1;
	}
      else if (ret != NULL)
        result = 1;
    }

  err = pthread_attr_init (&a);
  if (err)
    {
      error (0, err, "pthread_attr_init failed");
      result = 1;
    }

  err = pthread_create (&th, &a, tf, &a);
  if (err)
    {
      error (0, err, "pthread_create #2 failed");
      result = 1;
    }
  else
    {
      void *ret;
      err = pthread_join (th, &ret);
      if (err)
	{
	  error (0, err, "pthread_join #2 failed");
	  result = 1;
	}
      else if (ret != NULL)
        result = 1;
    }

  err = pthread_attr_setguardsize (&a, 16 * sysconf (_SC_PAGESIZE));
  if (err)
    {
      error (0, err, "pthread_attr_setguardsize failed");
      result = 1;
    }

  err = pthread_create (&th, &a, tf, &a);
  if (err)
    {
      error (0, err, "pthread_create #3 failed");
      result = 1;
    }
  else
    {
      void *ret;
      err = pthread_join (th, &ret);
      if (err)
	{
	  error (0, err, "pthread_join #3 failed");
	  result = 1;
	}
      else if (ret != NULL)
        result = 1;
    }

  err = pthread_attr_destroy (&a);
  if (err)
    {
      error (0, err, "pthread_attr_destroy failed");
      result = 1;
    }

  return result;
}

#define TEST_FUNCTION do_test ()
#include "../test-skeleton.c"

--wRRV7LY7NUeQGEoC
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="test-attr.c"

#include <errno.h>
#include <error.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(void){	

	pthread_attr_t a;
	int result = 0;
	void *stackaddr = NULL;
	size_t stacksize = 0;
	int err;
	pid_t ret;
	
	ret = fork();
	if( ret != 0 ){
		wait(NULL);
		printf("In parent\n");
	} else if ( ret == -1 ) { 
		printf("Error forking.\n");
		exit(1);
	} else {
		printf("In child\n");
	}
	
	err = pthread_attr_init (&a);
	if (err){
		error(0, err, "pthread_attr_init failed");
		exit(1);
	}
	
	err = pthread_getattr_np (pthread_self (), &a);
	if (err){
		error (0, err, "pthread_getattr_np failed");
		exit(1);
	}
    
	err = pthread_attr_getstack (&a, &stackaddr, &stacksize);
	printf("&a=0x%x, stackaddr=0x%x, stacksize=0x%x\n",
        	(unsigned int)(&a),(unsigned int)stackaddr,stacksize);
	if (err){
		error (0, err, "pthread_attr_getstack failed");
		result = 1;
	} else if ((void *) &a < stackaddr || (void *) &a >= stackaddr + stacksize){
		error (0, 0, "pthread_attr_getstack returned range does not cover main's stack");
		result = 1;
	} else
	printf ("initial thread stack %p-%p (0x%zx)\n", 
		stackaddr, stackaddr + stacksize, stacksize);
	exit(0);
}



--wRRV7LY7NUeQGEoC
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="test-skeleton.c"

/* Skeleton for test programs.
   Copyright (C) 1998, 2000, 2001, 2002, 2003 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   Contributed by Ulrich Drepper <drepper@cygnus.com>, 1998.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#include <errno.h>
#include <getopt.h>
#include <search.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/resource.h>
#include <sys/wait.h>
#include <sys/param.h>
#include <time.h>

/* The test function is normally called `do_test' and it is called
   with argc and argv as the arguments.  We nevertheless provide the
   possibility to overwrite this name.  */
#ifndef TEST_FUNCTION
# define TEST_FUNCTION do_test (argc, argv)
#endif

#ifndef TEST_DATA_LIMIT
# define TEST_DATA_LIMIT (64 << 20) /* Data limit (bytes) to run with.  */
#endif

#define OPT_DIRECT 1000
#define OPT_TESTDIR 1001

static struct option options[] =
{
#ifdef CMDLINE_OPTIONS
  CMDLINE_OPTIONS
#endif
  { "direct", no_argument, NULL, OPT_DIRECT },
  { "test-dir", required_argument, NULL, OPT_TESTDIR },
  { NULL, 0, NULL, 0 }
};

/* PID of the test itself.  */
static pid_t pid;

/* Directory to place temporary files in.  */
static const char *test_dir;

/* List of temporary files.  */
struct temp_name_list
{
  struct qelem q;
  const char *name;
} *temp_name_list;

/* Add temporary files in list.  */
static void
__attribute__ ((unused))
add_temp_file (const char *name)
{
  struct temp_name_list *newp
    = (struct temp_name_list *) calloc (sizeof (*newp), 1);
  if (newp != NULL)
    {
      newp->name = name;
      if (temp_name_list == NULL)
	temp_name_list = (struct temp_name_list *) &newp->q;
      else
	insque (newp, temp_name_list);
    }
}

/* Delete all temporary files.  */
static void
delete_temp_files (void)
{
  while (temp_name_list != NULL)
    {
      remove (temp_name_list->name);
      temp_name_list = (struct temp_name_list *) temp_name_list->q.q_forw;
    }
}

/* Create a temporary file.  */
static int
__attribute__ ((unused))
create_temp_file (const char *base, char **filename)
{
  char *fname;
  int fd;

  fname = (char *) malloc (strlen (test_dir) + 1 + strlen (base)
			   + sizeof ("XXXXXX"));
  if (fname == NULL)
    {
      puts ("out of memory");
      return -1;
    }
  strcpy (stpcpy (stpcpy (stpcpy (fname, test_dir), "/"), base), "XXXXXX");

  fd = mkstemp (fname);
  if (fd == -1)
    {
      printf ("cannot open temporary file '%s': %m\n", fname);
      free (fname);
      return -1;
    }

  add_temp_file (fname);
  if (filename != NULL)
    *filename = fname;

  return fd;
}

/* Timeout handler.  We kill the child and exit with an error.  */
static void
__attribute__ ((noreturn))
timeout_handler (int sig __attribute__ ((unused)))
{
  int killed;
  int status;

  /* Send signal.  */
  kill (pid, SIGKILL);

  /* Wait for it to terminate.  */
  int i;
  for (i = 0; i < 5; ++i)
    {
      killed = waitpid (pid, &status, WNOHANG|WUNTRACED);
      if (killed != 0)
	break;

      /* Delay, give the system time to process the kill.  If the
	 nanosleep() call return prematurely, all the better.  We
	 won't restart it since this probably means the child process
	 finally died.  */
      struct timespec ts = { .tv_sec = 0, .tv_nsec = 100000000 };
      nanosleep (&ts, NULL);
    }
  if (killed != 0 && killed != pid)
    {
      perror ("Failed to killed test process");
      exit (1);
    }

#ifdef CLEANUP_HANDLER
  CLEANUP_HANDLER;
#endif

  /* If we expected this signal: good!  */
#ifdef EXPECTED_SIGNAL
  if (EXPECTED_SIGNAL == SIGALRM)
    exit (0);
#endif

  if (killed == 0 || (WIFSIGNALED (status) && WTERMSIG (status) == SIGKILL))
    fputs ("Timed out: killed the child process\n", stderr);
  else if (WIFSTOPPED (status))
    fprintf (stderr, "Timed out: the child process was %s\n",
	     strsignal (WSTOPSIG (status)));
  else if (WIFSIGNALED (status))
    fprintf (stderr, "Timed out: the child process got signal %s\n",
	     strsignal (WTERMSIG (status)));
  else
    fprintf (stderr, "Timed out: killed the child process but it exited %d\n",
	     WEXITSTATUS (status));

  /* Exit with an error.  */
  exit (1);
}

/* We provide the entry point here.  */
int
main (int argc, char *argv[])
{
  int direct = 0;	/* Directly call the test function?  */
  int status;
  int opt;
  pid_t termpid;

#ifdef STDOUT_UNBUFFERED
  setbuf (stdout, NULL);
#endif

  while ((opt = getopt_long (argc, argv, "+", options, NULL)) != -1)
    switch (opt)
      {
      case '?':
	exit (1);
      case OPT_DIRECT:
	direct = 1;
	break;
      case OPT_TESTDIR:
	test_dir = optarg;
	break;
#ifdef CMDLINE_PROCESS
	CMDLINE_PROCESS
#endif
      }

  /* Set TMPDIR to specified test directory.  */
  if (test_dir != NULL)
    {
      setenv ("TMPDIR", test_dir, 1);

      if (chdir (test_dir) < 0)
	{
	  perror ("chdir");
	  exit (1);
	}
    }
  else
    {
      test_dir = getenv ("TMPDIR");
      if (test_dir == NULL || test_dir[0] == '\0')
	test_dir = "/tmp";
    }

  /* Make sure we see all message, even those on stdout.  */
  setvbuf (stdout, NULL, _IONBF, 0);

  /* make sure temporary files are deleted.  */
  atexit (delete_temp_files);

  /* Correct for the possible parameters.  */
  argv[optind - 1] = argv[0];
  argv += optind - 1;
  argc -= optind - 1;

  /* Call the initializing function, if one is available.  */
#ifdef PREPARE
  PREPARE (argc, argv);
#endif

  /* If we are not expected to fork run the function immediately.  */
  if (direct)
    return TEST_FUNCTION;

  /* Set up the test environment:
     - prevent core dumps
     - set up the timer
     - fork and execute the function.  */

  pid = fork ();
  if (pid == 0)
    {
      /* This is the child.  */
#ifdef RLIMIT_CORE
      /* Try to avoid dumping core.  */
      struct rlimit core_limit;
      core_limit.rlim_cur = 0;
      core_limit.rlim_max = 0;
      setrlimit (RLIMIT_CORE, &core_limit);
#endif

#ifdef RLIMIT_DATA
      /* Try to avoid eating all memory if a test leaks.  */
      struct rlimit data_limit;
      if (getrlimit (RLIMIT_DATA, &data_limit) == 0)
	{
	  if (TEST_DATA_LIMIT == RLIM_INFINITY)
	    data_limit.rlim_cur = data_limit.rlim_max;
	  else if (data_limit.rlim_cur > (rlim_t) TEST_DATA_LIMIT)
	    data_limit.rlim_cur = MIN ((rlim_t) TEST_DATA_LIMIT,
				       data_limit.rlim_max);
	  if (setrlimit (RLIMIT_DATA, &data_limit) < 0)
	    perror ("setrlimit: RLIMIT_DATA");
	}
      else
	perror ("getrlimit: RLIMIT_DATA");
#endif

      /* We put the test process in its own pgrp so that if it bogusly
	 generates any job control signals, they won't hit the whole build.  */
      setpgid (0, 0);

      /* Execute the test function and exit with the return value.   */
      exit (TEST_FUNCTION);
    }
  else if (pid < 0)
    {
      perror ("Cannot fork test program");
      exit (1);
    }

  /* Set timeout.  */
#ifndef TIMEOUT
  /* Default timeout is two seconds.  */
# define TIMEOUT 2
#endif
  signal (SIGALRM, timeout_handler);
  alarm (TIMEOUT);

  /* Wait for the regular termination.  */
  termpid = TEMP_FAILURE_RETRY (waitpid (pid, &status, 0));
  if (termpid == -1)
    {
      printf ("Waiting for test program failed: %m\n");
      exit (1);
    }
  if (termpid != pid)
    {
      printf ("Oops, wrong test program terminated: expected %ld, got %ld\n",
	      (long int) pid, (long int) termpid);
      exit (1);
    }

#ifndef EXPECTED_SIGNAL
  /* We don't expect any signal.  */
# define EXPECTED_SIGNAL 0
#endif
  if (WTERMSIG (status) != EXPECTED_SIGNAL)
    {
      if (EXPECTED_SIGNAL != 0)
	{
	  if (WTERMSIG (status) == 0)
	    fprintf (stderr,
		     "Expected signal '%s' from child, got none\n",
		     strsignal (EXPECTED_SIGNAL));
	  else
	    fprintf (stderr,
		     "Incorrect signal from child: got `%s', need `%s'\n",
		     strsignal (WTERMSIG (status)),
		     strsignal (EXPECTED_SIGNAL));
	}
      else
	fprintf (stderr, "Didn't expect signal from child: got `%s'\n",
		 strsignal (WTERMSIG (status)));
      exit (1);
    }

  /* Simply exit with the return value of the test.  */
#ifndef EXPECTED_STATUS
  return WEXITSTATUS (status);
#else
  if (WEXITSTATUS (status) != EXPECTED_STATUS)
    {
      fprintf (stderr, "Expected status %d, got %d\n",
	       EXPECTED_STATUS, WEXITSTATUS (status));
      exit (1);
    }

  return 0;
#endif
}

--wRRV7LY7NUeQGEoC--
