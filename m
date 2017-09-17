From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Move start_parisc() into init section
Date: Sun, 17 Sep 2017 21:17:10 +0200
Message-ID: <20170917191710.GA8565@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index dee6f9d..a31e91c 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -38,6 +38,7 @@
 #include <linux/export.h>
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
+#include <linux/start_kernel.h>
 
 #include <asm/processor.h>
 #include <asm/sections.h>
@@ -398,9 +399,8 @@ static int __init parisc_init(void)
 }
 arch_initcall(parisc_init);
 
-void start_parisc(void)
+void __init start_parisc(void)
 {
-	extern void start_kernel(void);
 	extern void early_trap_init(void);
 
 	int ret, cpunum;
