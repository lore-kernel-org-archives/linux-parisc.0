From: Helge Deller <deller@gmx.de>
Subject: parisc: switch to compat_functions of io_setup, io_getevents and
 io_submit
Date: Wed, 27 Feb 2013 23:17:13 +0100
Message-ID: <20130227221713.GA2872@p100.box>
References: <20130227221137.GA2806@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130227221137.GA2806@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit c58c540c25a4ae98e021876cb32afb7794428267
Author: Helge Deller <deller@gmx.de>
Date:   Wed Feb 27 00:32:10 2013 +0100

parisc: switch to compat_functions of io_setup, io_getevents and io_submit

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index fc9cab1..a410b1b 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -310,10 +310,10 @@
 	ENTRY_COMP(sched_getaffinity)
 	ENTRY_SAME(ni_syscall)	/* set_thread_area */
 	ENTRY_SAME(ni_syscall)	/* get_thread_area */
-	ENTRY_SAME(io_setup)		/* 215 */
+	ENTRY_COMP(io_setup)		/* 215 */
 	ENTRY_SAME(io_destroy)
-	ENTRY_SAME(io_getevents)
-	ENTRY_SAME(io_submit)
+	ENTRY_COMP(io_getevents)
+	ENTRY_COMP(io_submit)
 	ENTRY_SAME(io_cancel)
 	ENTRY_SAME(alloc_hugepages)	/* 220 */
 	ENTRY_SAME(free_hugepages)
