From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Wed, 6 Apr 2005 16:12:31 -0400 (EDT)
Message-ID: <200504062012.j36KCW74007167@hiauly1.hia.nrc.ca>
References: <20050405060051.GJ1833@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050405060051.GJ1833@baldric.uwo.ca> from "Carlos O'Donell" at
	Apr 5, 2005 02:00:51 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I found another program that doesn't work on hppa. This one was written
> by Randolph if my memory serves me correctly. I'll have to add it to the
> userspace tests that fail.
> 
> ---
> all: foo.c libfoo.c
> 	gcc -g -shared -c libfoo.c
> 	rm -f libfoo.so
> 	ln -s libfoo.o libfoo.so
> 	gcc -g -o foo foo.c -lfoo -L. -lpthread
> 
> clean:
> 	rm -f *.o
> 	rm -f *.so
> 	rm -f foo

The test can be simplified.  You don't need libfoo.  Just
link foo with -lpthread and it fails.

I see libtcl8.4 is linked against libpthread.so.  This is probably
why 8.3 works better than 8.4.

dave@hiauly6:~/gcc_test/pthr/carlos$ ./foo
Parent = 24778
Exiting on signal from child
Waited for child 24779
Quit (core dumped)

(gdb) bt
#0  __unregister_atfork (dso_handle=0x40184b58)
    at ../linuxthreads/sysdeps/unix/sysv/linux/unregister-atfork.c:28
#1  0x4016ede0 in __pthread_wait_for_restart_signal (self=0x40184b80)
    at pthread.c:1203
#2  0x405e41b8 in _IO_default_xsputn (f=0xbff00b94, data=0x8, n=3220179872)
    at genops.c:477
#3  0x00000000 in ?? ()
    ...

Running under gdb:

dave@hiauly6:~/gcc_test/pthr/carlos$ /usr/bin/gdb foo
GNU gdb 6.3-debian
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "hppa-linux"...Using host libthread_db library "/usr/lib/debug/libthread_db.so.1".

(gdb) handle SIGUSR2 noprint nostop pass
Signal        Stop      Print   Pass to program Description
SIGUSR2       No        No      Yes             User defined signal 2
(gdb) r
Starting program: /home/dave/gcc_test/pthr/carlos/foo
[Thread debugging using libthread_db enabled]
[New Thread 16384 (LWP 24875)]
Parent = 24875
Exiting on signal from child
Waited for child 24878

Program received signal SIGINT, Interrupt.
[Switching to Thread 16384 (LWP 24875)]
0x4016f05c in __pthread_sigsuspend (set=0xbff00dc8)
    at ../linuxthreads/sysdeps/unix/sysv/linux/pt-sigsuspend.c:54
    54      ../linuxthreads/sysdeps/unix/sysv/linux/pt-sigsuspend.c: No such file or directory.
	    in ../linuxthreads/sysdeps/unix/sysv/linux/pt-sigsuspend.c
(gdb) bt
#0  0x4016f05c in __pthread_sigsuspend (set=0xbff00dc8)
    at ../linuxthreads/sysdeps/unix/sysv/linux/pt-sigsuspend.c:54
#1  0x4016ede0 in __pthread_wait_for_restart_signal (self=0x40184b80)
    at pthread.c:1203
#2  0x4017081c in __pthread_alt_lock (lock=0x406c2980, self=0x40184b80)
    at restart.h:34
#3  0x4016d480 in *__GI___pthread_mutex_lock (mutex=0x406c2970) at mutex.c:123
#4  0x40662234 in __unregister_atfork (dso_handle=0x40184ac0) at list.h:72
#5  0x4016a930 in __do_global_dtors_aux () from /usr/lib/debug/libpthread.so.0
#6  0x40173bb0 in _fini () from /usr/lib/debug/libpthread.so.0
#7  0x400b6898 in _dl_fini () from /lib/ld.so.1
#8  0x400b6898 in _dl_fini () from /lib/ld.so.1
Previous frame identical to this frame (corrupt stack?)
(gdb) disass 0x4016f04c 0x4016f06c
Dump of assembler code from 0x4016f04c to 0x4016f06c:
0x4016f04c <__pthread_sigsuspend+12>:   ldi 8,r25
0x4016f050 <__pthread_sigsuspend+16>:   copy r19,r4
0x4016f054 <__pthread_sigsuspend+20>:   be,l 100(sr2,r0),%sr0,%r31
0x4016f058 <__pthread_sigsuspend+24>:   ldi b3,r20
0x4016f05c <__pthread_sigsuspend+28>:   copy r4,r19
0x4016f060 <__pthread_sigsuspend+32>:   ldw -54(,sp),rp
0x4016f064 <__pthread_sigsuspend+36>:   bv r0(rp)
0x4016f068 <__pthread_sigsuspend+40>:   ldw,mb -40(,sp),r4

