From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Use fast cr16 clocksource with qemu
Date: Mon, 8 Jan 2018 21:36:40 +0100
Message-ID: <20180108203640.GA16841@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When booted in qemu, the (emulated) cr16 clocksources are monotonic and
syncronized, so they can be used as stable clocksources.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 0e6ab6e4a4e9..2dbe5580a1a4 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -316,6 +316,8 @@ extern int _parisc_requires_coherency;
 #define parisc_requires_coherency()	(0)
 #endif
 
+extern int running_on_qemu;
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_PARISC_PROCESSOR_H */
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 4b8fd6dc22da..68e88e5c0898 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -248,7 +248,7 @@ static int __init init_cr16_clocksource(void)
 	 * different sockets, so mark them unstable and lower rating on
 	 * multi-socket SMP systems.
 	 */
-	if (num_online_cpus() > 1) {
+	if (num_online_cpus() > 1 && !running_on_qemu) {
 		int cpu;
 		unsigned long cpu0_loc;
 		cpu0_loc = per_cpu(cpu_data, 0).cpu_loc;
