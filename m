From: Helge Deller <deller@gmx.de>
Subject: [PATCH] kernel/extable: fix address-checks for core_kernel and init
 areas
Date: Thu, 28 Nov 2013 09:16:33 +0100
Message-ID: <20131128081633.GA2111@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linux Kernel <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Ingo Molnar <mingo@elte.hu>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Steven Rostedt <rostedt@goodmis.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The init_kernel_text() and core_kernel_text() functions should not include the
labels _einittext and _etext when checking if an address is inside the .text or
.init sections.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/kernel/extable.c b/kernel/extable.c
index 832cb28..763faf0 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -61,7 +61,7 @@ const struct exception_table_entry *search_exception_tables(unsigned long addr)
 static inline int init_kernel_text(unsigned long addr)
 {
 	if (addr >= (unsigned long)_sinittext &&
-	    addr <= (unsigned long)_einittext)
+	    addr < (unsigned long)_einittext)
 		return 1;
 	return 0;
 }
@@ -69,7 +69,7 @@ static inline int init_kernel_text(unsigned long addr)
 int core_kernel_text(unsigned long addr)
 {
 	if (addr >= (unsigned long)_stext &&
-	    addr <= (unsigned long)_etext)
+	    addr < (unsigned long)_etext)
 		return 1;
 
 	if (system_state == SYSTEM_BOOTING &&