The program always appears stuck at 0x4016f05c, so I assume that
the syscall at 0x4016f054 is hung.  There is definitely a timing
issue involved since the program doesn't fail if I don't tell gdb
how to handle SIGUSR2.  I added the parent printout.

(gdb) disass __pthread_sigsuspend
Dump of assembler code for function __pthread_sigsuspend:
0x4016f040 <__pthread_sigsuspend+0>:    stw rp,-14(,sp)
0x4016f044 <__pthread_sigsuspend+4>:    stw,ma r4,40(,sp)
0x4016f048 <__pthread_sigsuspend+8>:    stw r19,-20(,sp)
0x4016f04c <__pthread_sigsuspend+12>:   ldi 8,r25
0x4016f050 <__pthread_sigsuspend+16>:   copy r19,r4
0x4016f054 <__pthread_sigsuspend+20>:   be,l 100(sr2,r0),%sr0,%r31
0x4016f058 <__pthread_sigsuspend+24>:   ldi b3,r20
0x4016f05c <__pthread_sigsuspend+28>:   copy r4,r19
0x4016f060 <__pthread_sigsuspend+32>:   ldw -54(,sp),rp
0x4016f064 <__pthread_sigsuspend+36>:   bv r0(rp)
0x4016f068 <__pthread_sigsuspend+40>:   ldw,mb -40(,sp),r4
End of assembler dump.
(gdb) info reg
flags          0x0      0
r1             0x40661ee7       1080434407
rp             0x4016ede3       1075244515
r3             0x40184b58       1075333976
r4             0x40185c28       1075338280
r5             0x40184b80       1075334016
r6             0x40000328       1073742632
r7             0xbff00bd4       3220179924
r8             0xbff00be0       3220179936
r9             0x1      1
r10            0xbff00bd8       3220179928
r11            0x400bf354       1074525012
r12            0x400d04b8       1074595000
r13            0x2      2
r14            0x400d0d70       1074597232
r15            0xbff00bd8       3220179928
r16            0x400d0724       1074595620
r17            0xbff00bd4       3220179924
r18            0x0      0
r19            0x40185c28       1075338280
r20            0xb3     179
r21            0x1b     27
r22            0xbff00dcc       3220180428
---Type <return> to continue, or q <return> to quit---
r23            0x0      0
r24            0xbff00dc8       3220180424
r25            0x8      8
r26            0xbff00dc8       3220180424
dp             0x20e84  134788
ret0           0xfffffffc       4294967292
ret1           0x37d    893
sp             0xbff00f00       3220180736
r31            0x4016f05f       1075245151
sar            0x1b     27
pcoqh          0x4016f05f       1075245151
pcsqh          0x0      0
pcoqt          0x4016f063       1075245155
pcsqt          0x0      0
eiem           0x0      0
iir            0x0      0
isr            0x0      0
ior            0x0      0
ipsw           0xb      11
goto           0x0      0
sr4            0x0      0
sr0            0x0      0
sr1            0x0      0
---Type <return> to continue, or q <return> to quit---
sr2            0x0      0
sr3            0x0      0
sr5            0x0      0
sr6            0x0      0
sr7            0x0      0
cr0            0x0      0
cr8            0x0      0
cr9            0x0      0
ccr            0x0      0
cr12           0x0      0
cr13           0x0      0
cr24           0x0      0
cr25           0x0      0
cr26           0x0      0
mpsfu_high     0x0      0
mpsfu_low      0x0      0
mpsfu_ovflo    0x0      0
pad            0x0      0
fpsr           0x0      0
fpe1           0x0      0
fpe2           0x0      0
fpe3           0x0      0
fpe4           0x0      0
---Type <return> to continue, or q <return> to quit---
fpe5           0x0      0
fpe6           0x0      0
fpe7           0x0      0

Does this help?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
