Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sgate.charlysworld.de (pD95055C6.dip.t-dialin.net [217.80.85.198])
	by dsl2.external.hp.com (Postfix) with ESMTP id E67764A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 19:04:45 -0700 (MST)
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.11.0/8.11.0) with ESMTP id f1924iY26349
	for <parisc-linux@lists.parisc-linux.org>; Fri, 9 Feb 2001 03:04:44 +0100
Date: Fri, 9 Feb 2001 03:04:44 +0100 (CET)
From: "M. Grabert" <xam@deathsdoor.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0102090239110.25675-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] ASP Parallel port driver broken on HP9000/730
List-ID: <linux-parisc.vger.kernel.org>

Hello there,

As I said before (in another mail), the ASP parallel port driver
is broken: the kernel hangs (lastest CVS, one hour ago).
Everything's fine just without ASP parallel port driver!

Unfortunately I don't know how to redirect the kernel output
to the serial console, so I can give you only some hints...



parport_init_chip: initializing bidirectional mode.

The kernel makes a memory dump from 0000 to 097f,
then:

High Priority Machine Check (HPMC): Code=1 regs=c034a080 (Addr=00000000)

Then follows a dump of the processor registers:

PSW: 00000000000001000000000000001111
r0-3   00000000 c02eb800 c0246328 c1f30788
r4-7   0000002c c1fe5220 f0824800 ffffffdf
r8-11  ffffffff 00000000 0004000e c037d8b0
r12-15 000a5a59 000ff000 f0000124 00000000
r16-19 00000001 50000059 0a000a00 0000000f
r20-23 000000ff 00000041 c1fdc000 0000000f
r24-27 ffffffff f0824800 f0824800 c0342000
r28-31 00000034 00000800 c1fe0980 c012a7dc
sr0-3  00000000 00000000 00000000 00000000
sr4-7  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c026e458 c026e458
 IIR: e840c000     ISR: 00000000   IOR: c0246328
ORIG_R28: 00000000


NB: i typed all this stuff, no copy'n'paste; so perhaps
there are some errors ... 

BTW, no HIL connected, just serial console (but since
the kernel hangs before, i cannot see any output :))).
No PC parport selected, no support for foreign h/w,
no IEEE 1284 transfer modes ...)


hope that helps!


greetings max
