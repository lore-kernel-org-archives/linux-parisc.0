From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] gdb debugging SIGEV_THREAD threads?
Date: Tue, 2 Aug 2005 09:41:34 -0400
Message-ID: <20050802134128.GC9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Randolph,

Might you have a clue as to why gdb can't debug a SIGEV_THREAD?
This test fails with a SIGSEGV in NPTL. The thread is in
__deallocate_stack (DSO address check from fault) 

The bug itself could be a problem with the CLONE_SETTLS flag
implementation.


-----
(gdb) break *0x400294dc
Breakpoint 2 at 0x400294dc: file list.h, line 71.
(gdb) r
The program being debugged has been started already.
Start it from the beginning? (y or n) y^H
Starting program:
/mnt/flaire/src/tls-toolchain-hppa/build/tests/tst-timer/tst-timer 
Breakpoint 2 at 0x400294dc
Breakpoint 2 at 0x400294dc: file list.h, line 71.

Breakpoint 1, main () at tst-timer.c:82
82        setvbuf (stdout, 0, _IOLBF, 0);
(gdb) c
Continuing.

00000000 00000000 00000002 0002119a 00000000 00000000 00000000 00000000 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 

00000000 

00000000 00000000 00000002 0002119a 00000000 00000000 00000000 00000000 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 

00022098 

00000000 00000000 00000002 0002119a 00000000 00000000 00000000 00000000 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 

00022098 
notify_func1

Program terminated with signal SIGTRAP, Trace/breakpoint trap.
The program no longer exists.
(gdb)
-----
do_page_fault() pid=24956 command='tst-timer' type=15 address=0x00000005

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  0000000000000000 0000000000000000 000000004004c154 0000000040049f64
r04-07  0000000040049f64 0000000000000000 00000000410bc500 00000000000000fb
r08-11  ffffffffdeadbeef 00000000007d0f00 00000000000220a8 00000000000000fb
r12-15  0000000000800000 00000000408bd000 0000000000000007 00000000deadbeef
r16-19  00000000000220a8 0000000040411dae 0000000000022098 0000000040049f64
r20-23  0000000000000000 0000000000000001 00000000410bc540 0000000000000000
r24-27  0000000000000001 0000000000000000 000000004004c154 0000000000021184
r28-31  0000000000000000 0000000000000001 00000000410bc340 000000004002949b
sr0-3   00000000008d7800 0000000000000000 0000000000000000 00000000008d7800
sr4-7   00000000008d7800 00000000008d7800 00000000008d7800 00000000008d7800

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000000000
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  00000000101f3edc 00000000107575f8 0000000012603c18 0000000000000000
fr08-11  00000000106d3ae0 0000000000000002 00000000106d3ae0 0000000000000802
fr12-15  0000000010199cf8 0000000000000020 00000000101c7e84 00000000125ae000
fr16-19  00000000125ae000 0000000000000000 00000000106d3ae0 000f41fa2f9b5bc0
fr20-23  0000000000000020 00000000101c7e84 0000000000000088 00000040cccccccd
fr24-27  0000001b55555555 3fe0000000000000 412e848000000000 00000000106d3ae0
fr28-31  000000006f8ecdc8 000000000000000b 0000000000000020 0000000000000000

IASQ: 00000000008d7800 00000000008d7800 IAOQ: 00000000400294df 00000000400294e3
 IIR: 0ebc1288    ISR: 00000000008d7800  IOR: 0000000000000005
 CPU:        0   CR30: 000000003ec88000 CR31: 0000000010694000
 ORIG_R28: 0000000000000000
 IAOQ[0]: 0x400294df
 IAOQ[1]: 0x400294e3
 RP(r2): 0x4004c154
-----
00006434 <__deallocate_stack>:
    6434:       6b c2 3f d9     stw rp,-14(,sp)
    6438:       34 1c 00 1c     ldi e,ret0
    643c:       37 de 01 00     ldo 80(sp),sp
    6440:       6b dc 3f 19     stw ret0,-74(,sp)
    6444:       2a 60 00 00     addil 0,r19,%r1
    6448:       23 8e cb d5     ldil -21524000,ret0
    644c:       48 22 00 b0     ldw 58(,r1),rp
    6450:       6b c6 3f 31     stw r6,-68(,sp)
    6454:       37 9c 3d df     ldo -111(ret0),ret0
    6458:       08 1a 02 46     copy r26,r6
	Save input struct pthread* to r6

    645c:       6b c4 3f 41     stw r4,-60(,sp)
    6460:       34 1d 00 02     ldi 1,ret1
    6464:       34 04 00 00     ldi 0,r4
    6468:       6b c3 3f 49     stw r3,-5c(,sp)
    646c:       08 01 02 43     copy r1,r3
    6470:       6b c8 3f 21     stw r8,-70(,sp)
    6474:       6b c7 3f 29     stw r7,-6c(,sp)
    6478:       6b c5 3f 39     stw r5,-64(,sp)
    647c:       6b d3 3f c1     stw r19,-20(,sp)
    6480:       6b dc 3f 11     stw ret0,-78(,sp)

