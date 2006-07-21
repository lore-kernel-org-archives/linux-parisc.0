From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Mysterious hangs with parisc (a
	send_group_sig_info() analysis)
Date: Fri, 21 Jul 2006 20:05:32 +0000
Message-ID: <44C1338C.7010607@tiscali.be>
References: <20060624015935.GJ12481@quicksilver.road.mcmartin.ca>
	<200606240241.k5O2fALQ001885@hiauly1.hia.nrc.ca>
	<20060705164734.GB30640@athena.road.mcmartin.ca>
	<44AD54F0.90508@tiscali.be>
	<20060706183409.GB5692@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: James.Bottomley@SteelEye.com,
 John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060706183409.GB5692@athena.road.mcmartin.ca>
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

Kyle McMartin wrote:
--- snip ---
> 
> James' fix only applied to UP builds. :)
> 
Continuing investigation on this:

BUG: soft lockup detected on CPU#0!
Backtrace:
  [<0000000010112e70>] dump_stack+0x18/0x28
  [<0000000010176088>] softlockup_tick+0x120/0x160
  [<00000000101533b0>] run_local_timers+0x28/0x38
  [<0000000010153c48>] update_process_times+0x58/0xd8
  [<000000001011d898>] smp_do_timer+0x70/0x80
  [<0000000010114094>] timer_interrupt+0xd4/0x1e0
  [<0000000010176204>] handle_IRQ_event+0x74/0xd0
  [<0000000010176318>] __do_IRQ+0xb8/0x270
  [<0000000010114a6c>] do_cpu_irq_mask+0x11c/0x1e8
  [<0000000010104074>] intr_return+0x0/0x1c

smp n4k pb.

I figure out that with the kernel 2.6.17-pa3 compiled with gcc-3.3 this system run my stress test during 8 full days without pb.
Otoh when the same src were compiled with gcc-4.x the system vanished (panicing?) eracticaly after between  1 to 3 tree days of test.

So either gcc-3.3 produced the right stuff or hiden a bug?
So I managed to produce *.s files for gcc-3.3 and gcc-4.1 to attempt comparison.

But this Backtrace didn't show me any cpu status (even after I updated the firmware of pdc and gsp to their latest releases and 
tried the latest mingo's patch for lock validator?). Even thought Mike recalled me this old report: 
<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-March/028603.html>
  IAOQ[0]: _read_lock+0x18/0x30
  IAOQ[1]: _read_lock+0x8/0x30
  RP(r2): send_group_sig_info+0x3c/0xb0

I so used this as starting point of investigation:
--- snip ---
/*
  * This is the entry point for "process-wide" signals.
  * They will go to an appropriate thread in the thread group.
  */
int
send_group_sig_info(int sig, struct siginfo *info, struct task_struct *p)
{
         int ret;
         read_lock(&tasklist_lock);
         ret = group_send_sig_info(sig, info, p);
         read_unlock(&tasklist_lock);
         return ret;
}
--- snip ---

./include/linux/spinlock.h:
--- snip ---
#define read_lock(lock)                      _read_lock(lock)

/*
  * We inline the unlock functions in the nondebug case:
  */
#if defined(CONFIG_DEBUG_SPINLOCK) || defined(CONFIG_PREEMPT) || !defined(CONFIG_SMP)
# define spin_unlock(lock)              _spin_unlock(lock)
# define read_unlock(lock)              _read_unlock(lock)
# define write_unlock(lock)             _write_unlock(lock)
#else
# define spin_unlock(lock)              __raw_spin_unlock(&(lock)->raw_lock)
# define read_unlock(lock)              __raw_read_unlock(&(lock)->raw_lock)
# define write_unlock(lock)             __raw_write_unlock(&(lock)->raw_lock)
#endif

--- snip ---

Q1: according to this comment why don't we 'inline' read_lock() as read_unlock?

Lets have a look to the pre-compiled (.i) file:
precompiled:
--- snip ---
int
send_group_sig_info(int sig, struct siginfo *info, struct task_struct *p)
{
  int ret;
  _read_lock(&tasklist_lock);
  ret = group_send_sig_info(sig, info, p);
  __raw_read_unlock(&(&tasklist_lock)->raw_lock);
  return ret;
}
--- snip ---
static __inline__ __attribute__((always_inline)) void __raw_read_unlock(raw_rwlock_t *rw)
{
  __raw_spin_lock_flags(&rw->lock, 0);

  rw->counter--;

  __raw_spin_unlock(&rw->lock);
}
--- snip ---
static inline __attribute__((always_inline)) void __raw_spin_lock_flags(raw_spinlock_t *x,
       unsigned long flags)
{
  volatile unsigned int *a;


  __asm__ __volatile__("":::"memory");
  a = ((volatile unsigned int *)x);

  while (({ unsigned __ret; __asm__ __volatile__("ldcw,co" " 0(%1),%0" : "=r" (__ret) : "r" (a)); __ret; }) == 0)
   __asm__("; flag_0");
   while (*a == 0)
    if (flags & 0x00000001) {
     __asm__ __volatile__("ssm %0,%%r0\n" : : "i" (0x00000001) : "memory" );
     __asm__ __volatile__("":::"memory");
     __asm__ __volatile__("rsm %0,%%r0\n" : : "i" (0x00000001) : "memory" );
    } else
     __asm__ __volatile__("; cpu_relax\n\tnop\n\tnop\n" : : );

  __asm__ __volatile__("":::"memory");
}
--- snip ---

