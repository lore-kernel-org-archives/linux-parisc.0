From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Unbreak handling exceptions from kernel modules
Date: Fri, 8 Apr 2016 21:30:05 +0200
Message-ID: <20160408193005.GD4225@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mikulas Patocka <mpatocka@redhat.com>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Handling exceptions from modules never worked on parisc.
It was just masked by the fact that exceptions from modules
don't happen during normal use.

When a module triggers an exception in get_user() we need to load the
main kernel dp value before accessing the exception_data structure, and
afterwards restore the original dp value of the module on exit.

Noticed-by: Mikulas Patocka <mpatocka@redhat.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index d4dd6e5..6f893d2 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -77,6 +77,7 @@ struct exception_table_entry {
  */
 struct exception_data {
 	unsigned long fault_ip;
+	unsigned long fault_gp;
 	unsigned long fault_space;
 	unsigned long fault_addr;
 };
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index d2f6257..78d30d2 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -299,6 +299,7 @@ int main(void)
 #endif
 	BLANK();
 	DEFINE(EXCDATA_IP, offsetof(struct exception_data, fault_ip));
+	DEFINE(EXCDATA_GP, offsetof(struct exception_data, fault_gp));
 	DEFINE(EXCDATA_SPACE, offsetof(struct exception_data, fault_space));
 	DEFINE(EXCDATA_ADDR, offsetof(struct exception_data, fault_addr));
 	BLANK();
diff --git a/arch/parisc/lib/fixup.S b/arch/parisc/lib/fixup.S
index 536ef66..1052b74 100644
--- a/arch/parisc/lib/fixup.S
+++ b/arch/parisc/lib/fixup.S
@@ -26,6 +26,7 @@
 
 #ifdef CONFIG_SMP
 	.macro  get_fault_ip t1 t2
+	loadgp
 	addil LT%__per_cpu_offset,%r27
 	LDREG RT%__per_cpu_offset(%r1),\t1
 	/* t2 = smp_processor_id() */
@@ -40,14 +41,19 @@
 	LDREG RT%exception_data(%r1),\t1
 	/* t1 = this_cpu_ptr(&exception_data) */
 	add,l \t1,\t2,\t1
+	/* %r27 = t1->fault_gp - restore gp */
+	LDREG EXCDATA_GP(\t1), %r27
 	/* t1 = t1->fault_ip */
 	LDREG EXCDATA_IP(\t1), \t1
 	.endm
 #else
 	.macro  get_fault_ip t1 t2
+	loadgp
 	/* t1 = this_cpu_ptr(&exception_data) */
 	addil LT%exception_data,%r27
 	LDREG RT%exception_data(%r1),\t2
+	/* %r27 = t2->fault_gp - restore gp */
+	LDREG EXCDATA_GP(\t2), %r27
 	/* t1 = t2->fault_ip */
 	LDREG EXCDATA_IP(\t2), \t1
 	.endm
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 26fac9c..16dbe81 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -145,6 +145,7 @@ int fixup_exception(struct pt_regs *regs)
 		struct exception_data *d;
 		d = this_cpu_ptr(&exception_data);
 		d->fault_ip = regs->iaoq[0];
+		d->fault_gp = regs->gr[27];
 		d->fault_space = regs->isr;
 		d->fault_addr = regs->ior;
 
