Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA25506
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 10:59:24 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 20 Nov 2000 18:01:32 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9571CB005; Mon, 20 Nov 2000 17:58:38 +0000 (GMT)
Date: Mon, 20 Nov 2000 17:58:38 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001120175838.Q32715@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] signal handling problems (32 bit kernel)
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  Following on from my problems with SEGV last week, I've come up with
a few signal handling issues:

=============================================================

parisc:signal.c

        /* Possibly bogus. */
#warning XXX FIXME probably bogus -PB
        /* I think this is bogus -- it'll cause the first instn of the
         * signal handler to be executed twice!  Better might be to
         * set iaoq[0] to one of the NOPs in the trampoline. -PB
         */
        regs->iaoq[0] = (unsigned long) haddr | 3;
        regs->iaoq[1] = (unsigned long) haddr | 3;

This causes real problems if the signal handler is a dynamic object
which has not yet been resolved; in that case the signal handler
points at the b,l instr in the following at the end of the .plt:

    2700:       0e 80 10 96     ldw  0(sr0,r20),r22
    2704:       ea c0 c0 00     bv r0(r22)
    2708:       0e 88 10 95     ldw  4(sr0,r20),r21
    270c:       ea 9f 1f dd     b,l 2700 <__DTOR_END__+0x54>,r20
    2710:       d6 80 1c 1e     depwi 0,31,2,r20

typically that results in a misalligned access on the first ldw
as r20 is screwed.

I've fixed that by setting iaoq[1] = iaoq[0]+4.  Is that OK, or
should we use the NOP approach in the comment above?

=============================================================

If a program gets a SEGV, fixes the cause of it in its signal
handler, and returns, then the faulting instruction is not rerun.
I think that's wrong (differs from m68k anyway).

=============================================================

Set the following program running:

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>

int v[8];

void (* fp)(int);

void sig_handler(int sig)
{
}

void poke(int i)
{
        v[0] = i; v[1] = i; v[2] = i; v[3] = i;
        v[4] = i; v[5] = i; v[6] = i; v[7] = i;
}

int main()
{
        int j, i = 0;
        struct sigaction act;

        memset(&act, 0, sizeof(act));
        act.sa_handler = sig_handler;
        sigaction(SIGUSR1, &act, NULL);

        fp = sig_handler;
        fp(0);
        printf("I am %d\n", getpid());
        while (1) {
                poke (++i);
                j = v[7];
                if (j != i)
                        printf("Wah!\n");
        }
}


and then in another terminal do 'kill -USR1 <pid>'.  The program
either goes 'Wah!', gives a SEGV, or works.  That seems to be because
%r1 is corrupted while processing the signal.  The signal handler ends
with a syscall (rt_sigreturn_wrapper), and %r1, at least, is not saved
and restored over the syscall.  %r31 also appears to get corrupted, as
it is used in the final branch of the syscall return.

Richard
