From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] CONFIG_DEBUG_RWLOCK: pb to build a smp 64bit kernel
Date: Wed, 24 Nov 2004 17:46:23 +0100
Message-ID: <418A8131000077FC@mail-7-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
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

Hello all,

As I mentioned in previous info I try a loop to compile the kernel on a
n4k dual cpu with 4Gb of ram.
And unfortuantely, after a various number of build (20, 120,  24, 5) the
system always do the same kernel_fault() in update_one_process():
This short update to already mentioned that it doesn't help:
Backtrace:
 [<0000000010165810>] update_process_times+0x50/0x90
 [<000000001011594c>] timer_interrupt+0xec/0x308
 [<0000000010116708>] do_irq+0xd8/0x1e8
 [<00000000101168f8>] do_cpu_irq_mask+0xe0/0x150
 [<0000000010107074>] intr_return+0x0/0x24


Kernel Fault: Code=3D26 regs=3D000000007be04d40 (Addr=3D00000000000000d0)=


     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Not tainted
r00-03  0000000000000000 ffffffffffff0a40 00000000101656c4 000000001061f0=
40
r04-07  0000000080806838 0000000000000011 0000000000000000 00000000000000=
00
r08-11  0000000000000001 000000007be04580 0000000000000010 00000000808068=
d8
r12-15  00000000000248c0 0000000000000000 0000000080806950 000000007be044=
10
r16-19  000000007be04580 0000000000000000 0000000000000000 00000000000000=
00
r20-23  0000000004400000 0000000004400000 0000000000000000 00000000000004=
40
r24-27  0000000000000000 0000000000000000 0000000000000440 000000001061f0=
40
r28-31  0000000000000000 0000000000000000 000000007be04d40 000000000000fa=
00
sr0-3   0000000006d1f000 0000000000000000 0000000000000000 0000000006d1f0=
00
sr4-7   0000000000000000 0000000000000000 0000000000000000 00000000000000=
00

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000101656cc 0000000010=
1656d0
 IIR: 527401a0    ISR: 0000000000000000  IOR: 00000000000000d0
 CPU:        0   CR30: 000000007be04000 CR31: 00000000105e4000
 ORIG_R28: 0000000010149214
 IAOQ[0]: update_one_process+0x74/0x168
 IAOQ[1]: update_one_process+0x78/0x168
 RP(r2): update_one_process+0x6c/0x168
Kernel panic - not syncing: Kernel Fault

at the same place.

A dump of kernel/timer.o shows:
0000000000000000 <update_one_process>:
   0:   0f c2 12 c1     std rp,-10(,sp)
   4:   37 de 02 00     ldo 100(sp),sp
   8:   73 c4 3e 51     std r4,-d8(sp)
   c:   73 c7 3e 21     std r7,-f0(sp)
  10:   73 c5 3e 41     std r5,-e0(sp)
  14:   73 c3 3e 61     std r3,-d0(sp)
  18:   08 1a 02 44     copy r26,r4
  1c:   08 19 02 47     copy r25,r7
  20:   73 c6 3e 31     std r6,-e8(sp)
  24:   08 1b 02 43     copy dp,r3
  28:   50 93 05 30     ldd 298(r4),r19
  2c:   50 94 05 40     ldd 2a0(r4),r20
  30:   0b 14 0a 34     add,l r20,r24,r20
  34:   08 f3 0a 33     add,l r19,r7,r19
  38:   50 95 0c 40     ldd 620(r4),r21
  3c:   0a 93 0a 25     add,l r19,r20,r5
  40:   70 93 05 30     std r19,298(r4)
  44:   ee a0 20 e0     cmpib,*=3D 0,r21,bc <update_one_process+0xbc>
  48:   70 94 05 40     std r20,2a0(r4)
  4c:   0c 80 10 d3     ldd 0(,r4),r19
  50:   34 14 00 60     ldi 30,r20
  54:   0a 93 02 33     and r19,r20,r19
  58:   ee 60 a0 b8     cmpib,*<> 0,r19,bc <update_one_process+0xbc>
  5c:   08 05 02 5a     copy r5,r26
  60:   34 19 07 d0     ldi 3e8,r25
  64:   e8 00 a0 00     b,l 6c <update_one_process+0x6c>,%r2
  68:   37 dd 3f e1     ldo -10(sp),ret1
  6c:   50 93 0c 40     ldd 620(r4),r19
  70:   08 1c 02 46     copy ret0,r6
  74:   52 74 01 a0     ldd d0(r19),r20
  78:   bc d4 a0 78     cmpb,*>> r20,r6,bc <update_one_process+0xbc>
  7c:   08 03 02 5b     copy r3,dp
  80:   08 05 02 5a     copy r5,r26

that's match the backtrace as r19=3D=3D0

but why?

scaning a bit codehelp me to figure out it should came from:
do_process_times()
    |------> send_sig() ----> return send_sig_info()
                                         |-----> _read_lock()

#define _read_lock(lock)        \
do { \
        preempt_disable(); \
        _raw_read_lock(lock); \
} while(0)

#ifdef CONFIG_DEBUG_RWLOCK
extern void _dbg_read_lock(rwlock_t * rw, const char *bfile, int bline);
#define _raw_read_lock(rw) _dbg_read_lock(rw, __FILE__, __LINE__)
#else
static  __inline__ void _raw_read_lock(rwlock_t *rw)

And so I tried to compile kernel with CONFIG_DEBUG_RWLOCK=3Dy

but unfortuantely it early failed to build:
  hppa64-linux-gcc -Wp,-MD,kernel/.spinlock.o.d -nostdinc -iwithprefix in=
clude
-D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing
-fno-common -O2 -fomit-frame-pointer -pipe -mno-space-regs -mfast-indirec=
t-calls
-ffunction-sections -march=3D2.0 -mschedule=3D8000 -Wdeclaration-after-st=
atement
   -DKBUILD_BASENAME=3Dspinlock -DKBUILD_MODNAME=3Dspinlock -c -o kernel/=
spinlock.o
kernel/spinlock.c
kernel/spinlock.c: In function `_write_trylock':
kernel/spinlock.c:28: void value not ignored as it ought to be
make[1]: *** [kernel/spinlock.o] Error 1
make: *** [kernel] Error 2

The error message seems to be incomplet :(

Knowing that it is still:
  hppa64-linux-gcc -Wp,-MD,kernel/.spinlock.o.d -nostdinc -iwithprefix in=
clude
-D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing
-fno-common -O2 -fomit-frame-pointer -pipe -mno-space-regs -mfast-indirec=
t-calls
-ffunction-sections -march=3D2.0 -mschedule=3D8000 -Wdeclaration-after-st=
atement
   -DKBUILD_BASENAME=3Dspinlock -DKBUILD_MODNAME=3Dspinlock -c -o kernel/=
spinlock.o
kernel/spinlock.c
kernel/spinlock.c: In function `_write_trylock':
kernel/spinlock.c:28: void value not ignored as it ought to be
make[1]: *** [kernel/spinlock.o] Error 1
make: *** [kernel] Error 2

Is it a known bug.
Should I have to upgrade to gcc-3.3 64bit?

Thanks in advance for help,
    Joel


-------------------------------------------------------------------------=
--
Tiscali vous offre 3 mois d'ADSL et 3 mois de DVD gratuits...profitez-en.=
..
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
