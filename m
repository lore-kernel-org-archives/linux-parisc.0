From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Increase thread and stack size to 32kb
Date: Mon, 31 Jul 2017 08:38:27 +0200
Message-ID: <20170731063827.GA30040@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Since kernel 4.11 the thread and irq stacks on parisc randomly overflow
the default size of 16k. The reason why stack usage suddenly grew is yet
unknown.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # 4.11+

diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index 88fe0aad4390..761234d8d84e 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -34,7 +34,7 @@ struct thread_info {
 
 /* thread information allocation */
 
-#define THREAD_SIZE_ORDER	2 /* PA-RISC requires at least 16k stack */
+#define THREAD_SIZE_ORDER	3 /* PA-RISC requires at least 32k stack */
 /* Be sure to hunt all references to this down when you change the size of
  * the kernel stack */
 #define THREAD_SIZE             (PAGE_SIZE << THREAD_SIZE_ORDER)
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index ba5e1c7b1f17..0ca254085a66 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -380,7 +380,7 @@ static inline int eirr_to_irq(unsigned long eirr)
 /*
  * IRQ STACK - used for irq handler
  */
-#define IRQ_STACK_SIZE      (4096 << 2) /* 16k irq stack size */
+#define IRQ_STACK_SIZE      (4096 << 3) /* 32k irq stack size */
 
 union irq_stack_union {
 	unsigned long stack[IRQ_STACK_SIZE/sizeof(unsigned long)];
