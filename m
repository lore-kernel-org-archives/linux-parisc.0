Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id C453A482B
	for <parisc-linux@parisc-linux.org>; Fri, 26 Oct 2001 16:19:19 -0600 (MDT)
To: parisc-linux@parisc-linux.org, amodra@bigpond.net.au
Date: Fri, 26 Oct 2001 16:19:17 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15xFJt-0006F5-00@noam.fc.hp.com>
Subject: [parisc-linux] python (toolchain really) problems
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

One good reason not to upgrade right now is python is broken, but I'm
pretty sure this is a dynamic linker bug.  I tried my test against
glibc 2.2.4-4 which is currently in incoming.

_start is making it's first function call:

0x1053c <_start+40>:    ldil 20800,dp
0x10540 <_start+44>:    ldo 8(dp),dp
0x10544 <_start+48>:    b,l 0x104d4 <_init+56>,rp

to here:

000104d4 <.text>:
   104d4:       2b 60 00 00     addil 0,dp,%r1
   104d8:       48 35 02 58     ldw 12c(sr0,r1),r21
   104dc:       ea a0 c0 00     bv r0(r21)
   104e0:       48 33 02 60     ldw 130(sr0,r1),r19

r21 contains '0xdeadbeef' -- here are the details:

do_page_fault() pid=16052 command='python2' type=6 address=0x00c0ffef
vm_start = 0x00020000, vm_end = 0x00021000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111
r0-3     0000000000000000 0000000000020808 000000000001054f 0000000040029abc
r4-7     000000004024d048 00000000000bfef0 00000000000bfc30 00000000000bfc30
r8-11    00000000ffffffff 00000000000b9010 00000000000bfd70 00000000000bfcb0
r12-15   0000000000000000 00000000ffffffff 00000000000bfcf0 0000000000000000
r16-19   0000000000000000 0000000000000004 0000000000000004 0000000000020808
r20-23   0000000000020958 00000000deadbeef 0000000000c0ffee 000000000002090e
r24-27   00000000bff003b8 0000000000000001 0000000000020916 0000000000020808
r28-31   0000000000000000 000000007efefeff 00000000bff00580 000000004000ddf7
sr0-3    0000000000001c80 0000000000001c80 0000000000000000 0000000000001c80
sr4-7    0000000000001c80 0000000000001c80 0000000000001c80 0000000000001c80

IASQ: 0000000000001c80 0000000000001c80 IAOQ: 0000000000c0ffef 0000000000c0fff3
 IIR: 43ffff80    ISR: 0000000000001c80  IOR: 000000004033a08c
 CPU:        0   CR30: 0000000013f24000 CR31: 0000000010450000
 ORIG_R28: 00000000bff00b08

$ dpkg --list python2-base libc6
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
iF  python2-base   2.0.1-1.1      An interactive object-oriented scripting lan
ii  libc6          2.2.4-4        GNU C Library: Shared libraries and Timezone

I'll try rebuilding python...

	-Paul Bame
