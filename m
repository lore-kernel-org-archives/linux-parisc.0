Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id D75994A18
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Jan 2001 12:26:03 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13867
	for <parisc-linux@puffin.external.hp.com>; Wed, 31 Jan 2001 12:21:51 -0700
Message-Id: <200101311928.LAA29457@milano.cup.hp.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.1 Bits Won't Drive C100 
In-reply-to: Your message of "Wed, 31 Jan 2001 13:04:43 PST."
             <Pine.LNX.4.21.0101311234240.28937-100000@maestro.symsys.com>
Date: Wed, 31 Jan 2001 11:28:05 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Greg Ingram wrote:

> Er, no, using the config I've been using.

I proposed the update/distclean/oldconfig/dep/palo sequence
only becase that's the only way for me to translate
hex addresses posted in the output to symbols.

I generally don't have time to build kernels based on .config's
posted here (few exceptions).

> > Or have you been able to boot kernels since the 2.4.0 merge?
> 
> Yes, my latest working kernel is:
> 
> 	Linux apollos 2.4.0 #7 Fri Jan 26 10:52:17 CST 2001 parisc unknown
...
> I'm going to experiment with some config changes now.

Ok.

But with this output I can tell you more about where to look
for the problem. These are steps anyone can do before posting
to the list.

> Data access rights fault in kernel: Code=26 regs=c7f9c7c0 (Addr=00000004)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001011
> r0-3     00000000 c02c7800 c02971c0 00000000
> r4-7     c7ffc200 ffffffff c01e5e40 c0284000
> r8-11    c02c8000 000000f0 00000000 c028d930
> r12-15   00000000 0000004d 00000001 00000000
> r16-19   f00010f4 f00000ac f00000a4 00000000
> r20-23   c7f9c74e 00000002 c0297424 ffd07000
> r24-27   c7f9c750 00000f20 00000000 c0260000
> r28-31   00000001 00000000 c7f9ca00 002b1638
> sr0-3    00000000 00000000 00000000 00000000
> sr4-7    00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: c02971dc c02971e0
>  IIR: 0e681096    ISR: 00000000  IOR: 00000004
> ORIG_R28: c0275000

IAOQ: 0xc02971dc i82596_probe+68 (current Instruction address)
GR02: 0xc02971c0 i82596_probe+4c (ret address of most recent subroutine call)

And feeding IIR to adb on an HPUX box ("echo 0x0e681096=i | adb") says:

                LDW             4(r19),r22

Clearly a NULL ptr dereference in the driver for LASI's built-in 10BT.

If you want more data, last night I committed a script
to CVS build-tools called "astk". Uses Paul Bames "a" to lookup
known symbols from raw "Dumping Stack from.." hex output.

hope this helps,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
