Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mout1.freenet.de (mout1.freenet.de [194.97.50.132])
	by dsl2.external.hp.com (Postfix) with ESMTP id 456A4482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jul 2001 03:41:28 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Reply-To: Reinhard.Gimbel@freenet.de
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 15 Jul 2001 11:26:46 +0200
Cc: okraus@t-online.de
MIME-Version: 1.0
Message-Id: <01071511264600.00948@octopus>
Subject: [parisc-linux] palinux-0.9.2: Installation fails on C180
List-ID: <linux-parisc.vger.kernel.org>

Hi folks !

Recently I bought an C180 at a local 2nd hand computer store. 

I tried to install the latest palinux-0.9.2 (esiee.fr), but the 
installation failed :-(

The download itself went ok (md5sums ok), no probs while 
burning the ISO image (using xcdrgtk). The C180 boots from the 
CD-R, the system can be set up (HD partitioning, creating the 
ext2 filesystems, etc.) but during heavy traffic on the SESCSI 
bus the system crashes (sometime during kernel installation, 
sometimes during base system installation).

I double-checked the hardware (cables, termination, also 
replaced the CD-R drive by another one).

In the log file (minicom log from my Intel-Linux box) I could 
find the following lines which may be could give a hint what's 
going on (or even not ...). Furthermre you can find the 
postmorted registerdump:

[...]

Dino version 2.1 (bridge mode) found at 0xf2000000
 
 
The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
data corruption.  See Service Note Numbers: A4190A-01, 
A4191A-01.
Systems shipped after Aug 20, 1997 will not exhibit this 
problem.
Models affected: C180, C160, C160L, B160L, and B132L 
workstations.
 
dino_bridge_init: IO_ADDR_EN hasn't been configured.
kernel BUG at dino.c:808!

[...]

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111100100001110
r0-3     00000000 102b2810 101c97cc 1f7a3a00
r4-7     1f7a3a28 00000006 00000000 00000000
r8-11    1f7a2000 000000ff 1fe02a74 00000200
r12-15   102b2810 00000001 00000400 1f584688
r16-19   1f584588 00000000 00000000 dae998dc
r20-23   00000008 1e1fc500 00000000 0000000f
r24-27   00000000 00000006 1f7a2000 1028a010
r28-31   00000000 00000400 1f584dc0 101bd938
sr0-3    00000000 000000b5 00000000 000000b5
sr4-7    00000000 00000000 00000000 00000000
 
IASQ: 00000000 00000000 IAOQ: 101d3004 101d3008
 IIR: 0e641288    ISR: 00000000  IOR: dae998e0
 ORIG_R28: 1073e740

[...]

I do not know when my maschine was shipped (as I wrote above 
it's a used one).

Because the STI installation did not lead to any success 
currently I'm using serial_1 as the boot console.

I do not have much knowledge from HP workstations (but some 
knowledge from older SUN workstations, much VME-bus knowledge 
[older Motorola-CPUs], much Intel-PC knowledge)

Has anybody outthere an idea ?

Many thanks in advance for your help !

Reinhard.
