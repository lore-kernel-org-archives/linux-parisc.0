Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 52B09482B
	for <parisc-linux@parisc-linux.org>; Fri, 26 Oct 2001 17:15:33 -0600 (MDT)
To: parisc-linux@parisc-linux.org, amodra@bigpond.net.au
Subject: Re: [parisc-linux] python (toolchain really) problems 
In-Reply-To: Your message of "Fri, 26 Oct 2001 16:19:17 MDT."
             <E15xFJt-0006F5-00@noam.fc.hp.com>
References: <E15xFJt-0006F5-00@noam.fc.hp.com> 
Date: Fri, 26 Oct 2001 17:15:31 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15xGCJ-0006L7-00@noam.fc.hp.com>
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

Well hello world doesn't build with libc6 2.2.4-4 so I went back to -3
and here's what happens to python then:

(gdb) where
#0  0x400453ec in _init () from /usr/lib/libpython2.0.so.0.0
#1  0x40045124 in _init () from /usr/lib/libpython2.0.so.0.0
#2  0x4000dd64 in call_init () from /lib/ld.so.1
#3  0x4000ded4 in _dl_init () from /lib/ld.so.1
#4  0x40002b68 in _dl_start_user () from /lib/ld.so.1

(gdb) disassemble 0x400453ec
No function contains specified address.
[ELF header dump attached]

(gdb) disassemble 0x40045110
Dump of assembler code for function _init:
0x40045104 <_init>:     stw rp,-14(sr0,sp)
0x40045108 <_init+4>:   stw,ma r4,40(sr0,sp)
0x4004510c <_init+8>:   stw r19,-20(sr0,sp)
0x40045110 <_init+12>:  b,l 0x400450f4 <_dl_pagesize+110644>,rp
0x40045114 <_init+16>:  copy r19,r4
0x40045118 <_init+20>:  copy r4,r19
0x4004511c <_init+24>:  b,l 0x400453cc <_init+712>,rp
0x40045120 <_init+28>:  nop
0x40045124 <_init+32>:  copy r4,r19
0x40045128 <_init+36>:  b,l 0x400450e8 <_dl_pagesize+110632>,rp
0x4004512c <_init+40>:  nop
0x40045130 <_init+44>:  copy r4,r19
0x40045134 <_init+48>:  ldw -54(sr0,sp),rp
0x40045138 <_init+52>:  copy r4,r19
0x4004513c <_init+56>:  bv r0(rp)
0x40045140 <_init+60>:  ldw,mb -40(sr0,sp),r4

(gdb) disassemble 0x400453cc
No function contains specified address.

So it looks like _init+24 is branching to 0x400453cc:

$ ldd python2
        libpython2.0.so.0.0 => /usr/lib/libpython2.0.so.0.0 (0x4002b000)
        libpthread.so.0 => /lib/libpthread.so.0 (0x40102000)
        libdl.so.2 => /lib/libdl.so.2 (0x4012b000)
        libutil.so.1 => /lib/libutil.so.1 (0x4013e000)
        libm.so.6 => /lib/libm.so.6 (0x40150000)
        libc.so.6 => /lib/libc.so.6 (0x401e1000)
        /lib/ld.so.1 => /lib/ld.so.1 (0x40000000)


$ objdump -h /usr/lib/libpython2.0.so.0.0

/usr/lib/libpython2.0.so.0.0:     file format elf32-hppa-linux

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  8 .text         0007e700  0001a144  0001a144  0001a144  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE

 17 .plt          00002794  000cfe54  000cfe54  000bfe54  2**2
                  CONTENTS, ALLOC, LOAD, CODE
 18 .got          000023d8  000d25e8  000d25e8  000c25e8  2**2
                  CONTENTS, ALLOC, LOAD, DATA


Disassembly of section .text:

0001a144 <.text>:
   1a144:       e8 20 00 00     b,l 0x1a14c,r1
   1a148:       28 39 60 00     addil 73000,r1,%r1
...

   1a3cc:       6b c2 3f d9     stw rp,-14(sr0,sp)		BRANCH TARGET
   1a3d0:       08 03 02 41     copy r3,r1
   1a3d4:       08 1e 02 43     copy sp,r3
   1a3d8:       6f c1 01 00     stw,ma r1,80(sr0,sp)
   1a3dc:       6b d3 3f c1     stw r19,-20(sr0,sp)
   1a3e0:       0c 73 12 90     stw  r19,8(sr0,r3)
   1a3e4:       2a 60 00 00     addil 0,r19,%r1
   1a3e8:       48 21 0f 68     ldw 7b4(sr0,r1),r1
   1a3ec:       0c 20 10 94     ldw  0(sr0,r1),r20		DIES HERE
   1a3f0:       86 80 20 42     cmpib,=,n 0,r20,0x1a418

do_page_fault() pid=14736 command='python2' type=15 address=0x000bb938
vm_start = 0x00020000, vm_end = 0x00021000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     0000000000000000 00000000000bb938 0000000040045127 00000000bff00680
r4-7     00000000400fce54 000000004002a09c 0000000040028a64 00000000bff003d0
r8-11    00000000bff003c8 0000000000000001 0000000000000001 00000000000cd670
r12-15   0000000000000000 00000000ffffffff 00000000000cd470 0000000000000000
r16-19   0000000000000000 0000000000000004 0000000000000004 00000000400fce54
r20-23   0000000000000001 00000000400c3840 0000000040045104 00000000400288f8
r24-27   00000000bff003d0 00000000bff003c8 0000000000000001 0000000000020808
r28-31   0000000040029a56 000000007efefeff 00000000bff00700 000000004000dd67
sr0-3    00000000009db680 00000000009db680 0000000000000000 00000000009db680
sr4-7    00000000009db680 00000000009db680 00000000009db680 00000000009db680

IASQ: 00000000009db680 00000000009db680 IAOQ: 00000000400453ef 00000000400453f3
 IIR: 0c201094    ISR: 00000000009db680  IOR: 00000000000bb938
 CPU:        0   CR30: 000000002dd9c000 CR31: 0000000010450000
 ORIG_R28: 00000000bff00b08

The dp is libpython + 0xd1e54 which is inside the .plt section.

Maybe a linker problem?

ii  binutils       2.11.92.0.10-1 The GNU assembler, linker and binary utiliti


	-P
