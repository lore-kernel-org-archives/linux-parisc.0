Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9EE4482A
	for <parisc-linux@parisc-linux.org>; Wed, 30 May 2001 00:09:29 -0600 (MDT)
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by deimos.frii.net (8.11.3/8.11.3) with ESMTP id f4U69SQ51704
	for <parisc-linux@parisc-linux.org>; Wed, 30 May 2001 00:09:28 -0600 (MDT)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA07141
	for <parisc-linux@parisc-linux.org>; Wed, 30 May 2001 00:09:27 -0600
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m154zAd-001VltC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Wed, 30 May 2001 00:09:27 -0600 (MDT)
Message-Id: <m154zAd-001VltC@bame.riverrock.org>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: parisc-linux@parisc-linux.org
Date: Wed, 30 May 2001 00:09:27 -0600
Sender: bame@riverrock.org
Subject: [parisc-linux] Current APT failure
List-ID: <linux-parisc.vger.kernel.org>

The CVS snapshot apt (on pehc as 0.5.3.0.90) is working fairly well
but is still having plenty of type 6 faults.  Here's details on
the one I think looks like a VM problem.

    Test case: apt-get update
	New package files must be fetched.  If there aren't any new
	files, rm /var/cache/apt/*.bin first.
    
gdb says:

    Program received signal SIGSEGV, Segmentation fault.
    0x4005fe8c in MMap::Map(FileFd&) (this=0x53fd0, Fd=@0x4fb10)
	at ../build/include/apt-pkg/fileutl.h:64
    64         inline int Fd() {return iFd;};

Register dump agrees:

do_page_fault() pid=12131 command='apt-get' type=6 address=0x4005fe8f
vm_start = 0x3ff92000, vm_end = 0x400bb000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001011
r0-3     0000000000000000 000000004011d018 000000004005fe8f 000000004011e818
r4-7     0000000000053fd0 000000000004fb10 0000000000000000 000000007ff00e58
r8-11    000000000036e2e3 000000007ff00f10 0000000000000001 000000007ff00e08
r12-15   000000007ff00c68 000000007ff00e30 000000000000000c 0000000000600000
r16-19   000000007ff00c50 000000007ff00e18 0000000000000000 000000004038c23c
r20-23   000000003ff92000 0000000000000000 000000000000000a 0000000000000001
r24-27   0000000000000001 0000000000128108 0000000000000000 000000000003e440
r28-31   000000003ff92000 0000000000000000 000000007ff01140 00000000403257ab
sr0-3    000000000000bb80 0000000000001100 0000000000000000 000000000000bb80
sr4-7    000000000000bb80 000000000000bb80 000000000000bb80 000000000000bb80

IASQ: 000000000000bb80 000000000000bb80 IAOQ: 000000004005fe8f 000000004005fe93
 IIR: 43ffff80    ISR: 000000000000bb80  IOR: 00000000404ba000
 ORIG_R28: 0000000000128108

Note the bogus "no memory mapped here" IIR.  Gdb disassembly says:

0x4005fe84 <_ZN4MMap3MapER6FileFd+104>: #   41000
0x4005fe88 <_ZN4MMap3MapER6FileFd+108>: #75590c34
0x4005fe8c <_ZN4MMap3MapER6FileFd+112>: iitlbp r0,(sr0,r0)
0x4005fe90 <_ZN4MMap3MapER6FileFd+116>: #   dc55a
0x4005fe94 <_ZN4MMap3MapER6FileFd+120>: #   20257

and other random stuff.  If I re-run in gdb (which type=15 faulted but
that's another story), disassembly of the same location shows:

0x4005fe84 <_ZN4MMap3MapER6FileFd+104>: b,l 0x4005fa48 <_end_init+184>,rp
0x4005fe88 <_ZN4MMap3MapER6FileFd+108>: stw r20,-34(sr0,sp)
0x4005fe8c <_ZN4MMap3MapER6FileFd+112>: copy ret0,r20
0x4005fe90 <_ZN4MMap3MapER6FileFd+116>: copy r3,r19
0x4005fe94 <_ZN4MMap3MapER6FileFd+120>: stw  r20,c(sr0,r4)

The function MMap::Map() is in the apt-specific shared library from which
code has been happily executing prior to the type=6 fault.  strace
shows in part (full trace at http://puffin.external.hp.com/~bame/strace.out):

msync(0x40392000, 1212680, MS_SYNC)     = 0
msync(0x40392000, 8536, MS_SYNC)        = 0
munmap(0x40392000, 6291456)             = 0
ftruncate(9, 1212680)                   = 0
newfstat(9, {st_mode=S_IFREG|0644, st_size=1212680, ...}) = 0
mmap(NULL, 1212680, PROT_READ, MAP_SHARED, 9, 0) = 0x3ff92000
--- SIGSEGV (Segmentation fault) ---

0x40392000 and fd=9 both refer to the mapped pkgcache.bin file.  So it
looks like the fault happens shortly after the file is unmapped and
then remapped read-only at a different location.  The library containing
MMap::Map() was mapped like this:

open("/home/bame/apt/build/bin/libapt-pkg-libc6.2-3.so.3.2", O_RDONLY) = 3
mmap(NULL, 1004804, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4002b000
mprotect(0x400f8000, 165124, PROT_NONE) = 0
mmap(0x40107000, 106496, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0xcc000) = 0x40107000

	-P

-------------------------------------------------------------------
$ LD_LIBRARY_PATH=$PWD ldd -v ./apt-get
        libapt-pkg-libc6.2-3.so.3.2 => /home/bame/apt/build/bin/libapt-pkg-libc6.2-3.so.3.2 (0x4002b000)
        libstdc++.so.3 => /usr/lib/libstdc++.so.3 (0x40121000)
        libm.so.6 => /lib/libm.so.6 (0x401b8000)
        libc.so.6 => /lib/libc.so.6 (0x40248000)
        /lib/ld.so.1 => /lib/ld.so.1 (0x40000000)

        Version information:
        ./apt-get:
                libc.so.6 (GLIBC_2.2) => /lib/libc.so.6
        /home/bame/apt/build/bin/libapt-pkg-libc6.2-3.so.3.2:
                libc.so.6 (GLIBC_2.2) => /lib/libc.so.6
        /usr/lib/libstdc++.so.3:
                libc.so.6 (GLIBC_2.2) => /lib/libc.so.6
        /lib/libm.so.6:
                libc.so.6 (GLIBC_2.2) => /lib/libc.so.6
        /lib/libc.so.6:
                ld.so.1 (GLIBC_2.2.3) => /lib/ld.so.1
                ld.so.1 (GLIBC_2.2) => /lib/ld.so.1
