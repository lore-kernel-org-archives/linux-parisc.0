Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B84B482D
	for <parisc-linux@parisc-linux.org>; Fri, 15 Jun 2001 18:50:38 -0600 (MDT)
To: amodra@bigpond.net.au
Cc: parisc-linux@parisc-linux.org
Date: Fri, 15 Jun 2001 18:50:36 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15B4IO-000111-00@noam.fc.hp.com>
Subject: [parisc-linux] new g++/exceptions problem
List-ID: <linux-parisc.vger.kernel.org>

I built apt against the new exception-handling
compilers (pehc:~taggart/newcompilers-20010615)
and now all the apt utilities bus error right away.  This stuff can
be found installed on gsyprf11 built from ~bame/apt.  So far I know

!!die_if_kernel: apt-get(7797): Unaligned data reference 28

IAOQ: 000000004000ccab IIR: 0cc41280
ldd says this code in ld.so.1:

libapt-pkg-libc6.2-3.so.3.2 => /usr/lib/libapt-pkg-libc6.2-3.so.3.2 (0x4002b000)
libstdc++.so.3 => /usr/lib/libstdc++.so.3 (0x40120000)
libm.so.6 => /lib/libm.so.6 (0x40201000)
libc.so.6 => /lib/libc.so.6 (0x40291000)
/lib/ld.so.1 => /lib/ld.so.1 (0x40000000)

The offending code is:

0000c7a0 <_dl_relocate_object>:
...
    cbf8:       0a cc 0a 16     add,l r12,r22,r22
    cbfc:       0c a0 10 97     ldw  0(sr0,r5),r23
...
    cc04:       0c e0 10 94     ldw  0(sr0,r7),r20
...
    cc9c:       2a 60 00 00     addil 0,r19,%r1
    cca0:       48 21 0a f0     ldw 578(sr0,r1),r1
    cca4:       08 a1 28 80     cmpclr,= r1,r5,r0
--> cca8:       0c c4 12 80     stw  r4,0(sr0,r6)
    cc14:       0a 97 0a 06     add,l r23,r20,r6

r6 is 00000000401e51ee which refers to libstdc++ offset c51ee:

 16 .data         00002f2c  000c22b0  000c22b0  000b22b0  2**4
                  CONTENTS, ALLOC, LOAD, DATA
 17 .eh_frame     0001254c  000c51dc  000c51dc  000b51dc  2**2
                  CONTENTS, ALLOC, LOAD, DATA
 18 .gcc_except_table 0000298c  000d7728  000d7728  000c7728  2**2
                  CONTENTS, ALLOC, LOAD, DATA

so it's inside the exception-handler frame.  My wild guess is the
dynamic linker is trying to handle a new type of symbol which refers
to the new exception stuff which is for some reason not 4-byte
aligned, but this surely ain't my expertise area!

	-P
