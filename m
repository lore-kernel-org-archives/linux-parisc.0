From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: increase kernel stack size to 32k
Date: Sat, 27 Apr 2013 23:53:43 +0200
Message-ID: <517C48E7.7050701@gmx.de>
References: <20130423202203.GA7287@p100.box> <51778ADE.4010906@gmx.de> <1366836075.1971.22.camel@dabdike> <20130426223014.GA19671@p100.box>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000209020801060300070501"
Cc: linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130426223014.GA19671@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------000209020801060300070501
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/27/2013 12:30 AM, Helge Deller wrote:
> * James Bottomley <James.Bottomley@HansenPartnership.com>:
>> On Wed, 2013-04-24 at 09:33 +0200, Helge Deller wrote:
>>> On 04/23/2013 10:22 PM, Helge Deller wrote:
>>>> commit e4e1e78facf7565cada909a69c7fb6415b6e7b83
>>>> Author: Helge Deller <deller@gmx.de>
>>>> Date:   Tue Apr 23 17:19:37 2013 +0200
>>>>
>>>> parisc: increase kernel stack size to 32k
>>>>
>>>> --- a/arch/parisc/include/asm/thread_info.h
>>>> +++ b/arch/parisc/include/asm/thread_info.h
>>>> -#define THREAD_SIZE_ORDER            2
>>>> +#define THREAD_SIZE_ORDER            3	/* 32k stack */
>>>
>>> I tested again, and it actually needs to be 64k stacks to not crash any longer.
>>> So, the right temporary fix is:
>>>
>>>> +#define THREAD_SIZE_ORDER            4	/* 64k stack */
>>>
>>> Will send updated patch soon.
>>
>> This is an indicator of something seriously wrong somewhere.  We've
>> always had the 16k stack just because of our large frames.  In theory,
>> the IRQ stack should only be the same size as the kernel stack, so if we
>> have both in the same place, we should only need at max 32k ... if we're
>> still seeing problems related to stack overrun, then it might be we have
>> an IRQ recursion where we shouldn't have.  To be honest, I have a hard
>> time explaining why our stacks should be over 8k.

Attached is a new version of my irq-stack-patch, which made my system really stable :-)
As test I did used "hackbench 300" (from the LTP project) which created 12000 threads:
uptime: 23:44:09 up 17 min,  2 users,  load average: 1232.23, 2966.09, 2466.39

My findings so far:
* kernel stack: THREAD_SIZE_ORDER needs to be at least 2 (=16k). x86 has 1 (8k).
  With 8k kernel stacks and  DEBUG_STACKOVERFLOW enabled, I get directly after bootup: 
stackcheck: swapper/0 has overflown a kernel stack (sp:bfc52030, stk bottom-top:bfc50000-bfc52000)

* IRQ stack: 16k seems sufficient as well.

So, the combination of 16k kernel stack and 16k irq stacks seems OK.

I still need to clean up my patch, test if backtraces still work (with which I currently
have problems) and prepare a final patch. 

Helge

--------------000209020801060300070501
Content-Type: text/plain; charset=UTF-8;
 name="irqstack.patch6"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="irqstack.patch6"

diff --git a/arch/parisc/Kconfig.debug b/arch/parisc/Kconfig.debug
index 7305ac8..ed88c37 100644
--- a/arch/parisc/Kconfig.debug
+++ b/arch/parisc/Kconfig.debug
@@ -12,6 +12,17 @@ config DEBUG_RODATA
          portion of the kernel code won't be covered by a TLB anymore.
          If in doubt, say "N".
 
+config DEBUG_STACKOVERFLOW
+	bool "Check for stack overflows"
+	depends on DEBUG_KERNEL
+	---help---
+	  Say Y here if you want to check the overflows of kernel, IRQ
+	  and exception stacks. This option will cause messages of the
+	  stacks in detail when free stack space drops below a certain
+	  limit.
+	  If in doubt, say "N".
+
+
 config DEBUG_STRICT_USER_COPY_CHECKS
 	bool "Strict copy size checks"
 	depends on DEBUG_KERNEL && !TRACE_BRANCH_PROFILING
diff --git a/arch/parisc/include/asm/irq.h b/arch/parisc/include/asm/irq.h
index 1073599..0417ebf 100644
--- a/arch/parisc/include/asm/irq.h
+++ b/arch/parisc/include/asm/irq.h
@@ -10,6 +10,8 @@
 #include <linux/cpumask.h>
 #include <asm/types.h>
 
+#define __ARCH_HAS_DO_SOFTIRQ
+
 #define NO_IRQ		(-1)
 
 #ifdef CONFIG_GSC
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 09b54a5..d725591 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -20,8 +20,6 @@
 
 #endif /* __ASSEMBLY__ */
 
-#define KERNEL_STACK_SIZE 	(4*PAGE_SIZE)
-
 /*
  * Default implementation of macro that returns current
  * instruction pointer ("program counter").
@@ -33,6 +31,8 @@
 #endif
 #define current_text_addr() ({ void *pc; current_ia(pc); pc; })
 
+#define get_current_sp(sp)	__asm__("copy %%r30, %0" : "=r"(sp))
+
 #define TASK_SIZE_OF(tsk)       ((tsk)->thread.task_size)
 #define TASK_SIZE	        TASK_SIZE_OF(current)
 #define TASK_UNMAPPED_BASE      (current->thread.map_base)
@@ -61,6 +61,20 @@
 #ifndef __ASSEMBLY__
 
 /*
+ * IRQ STACK - used for irq and irq bh handler
+ */
+#ifdef __KERNEL__
+
+#define IRQ_STACK_SIZE (4096 << 2) /* = 16k, todo: use: PAGE_SIZE instead of 4096 */
+
+union irq_stack_union {
+	unsigned long irq_stack[IRQ_STACK_SIZE/sizeof(unsigned long)];
+};
+
+DECLARE_PER_CPU(union irq_stack_union, irq_stack_union);
+#endif /* __KERNEL__ */
+
+/*
  * Data detected about CPUs at boot time which is the same for all CPU's.
  * HP boxes are SMP - ie identical processors.
  *
diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index d1fb79a..85568cc 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -40,7 +40,7 @@ struct thread_info {
 
 /* thread information allocation */
 