to be sure am i on the right place and make some asm highlighting:
  # diff -Nau spinlock.h.Orig spinlock.h
--- spinlock.h.Orig     2006-07-20 07:54:26.000000000 +0200
+++ spinlock.h  2006-07-21 19:37:16.000000000 +0200
@@ -20,8 +20,10 @@
  {
         volatile unsigned int *a;

-       mb();
+/*     mb(); */
+       __asm__ __volatile__("; raw_spin_lock_flags_in":::"memory");
         a = __ldcw_align(x);
+
         while (__ldcw(a) == 0)
                 while (*a == 0)
                         if (flags & PSW_SM_I) {
@@ -30,16 +32,19 @@
                                 local_irq_disable();
                         } else
                                 cpu_relax();
-       mb();
+/*     mb(); */
+       __asm__ __volatile__("; raw_spin_lock_flags_out":::"memory");
  }

  static inline void __raw_spin_unlock(raw_spinlock_t *x)
  {
         volatile unsigned int *a;
-       mb();
+/*     mb(); */
+       __asm__ __volatile__("; raw_spin_unlock_in":::"memory");
         a = __ldcw_align(x);
         *a = 1;
-       mb();
+/*     mb(); */
+       __asm__ __volatile__("; raw_spin_unlock_out":::"memory");
  }

  static inline int __raw_spin_trylock(raw_spinlock_t *x)

--- processor.h.Orig    2006-07-20 07:54:46.000000000 +0200
+++ processor.h 2006-07-20 08:14:30.000000000 +0200
@@ -355,7 +355,11 @@
  }
  #endif

+/*
  #define cpu_relax()    barrier()
+ */
+#define cpu_relax()    __asm__ __volatile__("; cpu_relax\n\tnop\n\tnop\n" : : )
+

  #endif /* __ASSEMBLY__ */


which obvioulsy produced different s files:
  # diff -y SGSI_gcc33.s.ban_noFlag0 SGSI_gcc41.s.ban_noFlag1
         .section        .text.send_group_sig_info,"ax",@progb           .section        .text.send_group_sig_info,"ax",@progb
         .align 8                                                        .align 8
.globl send_group_sig_info                                      .globl send_group_sig_info
         .type   send_group_sig_info, @function                          .type   send_group_sig_info, @function
send_group_sig_info:                                            send_group_sig_info:
         .PROC                                                           .PROC
         .CALLINFO FRAME=144,CALLS,SAVE_RP,ENTRY_GR=6          |         .CALLINFO FRAME=160,CALLS,SAVE_RP,ENTRY_GR=7
         .ENTRY                                                          .ENTRY
                                                               >         addil LT'tasklist_lock,%r27
         std %r2,-16(%r30)                                               std %r2,-16(%r30)
         std,ma %r7,144(%r30)                                  |         std,ma %r8,160(%r30)
         std %r6,-136(%r30)                                    |         copy %r24,%r8
         std %r5,-128(%r30)                                    <
         std %r4,-120(%r30)                                    <
         copy %r27,%r4                                         <
         ldo -48(%r30),%r29                                              ldo -48(%r30),%r29
         copy %r25,%r6                                         |         std %r7,-152(%r30)
         extrd,s %r26,63,32,%r5                                |         copy %r25,%r7
         addil LT'tasklist_lock,%r27                           |         std %r6,-144(%r30)
         ldd RT'tasklist_lock(%r1),%r1                         |         extrd,s %r26,63,32,%r6
         copy %r1,%r26                                         |         std %r5,-136(%r30)
                                                               >         ldd RT'tasklist_lock(%r1),%r5
                                                               >         copy %r5,%r26
                                                               >         std %r4,-128(%r30)
         b,l _read_lock,%r2                                              b,l _read_lock,%r2
         copy %r24,%r7                                         |         copy %r27,%r4
         copy %r6,%r25                                         <
         copy %r7,%r24                                         <
         copy %r4,%r27                                                   copy %r4,%r27
                                                               >         copy %r6,%r26
                                                               >         copy %r27,%r4
                                                               >         copy %r7,%r25
         ldo -48(%r30),%r29                                              ldo -48(%r30),%r29
         b,l group_send_sig_info,%r2                                     b,l group_send_sig_info,%r2
         copy %r5,%r26                                         |         copy %r8,%r24
         addil LT'tasklist_lock,%r4                            |         copy %r4,%r27
         ldd RT'tasklist_lock(%r1),%r20                        |         copy %r28,%r19
