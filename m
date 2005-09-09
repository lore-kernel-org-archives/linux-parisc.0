From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.13-pa1 + mm1 relayfs + relay-apps-0.8 works
	for	the most
Date: Fri, 09 Sep 2005 19:54:14 +0000
Message-ID: <4321E866.7050106@tiscali.be>
References: <IMI60O$028EFC99FEAF5A22C521A5C6437C7977@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IMI60O$028EFC99FEAF5A22C521A5C6437C7977@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Joel Soete wrote:
> Hello all,
> 
> Just for info:
> I just finishe to play to grab relayfs from 2.6.13-mm1 (I didn't apply all
> because spinlock-consolidation affraid me a bit)

Much more fore reminder: today it was mm2 and hack it just a few but :_(
   gcc -Wp,-MD,arch/parisc/kernel/.asm-offsets.s.d  -nostdinc -isystem /usr/lib/gcc/hppa-linux-gnu/4.0.2/include -D__KERNEL__ -Iinclu
de -Iinclude2 -I/usr/src/linux-2.6.13-pa1-mm2-20050908/include -I/usr/src/linux-2.6.13-pa1-mm2-20050908/arch/parisc/kernel -Iarch/pa
risc/kernel -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -ffreestanding -O2 -fomit-frame-pointe
r -pipe -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1 -mschedule=7200 -Wdeclaration-after-st
atement -Wno-pointer-sign  -DKBUILD_BASENAME=asm_offsets -DKBUILD_MODNAME=asm_offsets -S -o arch/parisc/kernel/asm-offsets.s /usr/sr
c/linux-2.6.13-pa1-mm2-20050908/arch/parisc/kernel/asm-offsets.c
In file included from include2/asm/spinlock.h:6,
                  from include2/asm/bitops.h:6,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/bitops.h:77,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/thread_info.h:20,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/preempt.h:10,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock.h:50,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/spinlock_types.h:14: error: conflicting types for 'raw_spinlock_t'
/usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock_types_up.h:30: error: previous declaration of 'raw_spinlock_t' was her
e
In file included from include2/asm/spinlock.h:6,
                  from include2/asm/bitops.h:6,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/bitops.h:77,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/thread_info.h:20,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/preempt.h:10,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock.h:50,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/spinlock_types.h:22:1: warning: "__RAW_SPIN_LOCK_UNLOCKED" redefined
In file included from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock_types.h:15,
                  from include2/asm/processor.h:14,
                  from include2/asm/spinlock.h:5,
                  from include2/asm/bitops.h:6,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/bitops.h:77,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/thread_info.h:20,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/preempt.h:10,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock.h:50,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/arch/parisc/kernel/asm-offsets.c:31:
/usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock_types_up.h:32:1: warning: this is the location of the previous definit
ion
include2/asm/spinlock_types.h:27: error: conflicting types for 'raw_rwlock_t'
/usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock_types_up.h:43: error: previous declaration of 'raw_rwlock_t' was here
In file included from include2/asm/spinlock.h:6,
                  from include2/asm/bitops.h:6,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/bitops.h:77,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/thread_info.h:20,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/preempt.h:10,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock.h:50,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/spinlock_types.h:29:1: warning: "__RAW_RW_LOCK_UNLOCKED" redefined
In file included from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock_types.h:15,
                  from include2/asm/processor.h:14,
                  from include2/asm/spinlock.h:5,
                  from include2/asm/bitops.h:6,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/bitops.h:77,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/thread_info.h:20,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/preempt.h:10,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock.h:50,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/arch/parisc/kernel/asm-offsets.c:31:
/usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock_types_up.h:45:1: warning: this is the location of the previous definit
ion
In file included from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock.h:90,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/arch/parisc/kernel/asm-offsets.c:31:
/usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock_up.h:71:1: warning: "__raw_spin_unlock_wait" redefined
In file included from include2/asm/bitops.h:6,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/bitops.h:77,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/thread_info.h:20,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/preempt.h:10,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/spinlock.h:50,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/spinlock.h:20:1: warning: this is the location of the previous definition
In file included from include2/asm/semaphore.h:28,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/sched.h:20,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/arch/parisc/kernel/asm-offsets.c:31:
/usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/wait.h: In function 'init_waitqueue_head':
/usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/wait.h:82: error: unknown field 'lock' specified in initializer
/usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/wait.h:82: error: extra brace group at end of initializer
/usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/wait.h:82: error: (near initialization for '(anonymous).raw_lock')
/usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/wait.h:82: warning: excess elements in struct initializer
/usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/wait.h:82: warning: (near initialization for '(anonymous).raw_lock')
In file included from /usr/src/linux-2.6.13-pa1-mm2-20050908/include/linux/sched.h:20,
                  from /usr/src/linux-2.6.13-pa1-mm2-20050908/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/semaphore.h: In function 'sema_init':
include2/asm/semaphore.h:63: error: unknown field 'lock' specified in initializer
include2/asm/semaphore.h:63: error: extra brace group at end of initializer
include2/asm/semaphore.h:63: error: (near initialization for '(anonymous).raw_lock')
include2/asm/semaphore.h:63: warning: excess elements in struct initializer
include2/asm/semaphore.h:63: warning: (near initialization for '(anonymous).raw_lock')
include2/asm/semaphore.h:63: error: unknown field 'lock' specified in initializer
include2/asm/semaphore.h:63: error: extra brace group at end of initializer
include2/asm/semaphore.h:63: error: (near initialization for '(anonymous).raw_lock')
include2/asm/semaphore.h:63: warning: excess elements in struct initializer
include2/asm/semaphore.h:63: warning: (near initialization for '(anonymous).raw_lock')
make[2]: *** [arch/parisc/kernel/asm-offsets.s] Error 1
make[1]: *** [arch/parisc/kernel/asm-offsets.s] Error 2
make: *** [vmlinux] Error 2

I need a more detail attention and time to try to fix that stuff ...

but where I couldn't help it's in sched-add-cacheflush-asm.patch:
diff -puN include/asm-parisc/system.h~sched-add-cacheflush-asm include/asm-parisc/system.h
--- devel/include/asm-parisc/system.h~sched-add-cacheflush-asm	2005-09-07 20:11:01.000000000 -0700
+++ devel-akpm/include/asm-parisc/system.h	2005-09-07 20:11:02.000000000 -0700
@@ -49,6 +49,15 @@ extern struct task_struct *_switch_to(st
  	(last) = _switch_to(prev, next);			\
  } while(0)

+/*
+ * On SMP systems, when the scheduler does migration-cost autodetection,
+ * it needs a way to flush as much of the CPU's caches as possible.
+ *
+ * TODO: fill this in!
+ */
+static inline void sched_cacheflush(void)
+{
+}


  /* interrupt control */

Any idea?

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
