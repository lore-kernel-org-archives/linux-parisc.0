Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 698C44842
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Dec 2001 16:23:17 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org,
	deller@dsl2.external.hp.com (Helge Deller),
	parisc-linux-cvs@lists.parisc-linux.org
Date: Thu, 27 Dec 2001 00:20:03 +0100
References: <20011226231927.CA2E54842@dsl2.external.hp.com>
In-Reply-To: <20011226231927.CA2E54842@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_FT4ZRRD4S05BF82CY4HF"
Message-Id: <20011226232317.698C44842@dsl2.external.hp.com>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux deller
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--------------Boundary-00=_FT4ZRRD4S05BF82CY4HF
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

 - 2.4.16-pa27
 - simpler and warning-free asm() statemnt in power-off code
 - use cad_pid from kernel/sys.c instead of hardcoded pid 1 for killing init
   process 
- print shutdown-msg on LCD if CONFIG_CHASSIS_LCD_LED is compiled in


--------------Boundary-00=_FT4ZRRD4S05BF82CY4HF
Content-Type: text/plain;
  charset="iso-8859-1";
  name="diff1"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="diff1"

Index: linux/Makefile
===================================================================
RCS file: /var/cvs/linux/Makefile,v
retrieving revision 1.231
diff -u -p -r1.231 Makefile
--- linux/Makefile	2001/12/26 22:02:47	1.231
+++ linux/Makefile	2001/12/26 23:16:09
@@ -1,7 +1,7 @@
 VERSION = 2
 PATCHLEVEL = 4
 SUBLEVEL = 16
-EXTRAVERSION = -pa26
+EXTRAVERSION = -pa27
 
 KERNELRELEASE=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 
Index: linux/arch/parisc/kernel/power.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/power.c,v
retrieving revision 1.4
diff -u -p -r1.4 power.c
--- linux/arch/parisc/kernel/power.c	2001/12/05 18:46:30	1.4
+++ linux/arch/parisc/kernel/power.c	2001/12/26 23:16:20
@@ -15,11 +15,6 @@
  * - ....
  */
 
-#include <asm/irq.h>
-#include <asm/pdc.h>
-#include <asm/gsc.h>
-#include <asm/io.h>
-
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
@@ -27,6 +22,12 @@
 #include <linux/sched.h>
 #include <linux/interrupt.h>
 
+#include <asm/gsc.h>
+#include <asm/pdc.h>
+#include <asm/irq.h>
+#include <asm/io.h>
+#include <asm/led.h>
+
 
 /* For kernel debugging purposes it's sometimes better to have
  * the soft-power switch killing the power at once.
@@ -38,23 +39,21 @@
 /* local time-counter for shutdown */
 static int shutdown_timer;
 
+#define DIAG_CODE(code)		(0x14000000 + ((code)<<5))
 
 /* this will go to processor.h or any other place... */
-/* taken from PCXL ERS pg 82 */
+/* taken from PCXL ERS page 82 */
 #define MFCPU_X(rDiagReg, t_ch, t_th, code) \
-	(0x14000000 + ((rDiagReg)<<21) + ((t_ch)<<16) + ((code)<<5) + ((t_th)<<0) )
+	(DIAG_CODE(code) + ((rDiagReg)<<21) + ((t_ch)<<16) + ((t_th)<<0) )
 	
+#define MTCPU(dr, gr)		MFCPU_X(dr, gr,  0, 0x12)       /* move value of gr to dr[dr] */
 #define MFCPU_C(dr, gr)		MFCPU_X(dr, gr,  0, 0x30)	/* for dr0 and dr8 only ! */
 #define MFCPU_T(dr, gr)		MFCPU_X(dr,  0, gr, 0xa0)	/* all dr except dr0 and dr8 */
 	
 #define __getDIAG(dr) ( { 			\
         register unsigned long __res asm("r28");\
-	__asm__ __volatile__ (			\
-		".word %0 \n\t"			\
-		"nop \n\t"			\
-		: 				\
-		: "i" (MFCPU_T(dr,28))		\
-		: "memory"			\
+	 __asm__ __volatile__ (			\
+		".word %1\n nop\n" : "=&r" (__res) : "i" (MFCPU_T(dr,28)) \
 	);					\
 	__res;					\
 } )
@@ -64,7 +63,8 @@ static int shutdown_timer;
 
 static void deferred_poweroff(void *dummy)
 {
-	kill_proc(1, SIGINT, 0);
+	extern int cad_pid;	/* kernel/sys.c */
+	kill_proc(cad_pid, SIGINT, 1);
 	/* machine_power_off(); */
 }
 
@@ -98,7 +98,11 @@ static void process_shutdown(void)
 	
 	/* wait until the button was pressed for 1 second */
 	if (shutdown_timer == HZ) {
-		printk(KERN_INFO "Shutting down...\n");
+		static char msg[] = "Shutting down...";
+		printk(KERN_INFO "%s\n", msg);
+#ifdef CONFIG_CHASSIS_LCD_LED
+		lcd_print(msg);
+#endif
 		poweroff();
 	}
 }

--------------Boundary-00=_FT4ZRRD4S05BF82CY4HF--