#APP                                                            #APP
         ; raw_spin_lock_flags_in                                        ; raw_spin_lock_flags_in
         ldcw,co 0(%r20),%r19                                  <
#NO_APP                                                         #NO_APP
         cmpib,<>,n 0,%r19,.L895                               | .L944:
.L890:                                                        | #APP
         ldw 0(%r20),%r19                                      |         ldcw,co 0(%r5),%r28
         cmpib,<>,n 0,%r19,.L897                               | #NO_APP
.L889:                                                        |         cmpib,<>,n 0,%r28,.L946
                                                               > .L945:
                                                               >         ldw 0(%r5),%r28
                                                               >         cmpb,*<> %r0,%r28,.L944
                                                               >         nop
#APP                                                            #APP
         ; cpu_relax                                                     ; cpu_relax
         nop                                                             nop
         nop                                                             nop

#NO_APP                                                         #NO_APP
         ldw 0(%r20),%r19                                      |         b,n .L945
         cmpib,= 0,%r19,.L889                                  | .L946:
         nop                                                   <
.L897:                                                        <
#APP                                                          <
         ldcw,co 0(%r20),%r19                                  <
#NO_APP                                                       <
         cmpib,= 0,%r19,.L890                                  <
         nop                                                   <
.L895:                                                        <
#APP                                                            #APP
         ; raw_spin_lock_flags_out                                       ; raw_spin_lock_flags_out
#NO_APP                                                         #NO_APP
         ldw 4(%r20),%r19                                      |         addil LT'tasklist_lock,%r27
         ldo -1(%r19),%r19                                     |         ldd RT'tasklist_lock(%r1),%r31
         stw %r19,4(%r20)                                      |         ldw 4(%r31),%r28
                                                               >         ldo -1(%r28),%r28
                                                               >         stw %r28,4(%r31)
#APP                                                            #APP
         ; raw_spin_unlock_in                                            ; raw_spin_unlock_in
#NO_APP                                                         #NO_APP
         ldi 1,%r19                                            |         ldi 1,%r28
         stw %r19,0(%r20)                                      |         stw %r28,0(%r5)
#APP                                                            #APP
         ; raw_spin_unlock_out                                           ; raw_spin_unlock_out
#NO_APP                                                         #NO_APP
         ldd -120(%r30),%r4                                    |         copy %r19,%r28
         ldd -128(%r30),%r5                                    |         ldd -176(%r30),%r2
         ldd -160(%r30),%r2                                    |         ldd -152(%r30),%r7
         ldd -136(%r30),%r6                                    |         ldd -144(%r30),%r6
                                                               >         ldd -136(%r30),%r5
                                                               >         ldd -128(%r30),%r4
         bve (%r2)                                                       bve (%r2)
         ldd,mb -144(%r30),%r7                                 |         ldd,mb -160(%r30),%r8
         .EXIT                                                           .EXIT
         .PROCEND                                                        .PROCEND
         .size   send_group_sig_info, .-send_group_sig_info              .size   send_group_sig_info, .-send_group_sig_info

And here are a lot of questions:
	Q2: some diff in routine like 2 times ldcw with gcc-3 and only one with gcc-4 (may be ok?)

	Q3: a 64bit comparison (cmpb,*<> %r0,%r28,.L944) introduced with gcc-4?

	Q4: imho the most important: with 2 gcc where is the couple of ssm/rsm that jejb introduced in his patch:

<http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2005-October/036211.html>
--- linux-2.6/include/asm-parisc/spinlock.h	2005/09/14 14:42:11	1.16
+++ linux-2.6/include/asm-parisc/spinlock.h	2005/10/20 16:07:04	1.17
@@ -11,18 +11,25 @@
  	return *a == 0;
  }

-#define __raw_spin_lock_flags(lock, flags) __raw_spin_lock(lock)
+#define __raw_spin_lock(lock) __raw_spin_lock_flags(lock, 0)
  #define __raw_spin_unlock_wait(x) \
  		do { cpu_relax(); } while (__raw_spin_is_locked(x))

-static inline void __raw_spin_lock(raw_spinlock_t *x)
+static inline void __raw_spin_lock_flags(raw_spinlock_t *x,
+					 unsigned long flags)
  {
  	volatile unsigned int *a;

  	mb();
  	a = __ldcw_align(x);
  	while (__ldcw(a) == 0)
-		while (*a == 0);
+		while (*a == 0)
+			if (flags & PSW_SM_I) {
+				local_irq_enable();
+				cpu_relax();
+				local_irq_disable();
+			} else
+				cpu_relax();
  	mb();
  }

?

Mike, feel free to complete this summary if something looks like bad, not complete or not clear ;-)

Thanks for help,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
