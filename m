Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9996A487B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Jun 2001 07:41:20 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A4C4AB007; Wed,  6 Jun 2001 14:37:46 +0100 (BST)
Date: Wed, 6 Jun 2001 14:37:46 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010606143746.T25745@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] more ldcw alignment problems?
List-ID: <linux-parisc.vger.kernel.org>

715/old, fresh install, glibc 2.2.3 based, trying to build the
kernel, make hung.  Don't know if a rebuild of make will help
or not, as the ldcw is for a location on the stack.

apollo:/usr/src/linux# /share/gdb/gdb2 /usr/bin/make
GNU gdb 5.0
Copyright 2001 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "hppa-linux"...(no debugging symbols found)...
(gdb) attach 1223
Attaching to program: /usr/bin/make, Pid 1223
Reading symbols from /lib/librt.so.1...(no debugging symbols found)...done.
Loaded symbols for /lib/librt.so.1
Reading symbols from /lib/libc.so.6...(no debugging symbols found)...done.
Loaded symbols for /lib/libc.so.6
Reading symbols from /lib/libpthread.so.0...(no debugging symbols found)...
done.
Loaded symbols for /lib/libpthread.so.0
Reading symbols from /lib/ld.so.1...done.
Loaded symbols for /lib/ld.so.1
0x4019bf40 in _end_init () from /lib/libpthread.so.0
(gdb) x/10i 0x4019bf30
0x4019bf30 <_end_init+152>:     ldw 684(sr0,r1),r21
0x4019bf34 <_end_init+156>:     bv r0(r21)
0x4019bf38 <_end_init+160>:     ldw 688(sr0,r1),r19
0x4019bf3c <_end_init+164>:     addil -800,r19,%r1
0x4019bf40 <_end_init+168>:     ldw 46c(sr0,r1),r21
0x4019bf44 <_end_init+172>:     bv r0(r21)
0x4019bf48 <_end_init+176>:     ldw 470(sr0,r1),r19
0x4019bf4c <_end_init+180>:     addil -800,r19,%r1
0x4019bf50 <_end_init+184>:     ldw 73c(sr0,r1),r21
0x4019bf54 <_end_init+188>:     bv r0(r21)
(gdb) stepi
0x40116614 in sched_yield () from /lib/libc.so.6
(gdb) 
0x40116618 in sched_yield () from /lib/libc.so.6
(gdb) 
0x40116644 in sched_yield () from /lib/libc.so.6
(gdb) 
0x40116648 in sched_yield () from /lib/libc.so.6
(gdb) 
0x4011664c in sched_yield () from /lib/libc.so.6
(gdb) 
0x401a1f48 in __pthread_acquire () from /lib/libpthread.so.0
(gdb) x/10i 0x401a1f30
0x401a1f30 <__pthread_acquire+92>:      ldo 481(r20),r6
0x401a1f34 <__pthread_acquire+96>:      ldo -78(sp),r26
0x401a1f38 <__pthread_acquire+100>:
    cmpb,< r7,r4,0x401a1f60 <__pthread_acquire+140>
0x401a1f3c <__pthread_acquire+104>:     ldi 0,r25
0x401a1f40 <__pthread_acquire+108>:     b,l 0x4019bf3c <_end_init+164>,rp
0x401a1f44 <__pthread_acquire+112>:     ldo 1(r4),r4
0x401a1f48 <__pthread_acquire+116>:     copy r5,r19
0x401a1f4c <__pthread_acquire+120>:     ldcw  0(sr0,r3),r20
0x401a1f50 <__pthread_acquire+124>:
    cmpib,<> 0,r20,0x401a1f10 <__pthread_acquire+60>
