From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Tue, 5 Apr 2005 02:00:51 -0400
Message-ID: <20050405060051.GJ1833@baldric.uwo.ca>
References: <20050403143246.GE8921@tausq.org>
	<200504032041.j33KfpVf018465@hiauly1.hia.nrc.ca>
	<20050404005038.GH8921@tausq.org>
	<20050405000234.GH1833@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050405000234.GH1833@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Apr 04, 2005 at 08:02:34PM -0400, Carlos O'Donell wrote:
> On Sun, Apr 03, 2005 at 05:50:38PM -0700, Randolph Chung wrote:
> > i think we can reduce the test to a signals test. if you strace the test
> > program you will see that it's doing a loop of sigprocmask(),
> > sigsuspend(), wake up by signal, etc.... that may make a test case a bit
> > simpler.
> 
> Agreed. It looks like sigsuspend just isn't returning and looping
> forever in the kernel.

I found another program that doesn't work on hppa. This one was written
by Randolph if my memory serves me correctly. I'll have to add it to the
userspace tests that fail.

---
all: foo.c libfoo.c
	gcc -g -shared -c libfoo.c
	rm -f libfoo.so
	ln -s libfoo.o libfoo.so
	gcc -g -o foo foo.c -lfoo -L. -lpthread

clean:
	rm -f *.o
	rm -f *.so
	rm -f foo
---
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>

void exit_on_signal(int signr)
{
  int status;
  pid_t child;
  fprintf(stderr, "Exiting on signal from child\n");
  child = wait(&status);
  fprintf(stderr, "Waited for child %d\n",(int)child);
  exit(0);
}

extern void foo(void);

int main(void)
{
  int status;
/*  foo();*/
  signal(SIGUSR2,exit_on_signal);
  pid_t parent = getpid();
  if (fork() == 0) 
    {
      /* child kills parent */
      kill(parent, SIGUSR2);
    } 
  else 
    {
      printf("Parent done.\n");
    }
  return 0;
}
---
#include <pthread.h>

void
do_prepare(void)
{
	printf("do_prepare\n");
}

void
do_child(void)
{
	printf("do_child\n");
}

void
foo(void)
{
	  pthread_atfork(&do_prepare, NULL, &do_child);
}
---

Try it out.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
