From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Sun, 21 Mar 2010 14:19:36 -0400
Message-ID: <20100321181935.GA19525@hiauly1.hia.nrc.ca>
References: <20100307171207.GA22856@hiauly1.hia.nrc.ca> <20100307203230.CAC964E77@hiauly1.hia.nrc.ca> <20100311032049.GA14312@hiauly1.hia.nrc.ca> <20100311135418.GA22698@bombadil.infradead.org> <20100311224044.GA18789@hiauly1.hia.nrc.ca> <20100313020647.GA26384@hiauly1.hia.nrc.ca> <20100315011024.GA7309@hiauly1.hia.nrc.ca> <119aab441003160449n11cf5272qb9d15fa97625dd7d@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="J/dobhs11T7y2rNN"
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Kyle McMartin <kyle@mcmartin.ca>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441003160449n11cf5272qb9d15fa97625dd7d@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 16 Mar 2010, Carlos O'Donell wrote:

> After some of my own testing I think this is all MMU related, but I
> can't prove it yet. I'm pouring through as much kernel code as I can
> right now to determine what is going wrong at the time of the clone,
> and I see at least one bug that I'm investigating regarding return
> addresses.

I've attached another version of the minifail test program.  In
this one, the parent and thread both monitor the location 0x4000001c
in the stack region allocated to the thread.  If a problem is
detected, they drop core with an illegal instruction.  If the
child of the fork sees a nonzero value in the above location
when the fork call returns, it sleeps for ten seconds.

When corruption occurs and core is dropped on my c3750 (UP 32-bit
kernel), both the parent and thread have undergone many iterations
of their respective monitor loops.  The forked child always reports
seeing a nonzero value at the stack location.  The before value
in the core dump was zero (i.e., thread_run had not started).

I added an illegal instruction abort to the child.  In this case,
the thread_run loop counter was 48085 when the page was copied and
the before value was zero.

One thought that has crossed my mind is that the memory pages allocated
for the stack region used by the thread are somehow getting interchanged
between parent and child by the fork operation.  This happens fairly
late as both the parent and thread are executing post fork at the time
this happens.  Possibly, this is part of the bug.

I have looked at entry.S and pacache.S quite a bit and it's not obvious
how this could happen, although I must admit to not fully understanding
the tmp alias code.  I tend to think the bug is in the core mm code.

I see a few cleanups to entry.S.  We didn't kill the misnamed macros
(DEP, DEPI and EXTR) for example.  But I don't think these are the problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="minifail12.cpp"

#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

/*
  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=561203

  clone(child_stack=0x4088d040, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0x4108c4e8, tls=0x4108c900, child_tidptr=0x4108c4e8) = 14819
[pid 14819] set_robust_list(0x4108c4f0, 0xc) = 0
[pid 14818] clone(child_stack=0, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x40002028) = 14820

 g++  minifail.cpp -o minifail -O0 -pthread -g

 i=0; while true; do i=$(($i+1)); echo Run $i; ./minifail; done;

 */

int before = -1;

void* thread_run(void* arg) {
	static long status;
	int i;
        
	for (i = 1000000; i; i--)
	  if (*(volatile int *)0x4000001c != 0x407ff340)
	    asm ("iitlbp %r0,(%sr0,%r0)");
	return (void *)&status;
}

int pure_test() {
	int i, stat, x;
	int seen = 0;
	pthread_t thread;
	pthread_create(&thread, NULL, thread_run, NULL);

	before = *(volatile int *)0x4000001c;
	switch (fork()) {
		case -1:
			perror("fork() failed");
		case 0:
			/* x is non-zero iff start thread has saved
			     `args' onto stack in r26 slot.  */
			x = *(volatile int *)0x4000001c;
			if (x == 0x407ff340)
			  {
				sleep (10);
			  }
			printf ("c 0x%x\n", x);
			fflush (stdout);
			return 0;
		default:
			break;
		
	}
	for (i = 1000000; i; i--)
	  {
	    if (!seen && *(volatile int *)0x4000001c == 0x407ff340)
	      seen = i;
	    if (seen && *(volatile int *)0x4000001c != 0x407ff340)
	      asm ("iitlbp %r0,(%sr0,%r0)");
	  }
	printf ("p 0x%x\n", *(int *)0x4000001c);
	if (pthread_join(thread, NULL))
	  perror ("join");
	return 0;
}

int main(int argc, char** argv) {
	return pure_test();
}

--J/dobhs11T7y2rNN--
