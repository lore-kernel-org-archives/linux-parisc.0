Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA07127
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Sep 2000 14:11:51 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 12 Sep 2000 20:12:16 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13YwPY-0007Oh-00
	for <parisc-linux@thepuffingroup.com>; Tue, 12 Sep 2000 16:12:08 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 12 Sep 2000 16:12:08 -0400
Message-ID: <87em2pmktj.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] userspace function pointers in the kernel
List-ID: <linux-parisc.vger.kernel.org>

Hi,

This simple program:

#include <signal.h>

void foo(int signo)
{
	psignal(signo, "foo");
}

int main()
{
	signal(SIGFPE, foo);
	return 0;
}

Now causes the kernel (latest from CVS) to crash where it didn't
before:

Kernel Fault: Code=15 regs=c7c44600 (Addr=00002c04)

PSW  : 0006ff0a  GR 1 : c0233000  GR 2 : c011dcf0  GR 3 : c7c44518  
GR 4 : 20020350  GR 5 : 00000008  GR 6 : 00000007  GR 7 : 00000008  
GR 8 : c7c44600  GR 9 : 2002114c  GR10 : 20020670  GR11 : 00000040  
GR12 : 00000001  GR13 : 00000078  GR14 : 00057000  GR15 : 00057000  
GR16 : 00000063  GR17 : 00000020  GR18 : 2002058c  GR19 : 00000000  
GR20 : 00002c06  GR21 : c7f2387c  GR22 : fffffff8  GR23 : c7f23880  
GR24 : c7c44528  GR25 : c7c44518  GR26 : 00002c04  GR27 : c027a000  
GR28 : fffffff2  GR29 : 00002c06  GR30 : c7c44840  GR31 : c011d7c8  
SR0  : 00002002  SR1  : 00002002  SR2  : 00000000  SR3  : 00002002  
SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000  

IASQ : 00000000 00000000 IAOQ : c02336a0 c02336a4 ORIG_R28 : 00003fff
 IIR : 075f11d6 ISR : 00000000 IOR : 00002c04

Which is:

c0233698 <$$sh_func_adrs>:
c0233698:       37 5d 00 00     ldo 0(r26),ret1
c023369c:       d7 40 0c 3f     depw r0,30,1,r26
c02336a0:       07 5f 11 d6     probe,w (sr0,r26),r31,r22
                                ^^^^^^^^^^^^^^^^^^^^^^^^^  this insn
c02336a4:       d2 d6 3b ff     extrw,u,= r22,31,1,r22
c02336a8:       0f 40 10 9d     ldw  0(sr0,r26),ret1
c02336ac:       eb e0 c0 02     bv,n r0(r31)

Following the millicode return pointer takes us to do_signal() in
kernel/signal.c, somewhere around these lines:

		if (k->sa.sa_handler == SIG_IGN
		    || (k->sa.sa_handler == SIG_DFL

Note that the kernel is trying to compare a function pointer passed in
from userspace with an arbitrary value.

Now, first of all, this means our DTLB miss handler is broken with
respect to the PROBE instructions.  According to the architecture
manual,

        Notes: If this instruction causes a non-access data TLB miss
        fault/non-access data page fault, the operating system's
        handler is required to search its page tables for the given
        address. If found, it does the appropriate TLB insert and
        returns to the interrupting instruction. If not found, the
        handler must decode the target field of the instruction, set
        that GR to 0, set the IPSW[N] bit to 1, and return to the
        interrupting instruction.

Obviously that's not what's happening here.

Next, even if we *weren't* trapping we would still be doing the wrong
thing, because $$sh_func_adrs is actually supposed to give us the
address of the function's code, and it isn't going to do this since
the function lives in a different space.

In the case of sigaction() I think we actually want to compare the
plabel value (rather than the code address) againsr SIG_IGN and
SIG_DFL.  However there may be other cases where this will break.

Yes this is yet another side effect of the broken PA-RISC run time
architecture.  What do the IA-64 people do about this problem?

In the worst case scenario we may have to hack our millicode in the
kernel somewhat to deal with this.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
