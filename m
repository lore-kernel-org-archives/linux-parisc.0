From: Christoph Lameter <cl@linux.com>
Subject: [PATCH 11/41] parisc: Replace __get_cpu_var uses for address calculation
Date: Fri, 17 Jan 2014 09:18:23 -0600
Message-ID: <20140117151835.513814745@linux.com>
References: <20140117151812.770437629@linux.com>
Content-Type: text/plain; charset=UTF-8
Cc: akpm@linuxfoundation.org, rostedt@goodmis.org,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Convert to the use of this_cpu_ptr().

Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Signed-off-by: Christoph Lameter <cl@linux.com>

Index: linux/arch/parisc/lib/memcpy.c
===================================================================
--- linux.orig/arch/parisc/lib/memcpy.c	2013-12-02 16:07:49.844632157 -0600
+++ linux/arch/parisc/lib/memcpy.c	2013-12-02 16:07:49.844632157 -0600
@@ -470,7 +470,7 @@ static unsigned long pa_memcpy(void *dst
 		return 0;
 
 	/* if a load or store fault occured we can get the faulty addr */
-	d = &__get_cpu_var(exception_data);
+	d = this_cpu_ptr(&exception_data);
 	fault_addr = d->fault_addr;
 
 	/* error in load or store? */
Index: linux/arch/parisc/mm/fault.c
===================================================================
--- linux.orig/arch/parisc/mm/fault.c	2013-12-02 16:07:49.844632157 -0600
+++ linux/arch/parisc/mm/fault.c	2013-12-02 16:07:49.844632157 -0600
@@ -151,7 +151,7 @@ int fixup_exception(struct pt_regs *regs
 	fix = search_exception_tables(regs->iaoq[0]);
 	if (fix) {
 		struct exception_data *d;
-		d = &__get_cpu_var(exception_data);
+		d = this_cpu_ptr(&exception_data);
 		d->fault_ip = regs->iaoq[0];
 		d->fault_space = regs->isr;
 		d->fault_addr = regs->ior;

