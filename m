From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Stuck gnat1 processes
Date: Thu, 9 Jun 2011 21:30:35 -0400
Message-ID: <20110610013034.GA5353@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Here is another wierd bug -- four gnat1 process stuck at exactly the
same location making zero forward progress.  I have seen this a number
of times, so I thought it would be useful to report.

As far as I can tell, all are stuck in the kernel.  Gdb can't step
the code, nor do breaks on the next instruction ever get hit.  This
may have something to do with the fact that the instruction is trying
to read from text (C switch statement).

This is with 2.6.39.1 with James' last two, but I have also seen this
without the patches.  Machine is rp3440.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="gnat1.txt"

dave@mx3210:~/gnu/gcc/objdir$ top

top - 20:31:28 up 1 day,  9:54,  2 users,  load average: 4.01, 3.62, 3.42
Tasks:  97 total,   5 running,  92 sleeping,   0 stopped,   0 zombie
Cpu(s): 92.0%us,  4.0%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  4.0%si,  0.0%st
Mem:  10288332k total,  2741856k used,  7546476k free,   603552k buffers
Swap:   979928k total,        0k used,   979928k free,  1727896k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND           
14022 dave      20   0 87484  11m 9644 R  100  0.1   1176:59 gnat1              
14017 dave      20   0 88728  13m 9792 R   93  0.1   1174:19 gnat1              
14027 dave      20   0 93068  18m 9.9m R   93  0.2   1196:54 gnat1              
14012 dave      20   0 87900  12m 9680 R   86  0.1   1070:21 gnat1              

dave@mx3210:~/gnu/gcc/objdir$ gdb prev-gcc/gnat1 14012
GNU gdb (GDB) 7.2-debian
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "hppa-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/dave/gnu/gcc/objdir/prev-gcc/gnat1...done.
Attaching to program: /home/dave/gnu/gcc/objdir/prev-gcc/gnat1, process 14012
Reading symbols from /usr/lib/libmpc.so.2...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libmpc.so.2
Reading symbols from /usr/lib/libmpfr.so.4...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libmpfr.so.4
Reading symbols from /usr/lib/libgmp.so.10...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libgmp.so.10
Reading symbols from /lib/libdl.so.2...done.
Loaded symbols for /lib/libdl.so.2
Reading symbols from /lib/libc.so.6...done.
Loaded symbols for /lib/libc.so.6
Reading symbols from /lib/ld.so.1...done.
Loaded symbols for /lib/ld.so.1
0x04087ae4 in option_enabled (opt_idx=290, opts=0x4e3dd14)
    at ../../gcc/gcc/opts-common.c:1170
1170	    switch (option->var_type)
(gdb) bt
#0  0x04087ae4 in option_enabled (opt_idx=290, opts=0x4e3dd14)
    at ../../gcc/gcc/opts-common.c:1170
#1  0x0408afd8 in diagnostic_report_diagnostic (context=0x4e3ed98, 
    diagnostic=0xfdf98a88) at ../../gcc/gcc/diagnostic.c:451
#2  0x0408b968 in warning (opt=290, 
    gmsgid=0x4234818 "padding struct to align %q+D")
    at ../../gcc/gcc/diagnostic.c:676
#3  0x020e3fa0 in place_field (rli=0x4e5a288, field=0x402c9f60)
    at ../../gcc/gcc/stor-layout.c:1151
#4  0x020ed9bc in layout_type (type=0x4e5a288)
    at ../../gcc/gcc/stor-layout.c:2047
#5  0x020ed9bc in layout_type (type=0x4e5a288)
    at ../../gcc/gcc/stor-layout.c:2047
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb) step
^C
Program received signal SIGINT, Interrupt.
0x04087ae4 in option_enabled (opt_idx=290, opts=0x4e3dd14)
    at ../../gcc/gcc/opts-common.c:1170
1170	    switch (option->var_type)
(gdb) stepi
^C
Program received signal SIGINT, Interrupt.
0x04087ae4 in option_enabled (opt_idx=290, opts=0x4e3dd14)
    at ../../gcc/gcc/opts-common.c:1170
