Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA23968
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Dec 2000 09:30:54 -0700
Message-ID: <3A310D3D.1208AAF3@bawue.de>
Date: Fri, 08 Dec 2000 17:33:01 +0100
From: Andreas Thienemann <andreas@bawue.de>
MIME-Version: 1.0
To: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>,
        "'thuis'" <digihans@wishmail.net>
Subject: Re: [parisc-linux] FW: hp_boot.log
References: <1A8904C3797ED411AC2E0008C7E6F88117C6A0@nlntmail2b.ats.nld.alcatel.nl>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Hans,

"Witvliet, Hans" wrote:

> I had the impression that the C110 was supported, however when booting from
> cd (from palinux.05.iso) i got following results:
Interesting.

This does resemble the crash I'm experiencing on my D250.

The Kernel boots, finds some Hardware and than dumps stack. Somewhere after
the message "Posix Conformance tested".

The following is from my fault message:
---
Data access rights fault in kernel: Code=26 regs=c7f9c7c0 (Addr=00000004)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001011
r0-3     00000000 c0291800 c02712ec 00000000
r4-7     c7ffc400 ffffffff c01c3870 c025d800
r8-11    c0292800 000000f0 00000000 000000ff
r12-15   000000f2 000000fa 000000fd f0100000
r16-19   f0001180 f0000070 f0000068 00000000
r20-23   c7f9c74e 00000002 c0271574 ffd07000
r24-27   c7f9c750 00000f20 00000000 c023a000
r28-31   00000001 00000000 c7f9ca00 0027b9b8
sr0-4    00000000 00000000 00000000 00000000
sr4-8    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c0271308 c027130c
 IIR: 0e681096    ISR: 00000000  IOR: 00000004
ORIG_R28: 000000fd
---

I guess it has something to do with the "i82596_probe".
Could you do a lookup of the IAOQ Register to see if it is the same?
Get the "build-tools" from the CVs, and use the "a" program to lookup the
symbol in your system-map.

bye,
 andreas
