From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Another SIGSEGV, this time in /bin/sh
Date: Sat, 11 Sep 2004 03:24:01 -0400 (EDT)
Message-ID: <200409110724.i8B7O1Fc002787@hiauly1.hia.nrc.ca>
References: <200409012008.i81K8mGw011839@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409012008.i81K8mGw011839@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Sep 1, 2004 04:08:47 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I had another SIGSEGV today building gcc on gsyprf11.

dave@gsyprf11:~/gcc-3.5/objdir$ gdb /bin/sh gcc/core.save.1
GNU gdb 2004-09-01-cvs
...
Program terminated with signal 11, Segmentation fault.
Reading symbols from /usr/lib/debug/libncurses.so.5...done.
Loaded symbols for /usr/lib/debug/libncurses.so.5
Reading symbols from /usr/lib/debug/libdl.so.2...done.
Loaded symbols for /usr/lib/debug/libdl.so.2
Reading symbols from /usr/lib/debug/libc.so.6...done.
Loaded symbols for /usr/lib/debug/libc.so.6
Reading symbols from /lib/ld.so.1...done.
Loaded symbols for /lib/ld.so.1
#0  0xf7025554 in ?? ()

Looking at %r2, it appears that the fault has occurred in an indirect
call from __strtoll_internal:

(gdb) p/x $rp
$1 = 0x40785883
(gdb) disass 0x40785860 0x40785888
Dump of assembler code from 0x40785860 to 0x40785888:
0x40785860 <*__GI___strtoll_internal+2972>:     copy r19,r4
0x40785864 <*__GI___strtoll_internal+2976>:     b,l 0x4076c508 <__gconv_read_conf+916>,r31
0x40785868 <*__GI___strtoll_internal+2980>:     copy r31,rp
0x4078586c <*__GI___strtoll_internal+2984>:     b,l 0x40785848 <*__GI___strtoll_internal+2948>,r0
0x40785870 <*__GI___strtoll_internal+2988>:     copy r4,r19
0x40785874 <*__GI___strtoll_internal+2992>:     copy r19,r4
0x40785878 <*__GI___strtoll_internal+2996>:     b,l 0x4076c508 <__gconv_read_conf+916>,r31
0x4078587c <*__GI___strtoll_internal+3000>:     copy r31,rp

We appear to have reached 0x40785874 from the following code:

0x40784d40 <*__GI___strtoll_internal+124>:      ldi 24,r20
0x40784d44 <*__GI___strtoll_internal+128>:      cmpb,>= r20,r9,0x40784db8 <*__GI___strtoll_internal+244>
0x40784d48 <*__GI___strtoll_internal+132>:      addil 1000,r19,%r1
...
0x40784db8 <*__GI___strtoll_internal+244>:      ldw -124(,sp),r7
0x40784dbc <*__GI___strtoll_internal+248>:      ldi 20,r10
---Type <return> to continue, or q <return> to quit---
0x40784dc4 <*__GI___strtoll_internal+256>:      stw r7,-f0(,sp)
0x40784dc8 <*__GI___strtoll_internal+260>:      addil 1000,r19,%r1
0x40784dcc <*__GI___strtoll_internal+264>:      copy r3,r8
0x40784dd0 <*__GI___strtoll_internal+268>:      ldw 390(,r1),r6
0x40784dd4 <*__GI___strtoll_internal+272>:      ldw 98(,r3),r22
0x40784dd8 <*__GI___strtoll_internal+276>:      addil 1000,r19,%r1
0x40784ddc <*__GI___strtoll_internal+280>:      cmpib,<> 0,r22,0x40785874 <*__GI
I___strtoll_internal+2992>

The address for the indirect call, r22, was loaded as follows:
(gdb) p/x *($r3 + 0x98)
$20 = 0xf7025555

Some interesting registers:
(gdb) p/x $r10
$23 = 0x20
(gdb) p/x $r3
$13 = 0xe3c08
(gdb) p/x $r8
$16 = 0xe3c08
(gdb) p/x $r6
$18 = 0x408a1c8c
(gdb) p/x *($r19 + 0x1000 + 0x390)
$17 = 0x408a1c8c
(gdb) p/x $r7
$21 = 0xd65e8
(gdb) p/x *($sp - 0xf0)
$22 = 0xd65e8

This establishes how we got to the failure point.

It would appear that r3 has either been clobbered by the kernel, or there
is a problem with the memory access by which it was loaded:

(gdb) p/x *($r19 + 0x1000 + 0x354)
$12 = 0x408a98fc

This should have given the r3 value.  The same procedure gave the r6 value.

(gdb) p/x *(*($r19 + 0x1000 + 0x354) + 0x98)
$19 = 0x0

This is probably the value that r22 should have had.

The failure doesn't happen consistently as rerunning the script which failed
was successful.

Any thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