1170	    switch (option->var_type)
(gdb) disass $pc-32,$pc+32
Dump of assembler code from 0x4087ac4 to 0x4087b04:
   0x04087ac4 <option_enabled+88>:	stw ret0,8(r3)
   0x04087ac8 <option_enabled+92>:	ldw 8(r3),ret0
   0x04087acc <option_enabled+96>:	cmpib,=,n 0,ret0,0x4087b6c <option_enabled+256>
   0x04087ad0 <option_enabled+100>:	ldw 10(r3),ret0
   0x04087ad4 <option_enabled+104>:	ldw 30(ret0),ret0
   0x04087ad8 <option_enabled+108>:	cmpib,<<,n 3,ret0,0x4087b6c <option_enabled+256>
   0x04087adc <option_enabled+112>:	ldil L%4087800,r19
   0x04087ae0 <option_enabled+116>:	ldo 2ec(r19),r19
=> 0x04087ae4 <option_enabled+120>:	ldw,s ret0(r19),r19
   0x04087ae8 <option_enabled+124>:	bv,n r0(r19)
   0x04087aec <option_enabled+128>:	# 4087afc
   0x04087af0 <option_enabled+132>:	# 4087b10
   0x04087af4 <option_enabled+136>:	# 4087b2c
   0x04087af8 <option_enabled+140>:	# 4087b4c
   0x04087afc <option_enabled+144>:	ldw 8(r3),ret0
   0x04087b00 <option_enabled+148>:	ldw 0(ret0),ret0
End of assembler dump.
(gdb) p/x $ret0
$1 = 0x0
(gdb) p/x $r19
$2 = 0x4087aec
(gdb) break *0x04087ae8
Breakpoint 1 at 0x4087ae8: file ../../gcc/gcc/opts-common.c, line 1170.
(gdb) c
Continuing.
^C
Program received signal SIGINT, Interrupt.
0x04087ae4 in option_enabled (opt_idx=290, opts=0x4e3dd14)
    at ../../gcc/gcc/opts-common.c:1170
1170	    switch (option->var_type)
(gdb) p/x $pc
$3 = 0x4087ae4
(gdb) p/x $r19
$4 = 0x4087aec
(gdb) x/x $r19
0x4087aec <option_enabled+128>:	0x04087afc

dave@mx3210:/proc/14012$ cat maps
00010000-0490c000 r-xp 00000000 08:07 1204766                            /home/dave/gnu/gcc/objdir/prev-gcc/gnat1
0490c000-0491d000 rwxp 048fc000 08:07 1204766                            /home/dave/gnu/gcc/objdir/prev-gcc/gnat1
0491d000-04f6d000 rwxp 00000000 00:00 0                                  [heap]
40000000-40037000 rw-p 00000000 00:00 0 
4003b000-4008f000 r-xp 00000000 08:05 298712                             /usr/lib/libmpfr.so.4.0.0
4008f000-40091000 rwxp 00053000 08:05 298712                             /usr/lib/libmpfr.so.4.0.0
40091000-40111000 rw-p 00000000 00:00 0 
4013e000-4015e000 r-xp 00000000 08:05 25181                              /lib/ld-2.11.2.so
4015e000-40162000 rwxp 00020000 08:05 25181                              /lib/ld-2.11.2.so
40162000-4016d000 rw-p 00000000 00:00 0 
40193000-4019e000 rw-p 00000000 00:00 0 
401e5000-401e8000 r-xp 00000000 08:05 25170                              /lib/libdl-2.11.2.so
401e8000-401e9000 rwxp 00003000 08:05 25170                              /lib/libdl-2.11.2.so
40232000-40246000 r-xp 00000000 08:05 299656                             /usr/lib/libmpc.so.2.0.0
40246000-40247000 rwxp 00013000 08:05 299656                             /usr/lib/libmpc.so.2.0.0
40247000-40347000 rw-p 00000000 00:00 0 
40435000-40497000 r-xp 00000000 08:05 298658                             /usr/lib/libgmp.so.10.0.1
40497000-4049e000 rwxp 00062000 08:05 298658                             /usr/lib/libgmp.so.10.0.1
405eb000-40744000 r-xp 00000000 08:05 25182                              /lib/libc-2.11.2.so
40744000-4074a000 rwxp 00159000 08:05 25182                              /lib/libc-2.11.2.so
4074a000-4074d000 rwxp 00000000 00:00 0 
4074d000-407a0000 rw-p 00000000 00:00 0 
408e5000-40a5a000 r--p 00000000 08:05 314648                             /usr/lib/locale/locale-archive
fdf8d000-fe013000 rwxp 00000000 00:00 0                                  [stack]

