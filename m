From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: segv doing execv
Date: Sun, 23 Dec 2007 12:34:58 -0500 (EST)
Message-ID: <200712270218.lBR2IwhR020041@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Carlos,

I had a gcc testsuite failure today on my c3k (2.6.22.14) that
suggests there is a random issue with execv.  The test didn't
fail when I reran the test.  xgcc was trying to execv collect2.

This is the backtrace from the core file:

(gdb) bt
#0  0x403cb2b8 in ?? () from /lib/ld.so.1
#1  0x403c2670 in ?? () from /lib/ld.so.1
#2  0x403bd368 in ?? () from /lib/ld.so.1
#3  0x403bd698 in ?? () from /lib/ld.so.1
#4  0x403c0ee4 in ?? () from /lib/ld.so.1
#5  0x403c7cc8 in ?? () from /lib/ld.so.1
#6  0x00027a3c in pex_unix_exec_child (obj=0x42f84, flags=275048,
    executable=0x4afe8 "", argv=0x1, env=0xfb255c48, in=1083198820, out=0,
    errdes=-81437888, toclose=580, errmsg=0xc, err=0x42784)
    at ../../gcc/libiberty/pex-unix.c:433
#7  0x000272f8 in pex_run_in_environment (obj=0x4ecd0, flags=1,
    executable=0x4ec80 "/home/dave/gnu/gcc-4.3/objdir/gcc/collect2",
    argv=0x4bd40, env=0x42f84, orig_outname=0x0,
    errname=0x2b000 ' ' <repeats 19 times>, "Time the execution of each subprocess\n", err=0x6) at ../../gcc/libiberty/pex-common.c:342
#8  0x000274d0 in pex_run (obj=0x10b07, flags=1, executable=0xfb255f08 "",
    argv=0x10a74, orig_outname=0x42f84 "", errname=0xfb255a00 "@=$h",
    err=0x4bd40) at ../../gcc/libiberty/pex-common.c:372
#9  0x00014be8 in execute () at ../../gcc/gcc/gcc.c:2982
#10 0x0001dc08 in main (argc=1077757630, argv=0x403d46d6)
    at ../../gcc/gcc/gcc.c:6765
(gdb) disass 0x403cb2a8 0x403cb2c8
Dump of assembler code from 0x403cb2a8 to 0x403cb2c8:
0x403cb2a8:     copy r26,ret0
0x403cb2ac:     b,l 0x403cb200,r0
0x403cb2b0:     copy ret0,r26
0x403cb2b4:     ldb 0(r26),ret0
0x403cb2b8:     ldb 0(r25),r20
0x403cb2bc:     ldo 1(r26),r26
0x403cb2c0:     cmpib,= 0,ret0,0x403cb2d8
0x403cb2c4:     ldo 1(r25),r25
End of assembler dump.
(gdb) p $r25
$8 = 1

The segv was at 0x403cb2b8.  Think the function starts at 0x403cb0dc.
This is debian libc6 2.7-4.

I looked at code and call in frame 6 as it seemed a little suspicious
that gdb printed 1 for argv.  However, the assembly code and the argv
data all seemed ok.

Any thoughts on how r25 might have becom corrupted?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

