From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [RFC] Reorder compat structure placement and casting
	(firmware.c)?
Date: Sun, 1 Aug 2004 00:50:32 -0400
Message-ID: <20040801045032.GE31520@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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


pa,

Stop defining variables after code, and make sure that two externs don't
reference the same variable with different types. Comments?

Index: arch/parisc/kernel/firmware.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/firmware.c,v
retrieving revision 1.10
diff -u -p -r1.10 firmware.c
--- arch/parisc/kernel/firmware.c	10 Jul 2004 21:20:47 -0000	1.10
+++ arch/parisc/kernel/firmware.c	1 Aug 2004 04:24:15 -0000
@@ -237,11 +237,11 @@ int __init pdc_chassis_info(struct pdc_c
 #ifdef __LP64__
 int pdc_pat_chassis_send_log(unsigned long state, unsigned long data)
 {
+	int retval = 0;
+        
 	if (!is_pdc_pat())
 		return -1;
 
-	int retval = 0;
-
 	spin_lock_irq(&pdc_lock);
 	retval = mem_pdc_call(PDC_PAT_CHASSIS_LOG, PDC_PAT_CHASSIS_WRITE_LOG, __pa(&state), __pa(&data));
 	spin_unlock_irq(&pdc_lock);
@@ -1195,7 +1195,32 @@ int pdc_pat_io_pci_cfg_write(unsigned lo
 #endif /* __LP64__ */
 
 
-/***************** 32-bit real-mode calls ***********/
+/***************** 32-bit and 64-bit real-mode calls ***********/
+
+#ifdef __LP64__
+/* The structure below is the wide 64-bit stack view */
+
+struct wide_stack {
+	unsigned long arg0;
+	unsigned long arg1;
+	unsigned long arg2;
+	unsigned long arg3;
+	unsigned long arg4;
+	unsigned long arg5;
+	unsigned long arg6;
+	unsigned long arg7;
+	unsigned long arg8;
+	unsigned long arg9;
+	unsigned long arg10;
+	unsigned long arg11;
+	unsigned long arg12;
+	unsigned long arg13;
+	unsigned long frame_marker[2];	/* rp, previous sp */
+	unsigned long sp;
+	/* in reality, there's nearly 8k of stack after this */
+};
+#endif /* __LP64__ */
+
 /* The struct below is used
  * to overlay real_stack (real2.S), preparing a 32-bit call frame.
  * real32_call_asm() then uses this stack in narrow real mode
@@ -1225,53 +1250,42 @@ struct narrow_stack {
 long real32_call(unsigned long fn, ...)
 {
 	va_list args;
+#ifdef __LP64__
+        /* If we have a 64-bit kernel reference the stack as
+           such, but cast down to a 32-bit structure if
+           required. */
+	extern struct wide_stack real_stack;
+#else
 	extern struct narrow_stack real_stack;
+#endif
+        
+	struct narrow_stack * real32_stack;
 	extern unsigned long real32_call_asm(unsigned int *,
 					     unsigned int *, 
 					     unsigned int);
 	
+        real32_stack = (struct narrow_stack *)&real_stack;
 	va_start(args, fn);
-	real_stack.arg0 = va_arg(args, unsigned int);
-	real_stack.arg1 = va_arg(args, unsigned int);
-	real_stack.arg2 = va_arg(args, unsigned int);
-	real_stack.arg3 = va_arg(args, unsigned int);
-	real_stack.arg4 = va_arg(args, unsigned int);
-	real_stack.arg5 = va_arg(args, unsigned int);
-	real_stack.arg6 = va_arg(args, unsigned int);
-	real_stack.arg7 = va_arg(args, unsigned int);
-	real_stack.arg8 = va_arg(args, unsigned int);
-	real_stack.arg9 = va_arg(args, unsigned int);
-	real_stack.arg10 = va_arg(args, unsigned int);
-	real_stack.arg11 = va_arg(args, unsigned int);
-	real_stack.arg12 = va_arg(args, unsigned int);
-	real_stack.arg13 = va_arg(args, unsigned int);
+	real32_stack->arg0 = va_arg(args, unsigned int);
+	real32_stack->arg1 = va_arg(args, unsigned int);
+	real32_stack->arg2 = va_arg(args, unsigned int);
+	real32_stack->arg3 = va_arg(args, unsigned int);
+	real32_stack->arg4 = va_arg(args, unsigned int);
+	real32_stack->arg5 = va_arg(args, unsigned int);
+	real32_stack->arg6 = va_arg(args, unsigned int);
+	real32_stack->arg7 = va_arg(args, unsigned int);
+	real32_stack->arg8 = va_arg(args, unsigned int);
+	real32_stack->arg9 = va_arg(args, unsigned int);
+	real32_stack->arg10 = va_arg(args, unsigned int);
+	real32_stack->arg11 = va_arg(args, unsigned int);
+	real32_stack->arg12 = va_arg(args, unsigned int);
+	real32_stack->arg13 = va_arg(args, unsigned int);
 	va_end(args);
 	
-	return real32_call_asm(&real_stack.sp, &real_stack.arg0, fn);
+	return real32_call_asm(&real32_stack->sp, &real32_stack->arg0, fn);
 }
 
 #ifdef __LP64__
-/***************** 64-bit real-mode calls ***********/
