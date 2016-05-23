From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Use long jump to reach ftrace_return_to_handler()
Date: Mon, 23 May 2016 23:23:26 +0200
Message-ID: <20160523212326.GA31962@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Depending on config options we will need to use a long jump to reach
ftrace_return_to_handler().  Additionally only compile the
parisc_return_to_handler code when CONFIG_FUNCTION_GRAPH_TRACER is set.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 2b2b0df..baa3d9d 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -2019,6 +2019,7 @@ ftrace_stub:
 	.procend
 ENDPROC(mcount)
 
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	.align 8
 	.globl return_to_handler
 	.type  return_to_handler, @function
@@ -2040,11 +2041,17 @@ parisc_return_to_handler:
 #endif
 
 	/* call ftrace_return_to_handler(0) */
+	.import ftrace_return_to_handler,code
+	load32 ftrace_return_to_handler,%ret0
+	load32 .Lftrace_ret,%r2
 #ifdef CONFIG_64BIT
 	ldo -16(%sp),%ret1		/* Reference param save area */
+	bve	(%ret0)
+#else
+	bv	%r0(%ret0)
 #endif
-	BL ftrace_return_to_handler,%r2
 	ldi 0,%r26
+.Lftrace_ret:
 	copy %ret0,%rp
 
 	/* restore original return values */
@@ -2062,6 +2069,8 @@ parisc_return_to_handler:
 	.procend
 ENDPROC(return_to_handler)
 
+#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
+
 #endif	/* CONFIG_FUNCTION_TRACER */
 
 #ifdef CONFIG_IRQSTACKS