0x401a1f54 <__pthread_acquire+128>:     ldw -94(sr0,sp),rp
(gdb) stepi
0x401a1f4c in __pthread_acquire () from /lib/libpthread.so.0
(gdb) i r
     flags: 0                       pcsqt: 1ac                
        r1: fffff000                 eiem: 0                  
        rp: 401a1f4b                  iir: c6011d4            
        r3: faf03008                  isr: 1ac                
        r4: 1                         ior: faf028c8           
        r5: 401bfdb0                 ipsw: 4000b              
        r6: 1e8481                   cr31: 0                  
        r7: 31                        sr4: 1ac                
        r8: faf027a0                  sr0: c                  
        r9: 4019123c                  sr1: c                  
       r10: 3ffb8                     sr2: 0                  
       r11: faf02810                  sr3: 1ac                
       r12: 46                        sr5: 1ac                
       r13: 3ffb8                     sr6: 1ac                
       r14: 2c000                     sr7: 1ac                
       r15: 5c                       rcnt: 0                  
       r16: faf027a0                ptid1: 0                  
       r17: 407b8                   ptid2: 0                  
       r18: 2c000                     ccr: 0                  
       r19: 401bfdb0                ptid3: 0                  
       r20: 9e                      ptid4: 0                  
       r21: 4011660c                 cr24: 0                  
       r22: 401bd040                 cr25: 0                  
       r23: faf02d40                 cr26: 0                  
       r24: faf02810                 cr27: 9e                 
       r25: 0                        cr28: 0                  
       r26: faf03010                 cr29: 0                  
        dp: 3ffb8                    cr30: 12fc0000           
      ret0: 0                        fpsr: 0                  
      ret1: 0                        fpe1: 0                  
        sp: faf03088                 fpe2: 0                  
       r31: 40116617                 fpe3: 0                  
       sar: 1e                       fpe4: 0                  
     pcoqh: 401a1f4c                 fpe5: 0                  
     pcsqh: 1ac                      fpe6: 0                  
     pcoqt: 401a1f50                 fpe7: 0                  
(gdb) bt
#0  0x401a1f4c in __pthread_acquire () from /lib/libpthread.so.0
#1  0x401a1a18 in __pthread_lock () from /lib/libpthread.so.0
#2  0x4019ec50 in pthread_mutex_lock () from /lib/libpthread.so.0
#3  0x401a10ec in flockfile () from /lib/libpthread.so.0
#4  0x400af6bc in vfprintf () from /lib/libc.so.6
#5  0x400c5314 in vsprintf () from /lib/libc.so.6
#6  0x400b43d8 in sprintf () from /lib/libc.so.6
#7  0x00028678 in error ()
#8  0x0001c72c in main ()
Cannot access memory at address 0x6368202c
(gdb) 

apollo:/home/richard# cat /proc/1223/maps 
00010000-00030000 r-xp 00000000 08:03 57336      /usr/bin/make
0003f000-00041000 rwxp 0001f000 08:03 57336      /usr/bin/make
00041000-00048000 rwxp 00000000 00:00 0
40000000-4001a000 rwxp 00000000 08:03 14292      /lib/ld-2.2.3.so
4001a000-4001b000 rw-p 00000000 00:00 0
40029000-4002a000 rwxp 00019000 08:03 14292      /lib/ld-2.2.3.so
4002a000-4002b000 rwxp 00000000 00:00 0
4002b000-40033000 r-xp 00000000 08:03 14320      /lib/librt-2.2.3.so
40033000-40042000 ---p 00008000 08:03 14320      /lib/librt-2.2.3.so
40042000-40043000 rwxp 00007000 08:03 14320      /lib/librt-2.2.3.so
40043000-4004d000 rwxp 00000000 00:00 0
4004d000-4017a000 r-xp 00000000 08:03 14299      /lib/libc-2.2.3.so
4017a000-40189000 ---p 0012d000 08:03 14299      /lib/libc-2.2.3.so
40189000-40194000 rwxp 0012c000 08:03 14299      /lib/libc-2.2.3.so
40194000-40197000 rwxp 00000000 00:00 0
40197000-401a5000 r-xp 00000000 08:03 14343      /lib/libpthread-0.9.so
401a5000-401b4000 ---p 0000e000 08:03 14343      /lib/libpthread-0.9.so
401b4000-401c0000 rwxp 0000d000 08:03 14343      /lib/libpthread-0.9.so
401c0000-401c1000 rwxp 00000000 00:00 0
faf00000-faf04000 rwxp 00000000 00:00 0


apollo:/home/richard# dpkg -l libc6 make
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name          Version          Description
+++-=============-================-=======================================
ii  libc6         2.2.3-2.0.0.2    GNU C Library: Shared libraries and Timezone data
ii  make          3.79.1-6.0.1     The GNU version of the "make" utility.


Richard
