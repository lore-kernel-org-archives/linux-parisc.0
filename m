Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 404604838
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Jun 2002 18:22:26 -0600 (MDT)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Cc: richard_hirst@linuxcare.com
Content-Type: text/plain
Date: 16 Jun 2002 18:22:24 -0600
Message-Id: <1024273345.27050.26.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] Unaligned access failures with apt-get on SMP K460.
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

Hello parisc-linux hackers,

I (with a lot of help from Richard) am  looking into a problem with
apt-get .... on a SMP kernel for the K460. 

The problem is that when I run apt-get <command> I get the following
error message:
	apt-get(<PID>): unaligned access to 0x403ce094 at ip=0x4005e47f

This kernel has the DEBUG_UNALIGNED defined in
arch/parisc/kernel/unaligned.c to provide additional debug information
for unaligned accesses.





Here is the trace from the apt-get install sudo:

rebel:~# gdb /usr/bin/apt-get
GNU gdb 2002-04-01-cvs
Copyright 2002 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you
are
welcome to change it and/or distribute copies of it under certain
conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for
details.
This GDB was configured as "hppa-linux"...(no debugging symbols
found)...
(gdb) break main
Breakpoint 1 at 0x24554
(gdb) run install sudo
Starting program: /usr/bin/apt-get install sudo
(no debugging symbols found)...(no debugging symbols found)...
(no debugging symbols found)...(no debugging symbols found)...
(no debugging symbols found)...
Breakpoint 1, 0x00024554 in main ()
(gdb) continue
Continuing.
apt-get(165): unaligned access to 0x403ce094 at ip=0x4005e47f

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000000000000000000000000 Not tainted
r00-03  00000000 00044a20 40098df3 403ce08c
r04-07  00000038 40111868 faf00c18 00049da4
r08-11  00049da0 faf00f18 faf01368 faf00e4c
r12-15  000129e7 faf00bf0 faf00a88 faf00bcc
r16-19  faf006c8 0000000a faf005b8 40111868
r20-23  000022c8 00000166 00000000 403ce044
r24-27  faf01368 00000038 000022c8 00040220
r28-31  0004a900 400c65a7 faf01500 000282a3
sr0-3   00000097 0000008f 00000000 00000097
sr4-7   00000097 00000097 00000097 00000097

IASQ: 00000097 00000097 IAOQ: 4005e47f 4005e483
 IIR: 0c751290    ISR: 00000097  IOR: 403ce094
 CPU:        2   CR30: ee294000 CR31: 11111111
 ORIG_R28: 00000001
unaligned.c:183:emulate_store <7>store r21 (0x00000166) to
00000097:403ce094 for 4 bytes
unaligned.c:365:handle_unaligned <7>ret = 0
apt-get (pid 165): Illegal instruction (code 8)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000000000000000000000000 Not tainted
r00-03  00000000 ee58c000 40098df3 403ce08c
r04-07  00000038 40111868 faf00c18 00049da4
r08-11  10356810 10356810 faf01368 faf00e4c
r12-15  000129e7 faf00bf0 faf00a88 faf00bcc
r16-19  ee294380 0000000a faf005b8 40111868
r20-23  000022c8 00000166 00000000 403ce044
r24-27  ee81c03c eeb3db00 000022c8 00040220
r28-31  0004a900 400c65a7 faf01500 000282a3
sr0-3   00000097 0000008f 00000000 00000097
sr4-7   00000097 00000097 00000097 00000097

IASQ: 00000097 00000097 IAOQ: 4005e483 4005e487
 IIR: 48340048    ISR: 00000000  IOR: ee58c024
 CPU:        2   CR30: ee294000 CR31: 11111111
 ORIG_R28: 00000001

Program received signal SIGILL, Illegal instruction.
0x4005e480 in DynamicMMap::Allocate(unsigned long) ()
   from /usr/lib/libapt-pkg-libc6.2-3.so.3.2

(gdb)


Here is the instruction dump:

(gdb) x/10i 0x4005e470
0x4005e470 <_ZN11DynamicMMap8AllocateEm+100>:	copy r4,r25
0x4005e474 <_ZN11DynamicMMap8AllocateEm+104>:	ldo -1(r21),r21
0x4005e478 <_ZN11DynamicMMap8AllocateEm+108>:	copy r20,r26
0x4005e47c <_ZN11DynamicMMap8AllocateEm+112>:	stw r21,8(sr0,r3)
0x4005e480 <_ZN11DynamicMMap8AllocateEm+116>:	b,l 0x4005d76c
<_init+232>,r31
0x4005e484 <_ZN11DynamicMMap8AllocateEm+120>:	add,l r20,r4,r20
0x4005e488 <_ZN11DynamicMMap8AllocateEm+124>:	stw r20,4(sr0,r3)
0x4005e48c <_ZN11DynamicMMap8AllocateEm+128>:	copy ret1,ret0
0x4005e490 <_ZN11DynamicMMap8AllocateEm+132>:	ldw -54(sr0,sp),rp
0x4005e494 <_ZN11DynamicMMap8AllocateEm+136>:	ldw -3c(sr0,sp),r4
(gdb) 



The instruction causing the unaligned trap is:
0x4005e47c <_ZN11DynamicMMap8AllocateEm+112>:	stw r21,8(sr0,r3)

As you can see from r3 (403ce08c) in the register dump is aligned on a
4-byte boundry.  So the question is why is this trap being executed?

Also Richard thought the following two things looked wiered in the
register dump:

	PSW is all 0's.
	r30 is faf01500 ... isn't userspace stack usually 0xbf??????




Note: The apt-get commands work fine on a UP kernel, and I am running
against the unstable distribution. The same apt-get seems to work fine
on the J200 with an SMP kernel too.

Any thoughts or insight is appreciated :)

Thanks,

- Ryan
