From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: make hangs reading pipe
Date: Wed, 2 Dec 2009 20:14:34 -0500 (EST)
Message-ID: <20091203011435.5401D4FA3@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is the second time make has hung reading a pipe.  It occurred
at exactly the same place in both cases (end of gcc bootstrap).

System is 32-bit UP kernel running on c3750.  I have seen it now with
2.6.30.9 and 2.6.31.6.  I have to think this is libc6 related.
Current version is 2.10.1-7.  I haven't seen the problem with 64-bit
kernel.

I also have noticed that logins via ssh and su take a long time after
the system runs for awhile.  They are quite right after boot.

Here's some random data that I collected from the first hang:

dave@hiauly6:~/gnu/gcc/objdir$ /usr/bin/gdb /usr/bin/make 4506
GNU gdb (GDB) 7.0-debian
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "hppa-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /usr/bin/make...(no debugging symbols found)...done.
Attaching to program: /usr/bin/make, process 4506
Reading symbols from /lib/librt.so.1...Reading symbols from /usr/lib/debug/lib/librt-2.10.1.so...done.
(no debugging symbols found)...done.
Loaded symbols for /lib/librt.so.1
Reading symbols from /lib/libc.so.6...Reading symbols from /usr/lib/debug/lib/libc-2.10.1.so...done.
(no debugging symbols found)...done.
Loaded symbols for /lib/libc.so.6
Reading symbols from /lib/libpthread.so.0...Reading symbols from /usr/lib/debug/lib/libpthread-2.10.1.so...done.
[Thread debugging using libthread_db enabled]
(no debugging symbols found)...done.
Loaded symbols for /lib/libpthread.so.0
Reading symbols from /lib/ld.so.1...Reading symbols from /usr/lib/debug/lib/ld-2.10.1.so...done.
(no debugging symbols found)...done.
Loaded symbols for /lib/ld.so.1
0x4098607c in read () from /lib/libc.so.6
(gdb) bt
#0  0x4098607c in read () from /lib/libc.so.6
#1  0x0001eb6c in ?? ()
#2  0x0001ec4c in ?? ()
#3  0x00021af0 in main ()
(gdb) disass 0x4098606c 0x4098608c
Dump of assembler code from 0x4098606c to 0x4098608c:
0x4098606c <read+24>:   cmpib,<>,n 0,ret0,0x409860a0 <read+76>
0x40986070 <read+28>:   copy r19,r3
0x40986074 <read+32>:   be,l 100(sr2,r0),sr0,r31
0x40986078 <read+36>:   ldi 3,r20
0x4098607c <read+40>:   ldi -1000,r1
0x40986080 <read+44>:   cmpb,>>=,n r1,ret0,0x40986100 <read+172>
0x40986084 <read+48>:   copy r3,r19
0x40986088 <read+52>:   b,l 0x409a7c38,rp
End of assembler dump.

dave@hiauly6:/proc/4506$ cat status
Name:   make
State:  S (sleeping)
Tgid:   4506
Pid:    4506
PPid:   2836
TracerPid:      0
Uid:    1002    1002    1002    1002
Gid:    1002    1002    1002    1002
FDSize: 256
Groups: 0 4 100 119 1002 1003 
VmPeak:     3460 kB
VmSize:     3460 kB
VmLck:         0 kB
VmHWM:      2260 kB
VmRSS:      2240 kB
VmData:     1500 kB
VmStk:        88 kB
VmExe:       160 kB
VmLib:      1652 kB
VmPTE:        20 kB
Threads:        1
SigQ:   0/16382
SigPnd: 0000000000000000
ShdPnd: 0000000000000000
SigBlk: 0000000000000000
SigIgn: 0000000000000001
SigCgt: 000000330002c006
CapInh: 0000000000000000
CapPrm: 0000000000000000
CapEff: 0000000000000000
CapBnd: fffffffffffffeff
voluntary_ctxt_switches:        27
nonvoluntary_ctxt_switches:     17

dave@hiauly6:/proc/4506/fdinfo$ cat 3
pos:    0
flags:  00

dave@hiauly6:/proc/4506/fd$ ls -l
total 0
l-wx------ 1 dave dave 64 Nov 29 11:00 0 -> /dev/null
l-wx------ 1 dave dave 64 Nov 29 11:00 1 -> /home/dave/gnu/gcc-4.5/objdir/build.log
l-wx------ 1 dave dave 64 Nov 29 11:00 2 -> /home/dave/gnu/gcc-4.5/objdir/build.log
lr-x------ 1 dave dave 64 Nov 29 11:00 3 -> pipe:[23677]
lr-x------ 1 dave dave 64 Nov 29 11:00 6 -> /home/dave/gnu/gcc-4.5/gcc-4.5
lr-x------ 1 dave dave 64 Nov 29 11:00 7 -> pipe:[23678]

Processes 23677 and 23678 are non existant.

In the current hang, I see:

dave@hiauly6:/proc/23324/fd$ ls -l
total 0
l-wx------ 1 dave dave 64 Dec  2 19:49 0 -> /dev/null
l-wx------ 1 dave dave 64 Dec  2 19:49 1 -> /home/dave/gnu/gcc-4.5/objdir/build.log
l-wx------ 1 dave dave 64 Dec  2 19:49 2 -> /home/dave/gnu/gcc-4.5/objdir/build.log
lr-x------ 1 dave dave 64 Dec  2 19:49 3 -> pipe:[1383769]
lr-x------ 1 dave dave 64 Dec  2 19:49 6 -> /home/dave/gnu/gcc-4.5/gcc-4.5
lr-x------ 1 dave dave 64 Dec  2 19:49 7 -> pipe:[1383770]

Not sure what the pipe numbers mean...

The current hang could be debugged more if anybody has further ideas.
Any thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
