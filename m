From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: avoid WARNING: at kernel/cpu/idle.c:96
Date: Wed, 8 May 2013 22:42:42 +0200
Message-ID: <20130508204242.GA16254@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

We need to enable local irqs to avoid this runtime warning.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 55f92b6..2840d43 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -286,3 +286,8 @@ void *dereference_function_descriptor(void *ptr)
 	return ptr;
 }
 #endif
+
+void arch_cpu_idle(void)
+{
+	local_irq_enable();
+}