dave@mx3210:/proc/14012$ cat smaps
00010000-0490c000 r-xp 00000000 08:07 1204766                            /home/dave/gnu/gcc/objdir/prev-gcc/gnat1
Size:              74736 kB
Rss:                8932 kB
Pss:                2264 kB
Shared_Clean:       8928 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:         4 kB
Referenced:         8932 kB
Anonymous:             4 kB
AnonHugePages:         0 kB
Swap:                  0 kB
KernelPageSize:        4 kB
MMUPageSize:           4 kB
Locked:                0 kB

----------------------------------------

dave@mx3210:~/gnu/gcc/objdir$ gdb prev-gcc/gnat1 14017
GNU gdb (GDB) 7.2-debian
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "hppa-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/dave/gnu/gcc/objdir/prev-gcc/gnat1...done.
Attaching to program: /home/dave/gnu/gcc/objdir/prev-gcc/gnat1, process 14017
Reading symbols from /usr/lib/libmpc.so.2...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libmpc.so.2
Reading symbols from /usr/lib/libmpfr.so.4...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libmpfr.so.4
Reading symbols from /usr/lib/libgmp.so.10...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libgmp.so.10
Reading symbols from /lib/libdl.so.2...done.
Loaded symbols for /lib/libdl.so.2
Reading symbols from /lib/libc.so.6...done.
Loaded symbols for /lib/libc.so.6
Reading symbols from /lib/ld.so.1...done.
Loaded symbols for /lib/ld.so.1
0x04087ae4 in option_enabled (opt_idx=290, opts=0x4e3dd14)
    at ../../gcc/gcc/opts-common.c:1170
1170	    switch (option->var_type)
(gdb)  disass $pc-32,$pc+32
Dump of assembler code from 0x4087ac4 to 0x4087b04:
   0x04087ac4 <option_enabled+88>:	stw ret0,8(r3)
   0x04087ac8 <option_enabled+92>:	ldw 8(r3),ret0
   0x04087acc <option_enabled+96>:	cmpib,=,n 0,ret0,0x4087b6c <option_enabled+256>
   0x04087ad0 <option_enabled+100>:	ldw 10(r3),ret0
   0x04087ad4 <option_enabled+104>:	ldw 30(ret0),ret0
   0x04087ad8 <option_enabled+108>:	cmpib,<<,n 3,ret0,0x4087b6c <option_enabled+256>
   0x04087adc <option_enabled+112>:	ldil L%4087800,r19
   0x04087ae0 <option_enabled+116>:	ldo 2ec(r19),r19
=> 0x04087ae4 <option_enabled+120>:	ldw,s ret0(r19),r19
   0x04087ae8 <option_enabled+124>:	bv,n r0(r19)
   0x04087aec <option_enabled+128>:	# 4087afc
   0x04087af0 <option_enabled+132>:	# 4087b10
   0x04087af4 <option_enabled+136>:	# 4087b2c
   0x04087af8 <option_enabled+140>:	# 4087b4c
   0x04087afc <option_enabled+144>:	ldw 8(r3),ret0
   0x04087b00 <option_enabled+148>:	ldw 0(ret0),ret0
End of assembler dump.

----------------------------------------

dave@mx3210:~/gnu/gcc/objdir$ gdb prev-gcc/gnat1 14022
GNU gdb (GDB) 7.2-debian
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "hppa-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/dave/gnu/gcc/objdir/prev-gcc/gnat1...done.
Attaching to program: /home/dave/gnu/gcc/objdir/prev-gcc/gnat1, process 14022
Reading symbols from /usr/lib/libmpc.so.2...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libmpc.so.2
Reading symbols from /usr/lib/libmpfr.so.4...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libmpfr.so.4
Reading symbols from /usr/lib/libgmp.so.10...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libgmp.so.10
Reading symbols from /lib/libdl.so.2...done.
Loaded symbols for /lib/libdl.so.2
Reading symbols from /lib/libc.so.6...done.
Loaded symbols for /lib/libc.so.6
Reading symbols from /lib/ld.so.1...done.
Loaded symbols for /lib/ld.so.1
0x04087ae4 in option_enabled (opt_idx=290, opts=0x4e3dd14)
    at ../../gcc/gcc/opts-common.c:1170
