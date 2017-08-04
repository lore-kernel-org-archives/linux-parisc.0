From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Static initialization of spinlocks in perf and
 unwind code
Date: Fri, 4 Aug 2017 23:54:19 +0200
Message-ID: <20170804215419.GA9373@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

While testing UBSAN I saw this BUG:
 BUG: spinlock bad magic on CPU#0, swapper/0
in unwind code. Let's avoid that by static initialization.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/perf.c b/arch/parisc/kernel/perf.c
index 6017a5a..08133590 100644
--- a/arch/parisc/kernel/perf.c
+++ b/arch/parisc/kernel/perf.c
@@ -69,7 +69,7 @@ struct rdr_tbl_ent {
 
 static int perf_processor_interface __read_mostly = UNKNOWN_INTF;
 static int perf_enabled __read_mostly;
-static spinlock_t perf_lock;
+static DEFINE_SPINLOCK(perf_lock);
 struct parisc_device *cpu_device __read_mostly;
 
 /* RDRs to write for PCX-W */
@@ -533,8 +533,6 @@ static int __init perf_init(void)
 	/* Patch the images to match the system */
     	perf_patch_images();
 
-	spin_lock_init(&perf_lock);
-
 	/* TODO: this only lets us access the first cpu.. what to do for SMP? */
 	cpu_device = per_cpu(cpu_data, 0).dev;
 	printk("Performance monitoring counters enabled for %s\n",
diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 1b73690..48dc7d4 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -34,7 +34,7 @@
 extern struct unwind_table_entry __start___unwind[];
 extern struct unwind_table_entry __stop___unwind[];
 
-static spinlock_t unwind_lock;
+static DEFINE_SPINLOCK(unwind_lock);
 /*
  * the kernel unwind block is not dynamically allocated so that
  * we can call unwind_init as early in the bootup process as 
@@ -181,8 +181,6 @@ int __init unwind_init(void)
 	start = (long)&__start___unwind[0];
 	stop = (long)&__stop___unwind[0];
 
-	spin_lock_init(&unwind_lock);
