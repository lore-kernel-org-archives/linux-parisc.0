From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] fix intermittent panics on wide firmware boxes
Date: Fri, 01 Feb 2008 12:24:01 -0600
Message-ID: <1201890241.3134.54.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I've been trying to diagnose this panic on a pa8800 box with git head:

LBA: Truncating lmmio_space [fffffffff0000000/fffffffffecffffe] to [fffffffff0000000,fffffffffe77ffff]
powersw: Soft power switch support not available.
Backtrace:
 [<000000004011c7a0>] real32_call+0x148/0x178
 [<000000004013ec7c>] enqueue_task_fair+0x6c/0xb0
 [<000000004013f418>] update_rq_clock+0x30/0x48
 [<000000004013e800>] set_next_entity+0x38/0x70
 [<000000004016dca0>] autoremove_wake_function+0x18/0x48
 [<00000000401bbda4>] cache_alloc_debugcheck_after+0x24c/0x300
 [<000000004025c500>] kobject_uevent_env+0x418/0x5a8
 [<000000004025b10c>] kobject_put+0x24/0x30
 [<000000004015af60>] __sysctl_head_next+0x78/0x120
 [<0000000040174234>] sysctl_check_table+0x494/0x938
 [<000000004015b078>] sysctl_head_finish+0x40/0x60
 [<000000004011c7a0>] real32_call+0x148/0x178
 [<000000004013e3f8>] calc_delta_mine+0x68/0xf8
 [<000000004018621c>] touch_softlockup_watchdog+0x3c/0x50
 [<000000004014a66c>] task_tick_fair+0x84/0xf0
 [<0000000040186720>] softlockup_tick+0x128/0x1c0


Kernel Fault: Code=26 regs=000000007f46c7d0 (Addr=0000000000000158)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000000000001111 Not tainted
r00-03  000000000804000f 0000000040583be0 0000000040104084 000000007f46c290
r04-07  000000004057f3e0 000000007f46c360 0000000000000000 000000007f44e040
r08-11  00000000404d7dc0 0000000000000000 000000007f44e288 00000000405bc340
r12-15  0000000000000001 00000000405bbc00 0000000040447300 0000000000000001
r16-19  000000007f46c360 00000000404dc400 00000000405bc340 0000000000000000
r20-23  000000007f46c290 0000000000000000 0000000000000310 0000000000000000
r24-27  0000000000000000 000000007f46c360 00000000403d5030 000000004057f3e0
r28-31  000000007f46c000 000000007f46c690 000000007f46c7d0 000000007f46c000
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004011af54 000000004011af58
 IIR: 4a7702b0    ISR: 0000000000000000  IOR: 0000000000000158
 CPU:        0   CR30: 000000007f46c000 CR31: fffffff0f0e098e0
 ORIG_R28: 000000004013e3f8
 IAOQ[0]: handle_interruption+0x804/0x890
 IAOQ[1]: handle_interruption+0x808/0x890
 RP(r2): intr_check_sig+0x0/0x38

The reason is actually that %cr30 is NULL, which should be an
impossibility.  However, all the real32_call() places in the trace
intrigued me because they shouldn't happen on a pa8800 ... it has only
wide firmware, so only 64 bit realmode calls can work.

It transpires that the way we call PDC console constantly causes these
real32_call() calls to be invoked leading to the panic.  Sure enough, if
I scrub them out of my build with the attached patch, the panic goes and
git head boots just fine.

James

diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 27827bc..7ddf756 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -11,10 +11,11 @@ obj-y	     	:= cache.o pacache.o setup.o traps.o time.o irq.o \
 		   pa7300lc.o syscall.o entry.o sys_parisc.o firmware.o \
 		   ptrace.o hardware.o inventory.o drivers.o semaphore.o \
 		   signal.o hpmc.o real2.o parisc_ksyms.o unaligned.o \
-		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o \
+		   process.o processor.o pdc_chassis.o unwind.o \
 		   topology.o
 
 obj-$(CONFIG_SMP)	+= smp.o
+obj-$(CONFIG_PDC_CONSOLE)	+= pdc_cons.o
 obj-$(CONFIG_PA11)	+= pci-dma.o
 obj-$(CONFIG_PCI)	+= pci.o
 obj-$(CONFIG_MODULES)	+= module.o
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 4ab83d5..378bc61 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1080,7 +1080,7 @@ void pdc_io_reset_devices(void)
 	spin_unlock_irqrestore(&pdc_lock, flags);
 }
 
-
+#ifdef CONFIG_PDC_CONSOLE
 /**
  * pdc_iodc_print - Console print using IODC.
  * @str: the string to output.
@@ -1168,7 +1168,9 @@ int pdc_iodc_getc(void)
 	
 	return ch;
 }
+#endif
 
+#ifdef CONFIG_FB_STI
 int pdc_sti_call(unsigned long func, unsigned long flags,
                  unsigned long inptr, unsigned long outputr,
                  unsigned long glob_cfg)
@@ -1183,6 +1185,7 @@ int pdc_sti_call(unsigned long func, unsigned long flags,
         return retval;
 }
 EXPORT_SYMBOL(pdc_sti_call);
+#endif
 
 #ifdef CONFIG_64BIT
 /**
@@ -1375,7 +1378,6 @@ int pdc_pat_io_pci_cfg_write(unsigned long pci_addr, int pci_size, u32 val)
  * to overlay real_stack (real2.S), preparing a 32-bit call frame.
  * real32_call_asm() then uses this stack in narrow real mode
  */
-
 struct narrow_stack {
 	/* use int, not long which is 64 bits */
 	unsigned int arg13;
@@ -1404,6 +1406,14 @@ long real32_call(unsigned long fn, ...)
 	extern unsigned long real32_call_asm(unsigned int *,
 					     unsigned int *, 
 					     unsigned int);
+
+	/* Calling real32_call without narrow firmware is a serious
+	 * problem and can lead to crashes */
+	if (unlikely(!parisc_narrow_firmware)) {
+		printk(KERN_ERR "Invalid call to 32 bit firmware\n");
+		WARN_ON(1);
+		return -EINVAL;
+	}
 	
 	va_start(args, fn);
 	real_stack.arg0 = va_arg(args, unsigned int);
diff --git a/include/asm-parisc/pdc.h b/include/asm-parisc/pdc.h
index deda8c3..d11aabb 100644
--- a/include/asm-parisc/pdc.h
+++ b/include/asm-parisc/pdc.h
@@ -588,8 +588,13 @@ struct pdc_hpmc_pim_20 { /* PDC_PIM */
 	__u64 fr[32];
 };
 
+#ifdef CONFIG_PDC_CONSOLE
 void pdc_console_init(void);	/* in pdc_console.c */
 void pdc_console_restart(void);
+#else
+static inline void  pdc_console_init(void) { }
+static inline void pdc_console_restart(void) { }
+#endif
 
 void setup_pdc(void);		/* in inventory.c */
 