-#define THREAD_SIZE_ORDER            2
+#define THREAD_SIZE_ORDER            2 /* keep value 2 for 16k, use 3 for 32k */
 /* Be sure to hunt all references to this down when you change the size of
  * the kernel stack */
 #define THREAD_SIZE             (PAGE_SIZE << THREAD_SIZE_ORDER)
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index f33201b..117d516 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1997,6 +1997,28 @@ ftrace_stub:
 ENDPROC(return_to_handler)
 #endif	/* CONFIG_FUNCTION_TRACER */
 
+/* void call_on_stack(unsigned long param1, void *func, unsigned long new_stack) */
+ENTRY(call_on_stack)
+	STREG	%sp, 8(%arg2)
+	STREG	%rp, 16(%arg2)
+
+	/* HPPA calling convention for function pointers */
+#ifdef CONFIG_64BIT
+	LDREG	16(%arg1), %arg1
+	bve,l	(%arg1), %rp
+	addi    0x40, %arg2, %sp
+#else
+	addi    0x40, %arg2, %sp
+	be,l	0(%sr4,%arg1), %sr0, %r31
+	copy	%r31, %rp
+#endif
+
+	addi    -0x40, %sp, %sp
+	LDREG	16(%sp),%rp
+	bv	(%rp)
+	LDREG	8(%sp),%sp
+ENDPROC(call_on_stack)
+
 
 get_register:
 	/*
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 8094d3e..6c23120 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -330,6 +330,60 @@ static inline int eirr_to_irq(unsigned long eirr)
 	return (BITS_PER_LONG - bit) + TIMER_IRQ;
 }
 
+
+int sysctl_panic_on_stackoverflow __read_mostly;
+
+/*
+ * Stack overflow check:
+ */
+static inline void stack_overflow_check(unsigned long sp, unsigned long stack_start,
+			unsigned long stack_size, const char *stackname)
+{
+#ifdef CONFIG_DEBUG_STACKOVERFLOW
+#define STACK_MARGIN	128
+	if (likely((sp - stack_start) < (stack_size - STACK_MARGIN)))
+		return;
+
+	WARN("stackcheck: %s has overflown the %s stack (sp:%lx, stk bottom-top:%lx-%lx)\n",
+		current->comm, stackname, sp,
+		stack_start, stack_start + stack_size);
+
+	if (sysctl_panic_on_stackoverflow)
+		panic("low stack detected by irq handler - check messages\n");
+#endif
+}
+
+extern void call_on_stack(unsigned long param1, void *func, unsigned long new_stack); /* in entry.S */
+
+
+static void noinline execute_on_irq_stack(void *func, unsigned long param1)
+{
+	int cpu = smp_processor_id();
+	unsigned long sp, irq_stack;
+	void (*direct_call)(unsigned long param1) = func;
+
+	irq_stack = (unsigned long) &per_cpu(irq_stack_union, cpu);
+	get_current_sp(sp);
+
+	/*
+	 * this is where we try to switch to the IRQ stack. However, if we are
+	 * already using the IRQ stack (because we interrupted a hardirq
+	 * handler) we can't do that and just have to keep using the
+	 * current stack (which is the irq stack already after all)
+	 */
+
+	if ((sp - irq_stack) >= IRQ_STACK_SIZE) {
+		stack_overflow_check(sp, (unsigned long)task_stack_page(current), THREAD_SIZE, "kernel");
+		call_on_stack(param1, func, irq_stack);
+		// WARN_ON_ONCE(1); /* enable to check if irq stack is being used. */
+		// TODO: check if backtrace works from irq stack
+		// TODO: use get_current_sp() macro in other code as well.
+	} else {
+		stack_overflow_check(sp,  irq_stack, IRQ_STACK_SIZE, "irq");
+		direct_call(param1);
+	}
+}
+
 /* ONLY called from entry.S:intr_extint() */
 void do_cpu_irq_mask(struct pt_regs *regs)
 {
@@ -364,7 +418,7 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 		goto set_out;
 	}
 #endif
-	generic_handle_irq(irq);
+	execute_on_irq_stack(&generic_handle_irq, irq);
 
  out:
 	irq_exit();
@@ -423,3 +477,24 @@ void __init init_IRQ(void)
 
 }
 
+DEFINE_PER_CPU(union irq_stack_union, irq_stack_union);
+
+asmlinkage void do_softirq(void)
+{
+	__u32 pending;
+	unsigned long flags;
+
+	if (in_interrupt())
+		return;
+
+	local_irq_save(flags);
+
+	pending = local_softirq_pending();
+
+	/* Switch to interrupt stack */
+	if (pending) {
+		execute_on_irq_stack(&__do_softirq, 0);
+		WARN_ON_ONCE(softirq_count());
+	}
+	local_irq_restore(flags);
+}

--------------000209020801060300070501--