Atomic CAS to acquire the stack_cache_lock
-----
    6484:       08 02 02 5a     copy rp,r26
    6488:       08 04 02 59     copy r4,r25
    648c:       08 1d 02 58     copy ret1,r24
    6490:       e4 00 81 60     be,l b0(sr2,r0),%sr0,%r31
    6494:       34 14 00 00     ldi 0,r20
    6498:       86 b6 20 02     cmpib,=,n b,r21,64a0 <__deallocate_stack+0x6c>
    649c:       08 00 02 40     nop
    64a0:       6b dc 3f 11     stw ret0,-78(,sp)
    64a4:       0a a0 04 15     sub r0,r21,r21
    64a8:       6b d5 3f 19     stw r21,-74(,sp)
-----

    64ac:       4b c5 3f 19     ldw -74(,sp),r5
    64b0:       84 bc 22 3a     cmpib,=,n e,r5,65d4 <__deallocate_stack+0x1a0>
    64b4:       4b d4 3f 19     ldw -74(,sp),r20
    64b8:       34 1c 01 f6     ldi fb,ret0
    64bc:       82 9c 22 22     cmpb,=,n ret0,r20,65d4 <__deallocate_stack+0x1a0>
    64c0:       4b dc 3f 11     ldw -78(,sp),ret0
    64c4:       8f 80 22 38     cmpib,<> 0,ret0,65e8 <__deallocate_stack+0x1b4>
    64c8:       08 13 02 44     copy r19,r4
    64cc:       34 d6 00 80     ldo 40(r6),r22
    64d0:       0e c8 10 9c     ldw 4(,r22),ret0
    64d4:       48 d5 00 80     ldw 40(,r6),r21
	Load parameter offset 40 from struct pthread*

    64d8:       40 d4 03 c2     ldb 1e1(,r6),r20
    64dc:       0e bc 12 88     stw ret0,4(,r21)
	Store result into that address
    .....                       *BOOM*
-----
/* Tests for POSIX timer implementation. */
#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

void hexdump(int * data, size_t length);

static void
notify_func1 (union sigval sigval)
{
  puts ("notify_func1");
}

static void
intr_sleep (int sec)
{
  struct timespec ts;

  ts.tv_sec = sec;
  ts.tv_nsec = 0;

  while (nanosleep (&ts, &ts) == -1 && errno == EINTR)
    ;
}

#define ZSIGALRM 14

void
hexdump(int * data, size_t length)
{
  unsigned int i;
  size_t wordlength = length / 4;
  for (i=0; i < wordlength; i++)
    {
      if ((i % 8) == 0)
        printf("\n");
      printf("%08x ", data[i]);
    }
  printf("\n");
}

int
main (void)
{
  timer_t timer_thr1;
  struct sigevent sigev2;
  struct itimerspec itimer2 = { { 0, 100000000 }, { 0, 500000000 } };
  struct itimerspec old;

  memset(&timer_thr1, '\0', sizeof(timer_thr1));  
  memset(&sigev2, '\0', sizeof(sigev2));  
  
  sigev2.sigev_notify = SIGEV_THREAD;
  sigev2.sigev_notify_function = notify_func1;
  sigev2.sigev_notify_attributes = NULL;
  /* It is unnecessary to do the following but to set a good example
     we do it anyhow.  */
  sigev2.sigev_value.sival_ptr = NULL;

  setvbuf (stdout, 0, _IOLBF, 0);

  hexdump((int *)&sigev2, sizeof(sigev2));
  hexdump((int *)&timer_thr1, sizeof(timer_thr1));

  if (timer_create (CLOCK_REALTIME, &sigev2, &timer_thr1) != 0)
    {
      printf ("timer_create for timer_thr1 failed: %m\n");
      exit (1);
    }
  
  hexdump((int *)&sigev2, sizeof(sigev2));
  hexdump((int *)&timer_thr1, sizeof(timer_thr1));
  
  if (timer_settime (timer_thr1, 0, &itimer2, &old) != 0)
    {
      printf ("timer_settime for timer_thr1 failed: %m\n");
      exit (1);
    }
  
  hexdump((int *)&sigev2, sizeof(sigev2));
  hexdump((int *)&timer_thr1, sizeof(timer_thr1));
  intr_sleep (6);
  
  if (timer_delete (timer_thr1) != 0)
    {
      printf ("timer_delete for timer_thr1 failed: %m\n");
      exit (1);
    }
  return 0;
}
-----

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
