Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13DDC482A
	for <parisc-linux@parisc-linux.org>; Mon, 28 May 2001 15:41:29 -0600 (MDT)
To: bame@debian.org
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] some information on apt woes 
In-Reply-To: Your message of "Sat, 26 May 2001 22:08:09 MDT."
             <m153rqb-001VltC@bame.riverrock.org>
References: <m153rqb-001VltC@bame.riverrock.org> 
Date: Mon, 28 May 2001 15:41:27 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E154UlT-0002zr-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Apt 0.4.0 repeatable problem details (may be other problems too):
(This does not look like a VM problem like 0.5.3 does in this case)

$ sudo rm /var/cache/apt/*.bin
$ sudo apt-get update
...
Fetched 1521kB in 5s (256kB/s)                     
Segmentation faultsts... 87%
$ dmesg | tail -20

do_page_fault() pid=11284 command='apt-get' type=6 address=0x322e3137
vm_start = 0x0001f000, vm_end = 0x0003c000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001111
r0-3     0000000000000000 00000000003fd700 000000004008b74b 000000000001f850
r4-7     00000000400ca8e0 0000000000026140 000000007ff01010 000000007ff00e64
r8-11    000000007ff00f60 000000007ff01020 0000000000368dee 000000007ff00dc8
r12-15   000000007ff00e60 0000000000000030 000000007ff00df8 000000007ff00df0
r16-19   000000007ff00c50 000000007ff00de4 000000007ff00c38 000000002d737061
r20-23   000000000001e5c8 0000000000000000 00000000322e3137 0000000000000001
r24-27   0000000000000001 0000000000000003 0000000000026120 000000000001d900
r28-31   0000000000000001 0000000000000000 000000007ff01100 000000004008b74b
sr0-3    00000000003fd700 00000000003fd700 0000000000000000 00000000003fd700
sr4-7    00000000003fd700 00000000003fd700 00000000003fd700 00000000003fd700

IASQ: 00000000003fd700 00000000003fd700 IAOQ: 00000000322e3137 00000000322e313b
 IIR: 43ffff80    ISR: 00000000003fd700  IOR: 000000004001f148
ORIG_R28: 0000000000127acc

Note that the IAOQ is the string "2.14" so this one looks like a wild
function pointer dereference.  The code at %rp says:

   6072c:       0d 80 10 9a     ldw  0(sr0,r12),r26
   60730:       87 40 20 2a     cmpib,=,n 0,r26,0x6074c
   60734:       0f 58 10 94     ldw  c(sr0,r26),r20
   60738:       34 19 00 06     ldi 3,r25
   6073c:       0e 90 10 96     ldw  8(sr0,r20),r22
   60740:       eb f0 11 d8     b,l 0x81034,r31
   60744:       08 1f 02 42     copy r31,rp

which goes to here, which looks like it's probably $$dyncall()

   81034:       c7 d6 c0 12     bb,*>=,n r22,1e,0x81044
   81038:       d6 c0 1c 1e     depwi 0,31,2,r22
   8103c:       0e c8 10 93     ldw  4(sr0,r22),r19
   81040:       0e c0 10 96     ldw  0(sr0,r22),r22
   81044:       ea c0 c0 00     bv r0(r22)
   81048:       6b c2 3f d1     stw rp,-18(sp)
