From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Reorder compat structure placement and
	casting (firmware.c)?
Date: Thu, 5 Aug 2004 23:51:28 -0400
Message-ID: <20040806035128.GE2672@baldric.uwo.ca>
References: <20040801045032.GE31520@baldric.uwo.ca>
	<20040802052751.GD20904@colo.lackof.org>
	<20040805040600.GA21912@baldric.uwo.ca>
	<20040805205937.GB20367@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040805205937.GB20367@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Because a wide kernel can make narrow PDC calls.  (eg C360).
> narrow_stack has to be available regardless which
> way we compile the kernel.

I don't exclude making narrow calls from a wide kernel.
How about something like this? It's actually cleaner to add more
assembly labels.

Index: firmware.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/firmware.c,v
retrieving revision 1.10
diff -u -p -r1.10 firmware.c
--- firmware.c	10 Jul 2004 21:20:47 -0000	1.10
+++ firmware.c	6 Aug 2004 03:49:32 -0000
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
@@ -1225,29 +1225,30 @@ struct narrow_stack {
 long real32_call(unsigned long fn, ...)
 {
 	va_list args;
-	extern struct narrow_stack real_stack;
+	extern struct narrow_stack real32_stack;
+        
 	extern unsigned long real32_call_asm(unsigned int *,
 					     unsigned int *, 
 					     unsigned int);
 	
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
+	real32_stack.arg0 = va_arg(args, unsigned int);
+	real32_stack.arg1 = va_arg(args, unsigned int);
+	real32_stack.arg2 = va_arg(args, unsigned int);
+	real32_stack.arg3 = va_arg(args, unsigned int);
+	real32_stack.arg4 = va_arg(args, unsigned int);
+	real32_stack.arg5 = va_arg(args, unsigned int);
+	real32_stack.arg6 = va_arg(args, unsigned int);
+	real32_stack.arg7 = va_arg(args, unsigned int);
+	real32_stack.arg8 = va_arg(args, unsigned int);
+	real32_stack.arg9 = va_arg(args, unsigned int);
+	real32_stack.arg10 = va_arg(args, unsigned int);
+	real32_stack.arg11 = va_arg(args, unsigned int);
+	real32_stack.arg12 = va_arg(args, unsigned int);
+	real32_stack.arg13 = va_arg(args, unsigned int);
 	va_end(args);
 	
-	return real32_call_asm(&real_stack.sp, &real_stack.arg0, fn);
+	return real32_call_asm(&real32_stack.sp, &real32_stack.arg0, fn);
 }
 
 #ifdef __LP64__
Index: real2.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/real2.S,v
retrieving revision 1.13
diff -u -p -r1.13 real2.S
--- real2.S	15 Mar 2004 20:08:51 -0000	1.13
+++ real2.S	6 Aug 2004 03:49:32 -0000
@@ -14,6 +14,8 @@
 	.export real_stack
 	.align	64
 real_stack:
+real32_stack:
+real64_stack:
 	.block	8192
 
 #ifdef __LP64__
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
