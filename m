Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp9.xs4all.nl (smtp9.xs4all.nl [194.109.127.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DD93482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 13:49:12 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp9.xs4all.nl (8.9.3/8.9.3) with ESMTP id VAA04295
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 21:49:10 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Fri, 21 Sep 2001 21:48:50 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nmap -O -> kernel panic on 712
Message-ID: <20010921214850.B5505@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010917165501.B17483@gollum.intranet.nimag.net> <20010917203312.A6109@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010917203312.A6109@middle.of.nowhere>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 17, 2001 at 08:33:12PM +0200, thunder7@xs4all.nl wrote:
> On Mon, Sep 17, 2001 at 04:55:01PM +0200, Francois Deppierraz wrote:
> > Hi kernel hackers !
> > 
> > My HP 712/60 with a 2.4.9-pa20 kernel crash with the following error
> > message when I portscan it using nmap -O (OS detection).
> > 
> > kswapd[4]: Unaligned data reference 28
> > 
> >      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00000000000001001111111000001111
> > r0-3o 00000000 10332810 1028b9e4 0000000a
> > r4-7o 100dfdb2 100ed148 0000000c 100dfd94
> > r8-11o 00000000 00000001 00020000 10ce6500
> > r12-15o 11fb09a0 00004400 00004800 43f02aa9
> > r16-19o 100eca00 00000000 00000c00 00000001
> > r20-23o 00000000 00000109 117ca000 0000000f
> > r24-27o 00000000 100ed148 10ce6500 102f0010
> > r28-31o 117ca160 00000040 100ed400 1012e6d8
> > sr0-3o 00000000 00000002 00000000 00000002
> > sr4-7o 00000000 00000000 00000000 00000000
> > 
> > IASQ: 00000000 00000000 IAOQ: 10281658 1028165c
> >  IIR: 0c801093    ISR: 00000000  IOR: 100dfdb2
> >  CPU:        0   CR30: 100ec000 CR31: 103a0000
> >  ORIG_R28: 00000000
> > Kernel Panic: Aiee, killing interrupt handler!
> > In interrupt handler - not syncing
> > 
Why isn't the code in arch/parisc/kernel/unaligned.c activated for this?
I found some references in the 2001-06 archive to this file, which seems
to work for 64-bits kernels (which I haven't tested) but not for
32-bits.

Can any of the guru's point some newbies in the right direction?
unaligned.c exists, and is pointed to in traps.c, so there must be some
code in it that doesn't work. I can run the test-program that was posted
in 2001-06 just fine.


#include <stdio.h>

struct data_t {
        unsigned long a;
        unsigned long b;
};

int main(int argc, char **argv)
{
        struct data_t data;
        unsigned char *t;
        unsigned long l;
        int i;

        data.a = 0x12345678;
        data.b = 0x87654321;

        t = (unsigned char *)(&data)+1;
        l = *((unsigned long *)t);
        printf("l = 0x%08lx\n\n\n", l);

        printf("expected result is: 0x");
        for (i = 0; i < sizeof(unsigned long); i++)
                printf("%x", *(t+i));
        printf("\n");

        printf("testing store...\n");
        *((unsigned long *)t) = 0x13572468;

        l = *((unsigned long *)t);
        printf("l = 0x%08lx\n", l);

        return 0;
}

And it prints:

jurriaan@pa8200:~$ cc test.c
./a.jurriaan@pa8200:~$ ./a.out
l = 0x34567887
expected result is: 0x34567887
testing store...
l = 0x13572468

which seems to be what is expected.

I can see that in unaligned.c, the part for in-kernel traps is #if 0'ed
out, with a big TODO. What is there TODO?

I'm willing to do stupid work, and test my machine 30 times in a row, if
someone can point me in the right direction?

Thanks,
Jurriaan
-- 
It is a matter of words. In my birth language there are more ifs than
whens, but I must make a choice every time I speak a sentence in English.
I try to choose the happier way of saying things, so that my own words
will not weigh me down like stones.
	!Xabbu in Tad Williams' Otherland
GNU/Linux 2.4.9-ac10 SMP/ReiserFS 2x1402 bogomips load av: 0.00 0.00 0.00
