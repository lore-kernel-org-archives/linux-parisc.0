From: Helge Deller <deller@gmx.de>
Subject: Fwd: [parisc-linux] [PATCH] Section mismatch fix
Date: Wed, 26 Dec 2007 18:07:01 +0100
Message-ID: <200712261807.01768.deller@gmx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Just resending it to our new mailing list (my original mail was eaten by our old list).
Kyle wanted to (partly) add it to his tree, but it's not there yet.

Helge

----------  Forwarded Message  ----------

Subject: [parisc-linux] [PATCH] Section mismatch fix
Date: Saturday 17 November 2007
From: Helge Deller <deller@gmx.de>
To: Kyle McMartin <kyle@parisc-linux.org>, parisc-linux@lists.parisc-linux.org

- move boot_args[] into the init section
- move $global$ into the read_mostly section
- fix the following two section mismatches:
WARNING: vmlinux.o(.text+0x9c): Section mismatch: reference to .init.text:start_kernel (between '$pgt_fill_loop' and '$is_pa20')
WARNING: vmlinux.o(.text+0xa0): Section mismatch: reference to .init.text:start_kernel (between '$pgt_fill_loop' and '$is_pa20')

Signed-off-by: Helge Deller <deller@gmx.de>

 head.S |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index a7b8859..ec2482d 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -20,10 +20,11 @@
 #include <asm/pgtable.h>
 
 #include <linux/linkage.h>
+#include <linux/init.h>
 
 	.level	LEVEL
 
-	.data
+	__INITDATA
 ENTRY(boot_args)
 	.word 0 /* arg0 */
 	.word 0 /* arg1 */
@@ -31,7 +32,7 @@ ENTRY(boot_args)
 	.word 0 /* arg3 */
 END(boot_args)
 
-	.text
+	.section .text.head
 	.align	4
 	.import init_thread_union,data
 	.import fault_vector_20,code    /* IVA parisc 2.0 32 bit */
@@ -343,7 +344,7 @@ smp_slave_stext:
 ENDPROC(stext)
 
 #ifndef CONFIG_64BIT
-	.data
+	.section .data.read_mostly
 
 	.align	4
 	.export	$global$,data
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
