Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3683F482A
	for <parisc-linux@parisc-linux.org>; Sun, 21 Oct 2001 13:36:23 -0600 (MDT)
Received: from ppp16.scram.de (ppp16.scram.de [195.226.127.209])
	by mail.scram.de (8.11.0/8.11.0) with ESMTP id f9LJaKC03282
	for <parisc-linux@parisc-linux.org>; Sun, 21 Oct 2001 21:36:20 +0200 (CEST)
Date: Sun, 21 Oct 2001 21:34:34 +0200 (CEST)
From: Jochen Friedrich <jochen+parisc-linux@scram.de>
To: <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0110212131060.29072-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Latest debian binutils broken?
List-ID: <linux-parisc.vger.kernel.org>

Hi,

with the latest debian binutils, as immediately crashes on my 720:

hp720:~# uname -a
Linux hp720.bocc.de 2.4.9-pa59 #1 Wed Oct 17 21:38:10 CEST 2001 parisc unknown
hp720:~# dpkg -l binutils
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  binutils       2.11.92.0.7-2  The GNU assembler, linker and binary utiliti
hp720:~# as
Segmentation fault

do_page_fault() pid=370 command='as' type=6 address=0x00000003

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000100001111
r0-3     00000000 00067d80 40093323 bff003c0
r4-7     400b1b98 4002a09c 40028a64 bff00164
r8-11    bff0015c 00000001 00000001 000c49f0
r12-15   00000000 ffffffff 000c4dd0 00000000
r16-19   00000000 00000004 00000004 400b1b98
r20-23   00000000 40032ce0 00000000 400288f8
r24-27   bff00164 bff0015c 00000001 0005fbe4
r28-31   40029ca2 7efefeff bff00440 40093323
sr0-3    00000000 00000005 00000000 00000005
sr4-7    00000005 00000005 00000005 00000005

IASQ: 00000005 00000005 IAOQ: 00000003 00000007
 IIR: 2022e202    ISR: 00000005  IOR: 00067d7c
 CPU:        0   CR30: 105f0000 CR31: 102f0000
 ORIG_R28: 4002a09c

Looks like a classical NULL-pointer to me...

Cheers,
Jochen
