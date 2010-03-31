From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: parisc: Use of align_frame provides stack frame.
Date: Wed, 31 Mar 2010 16:42:33 -0400
Message-ID: <p2k119aab441003311342q9e17c174u617cb75a1a4b9dc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Any assembly constant generated with the use of
align_frame includes size for a full stack frame.

Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index ec787b4..0a719f2 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -45,8 +45,12 @@
 #else
 #define FRAME_SIZE	64
 #endif
+#define FRAME_ALIGN	64

-#define align(x,y) (((x)+FRAME_SIZE+(y)-1) - (((x)+(y)-1)%(y)))
+/* Add FRAME_SIZE to the size x and align it to y. All definitions
+ * that use align_frame will include space for a frame.
+ */
+#define align_frame(x,y) (((x)+FRAME_SIZE+(y)-1) - (((x)+(y)-1)%(y)))

 int main(void)
 {
@@ -146,7 +150,8 @@ int main(void)
 	DEFINE(TASK_PT_IOR, offsetof(struct task_struct, thread.regs.ior));
 	BLANK();
 	DEFINE(TASK_SZ, sizeof(struct task_struct));
-	DEFINE(TASK_SZ_ALGN, align(sizeof(struct task_struct), 64));
+	/* TASK_SZ_ALGN includes space for a stack frame. */
+	DEFINE(TASK_SZ_ALGN, align_frame(sizeof(struct task_struct), FRAME_ALIGN));
 	BLANK();
 	DEFINE(PT_PSW, offsetof(struct pt_regs, gr[ 0]));
 	DEFINE(PT_GR1, offsetof(struct pt_regs, gr[ 1]));
@@ -233,7 +238,8 @@ int main(void)
 	DEFINE(PT_ISR, offsetof(struct pt_regs, isr));
 	DEFINE(PT_IOR, offsetof(struct pt_regs, ior));
 	DEFINE(PT_SIZE, sizeof(struct pt_regs));
-	DEFINE(PT_SZ_ALGN, align(sizeof(struct pt_regs), 64));
+	/* PT_SZ_ALGN includes space for a stack frame. */
+	DEFINE(PT_SZ_ALGN, align_frame(sizeof(struct pt_regs), FRAME_ALIGN));
 	BLANK();
 	DEFINE(TI_TASK, offsetof(struct thread_info, task));
 	DEFINE(TI_EXEC_DOMAIN, offsetof(struct thread_info, exec_domain));
@@ -242,7 +248,8 @@ int main(void)
 	DEFINE(TI_SEGMENT, offsetof(struct thread_info, addr_limit));
 	DEFINE(TI_PRE_COUNT, offsetof(struct thread_info, preempt_count));
 	DEFINE(THREAD_SZ, sizeof(struct thread_info));
-	DEFINE(THREAD_SZ_ALGN, align(sizeof(struct thread_info), 64));
+	/* THREAD_SZ_ALGN includes space for a stack frame. */
+	DEFINE(THREAD_SZ_ALGN, align_frame(sizeof(struct thread_info), FRAME_ALIGN));
 	BLANK();
 	DEFINE(ICACHE_BASE, offsetof(struct pdc_cache_info, ic_base));
 	DEFINE(ICACHE_STRIDE, offsetof(struct pdc_cache_info, ic_stride));
