Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 409D9482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 08:59:41 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15dvCO-0004Dg-00; Mon, 03 Sep 2001 15:59:40 +0100
Date: Mon, 3 Sep 2001 15:59:40 +0100
From: Matthew Wilcox <willy@debian.org>
To: Hannu Martikka <martikka@penguin3.ntc.nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel panics on 715/80
Message-ID: <20010903155940.I5126@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.30.0109031623080.14451-100000@penguin3.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.30.0109031623080.14451-100000@penguin3.ntc.nokia.com>; from martikka@penguin3.ntc.nokia.com on Mon, Sep 03, 2001 at 05:21:09PM +0300
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 03, 2001 at 05:21:09PM +0300, Hannu Martikka wrote:
> Hei,
> 
> I just downloaded kernel-2.4.9 (linux-20010901.tar.gz) and compiled it
> with default configuration (I selected the 7100LC cpu) on my 715/80. I was
> successfully running the 2.4.0 kernel from 0.9.2 cd-image.
> 
> Any ideas what went wrong?

Nope; two hints.  First, you can look up 102ee3c4 and 1010afd0 in your
System.map -- that'll tell you which function it's in and what function
called it, respectively.  Secondly, you can define EARLY_BOOTUP_DEBUG
in arch/parisc/kernel/pdc_cons.c and recompile.  That'll show where it
dies.  This crash concerns me a little since I tested CVS kernel a couple
of days ago on a 715/80.

>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000011000000000000001111
> r0-3     00000000 2000003c 1010afd0 1034c76c

r2 is the return address -- ie our caller.

> r4-7     f0200000 1034c010 00000005 10348628
> r8-11    10348609 00000008 0004000e 102ecf94
> r12-15   00000000 00000001 00000001 f0000704
> r16-19   f000b858 00000002 00000000 00000000
> r20-23   00005e00 0000000b 00000010 0000008e
> r24-27   00000000 1034c1e0 1034c770 102a4010
> r28-31   00000000 102b6810 10348980 f0012870
> sr0-3    00000000 00000000 00000000 00000000
> sr4-7    00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 102ee3c4 102ee3b4

and IAOQ is the address of the executing instruction and the next
instruction -- interestingly the instruction that faulted is in the
delay slot of a branch.

>  IIR: 0c201093    ISR: 00000000  IOR: 2000003c
>  ORIG_R28: 00000000

-- 
Revolutions do not require corporate support.