1170	    switch (option->var_type)
(gdb) disass $pc-32,$pc+32
Dump of assembler code from 0x4087ac4 to 0x4087b04:
   0x04087ac4 <option_enabled+88>:	stw ret0,8(r3)
   0x04087ac8 <option_enabled+92>:	ldw 8(r3),ret0
   0x04087acc <option_enabled+96>:	cmpib,=,n 0,ret0,0x4087b6c <option_enabled+256>
   0x04087ad0 <option_enabled+100>:	ldw 10(r3),ret0
   0x04087ad4 <option_enabled+104>:	ldw 30(ret0),ret0
   0x04087ad8 <option_enabled+108>:	cmpib,<<,n 3,ret0,0x4087b6c <option_enabled+256>
   0x04087adc <option_enabled+112>:	ldil L%4087800,r19
   0x04087ae0 <option_enabled+116>:	ldo 2ec(r19),r19
=> 0x04087ae4 <option_enabled+120>:	ldw,s ret0(r19),r19
   0x04087ae8 <option_enabled+124>:	bv,n r0(r19)
   0x04087aec <option_enabled+128>:	# 4087afc
   0x04087af0 <option_enabled+132>:	# 4087b10
   0x04087af4 <option_enabled+136>:	# 4087b2c
   0x04087af8 <option_enabled+140>:	# 4087b4c
   0x04087afc <option_enabled+144>:	ldw 8(r3),ret0
   0x04087b00 <option_enabled+148>:	ldw 0(ret0),ret0
End of assembler dump.

----------------------------------------

dave@mx3210:~/gnu/gcc/objdir$ gdb prev-gcc/gnat1 14027
GNU gdb (GDB) 7.2-debian
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "hppa-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/dave/gnu/gcc/objdir/prev-gcc/gnat1...done.
Attaching to program: /home/dave/gnu/gcc/objdir/prev-gcc/gnat1, process 14027
Reading symbols from /usr/lib/libmpc.so.2...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libmpc.so.2
Reading symbols from /usr/lib/libmpfr.so.4...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libmpfr.so.4
Reading symbols from /usr/lib/libgmp.so.10...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/libgmp.so.10
Reading symbols from /lib/libdl.so.2...done.
Loaded symbols for /lib/libdl.so.2
Reading symbols from /lib/libc.so.6...done.
Loaded symbols for /lib/libc.so.6
Reading symbols from /lib/ld.so.1...done.
Loaded symbols for /lib/ld.so.1
0x04087ae4 in option_enabled (opt_idx=290, opts=0x4e3dd14)
    at ../../gcc/gcc/opts-common.c:1170
1170	    switch (option->var_type)
(gdb) disass $pc-32,$pc+32
Dump of assembler code from 0x4087ac4 to 0x4087b04:
   0x04087ac4 <option_enabled+88>:	stw ret0,8(r3)
   0x04087ac8 <option_enabled+92>:	ldw 8(r3),ret0
   0x04087acc <option_enabled+96>:	cmpib,=,n 0,ret0,0x4087b6c <option_enabled+256>
   0x04087ad0 <option_enabled+100>:	ldw 10(r3),ret0
   0x04087ad4 <option_enabled+104>:	ldw 30(ret0),ret0
   0x04087ad8 <option_enabled+108>:	cmpib,<<,n 3,ret0,0x4087b6c <option_enabled+256>
   0x04087adc <option_enabled+112>:	ldil L%4087800,r19
   0x04087ae0 <option_enabled+116>:	ldo 2ec(r19),r19
=> 0x04087ae4 <option_enabled+120>:	ldw,s ret0(r19),r19
   0x04087ae8 <option_enabled+124>:	bv,n r0(r19)
   0x04087aec <option_enabled+128>:	# 4087afc
   0x04087af0 <option_enabled+132>:	# 4087b10
   0x04087af4 <option_enabled+136>:	# 4087b2c
   0x04087af8 <option_enabled+140>:	# 4087b4c
   0x04087afc <option_enabled+144>:	ldw 8(r3),ret0
   0x04087b00 <option_enabled+148>:	ldw 0(ret0),ret0
End of assembler dump.


--rwEMma7ioTxnRzrJ--
