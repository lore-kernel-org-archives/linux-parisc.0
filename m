From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix unwind
Date: Sun, 25 Oct 2009 22:42:48 +0100
Message-ID: <20091025214248.GA15028@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <tausq@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

kernel unwinding is broken with gcc >= 4.x. Part of the problem is, that
binutils seems sensible where the unwind information is stored.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 69dad5a..6c631bf 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -28,7 +28,7 @@
 #define dbg(x...)
 #endif
 
-#define KERNEL_START (KERNEL_BINARY_TEXT_START - 0x1000)
+#define KERNEL_START (KERNEL_BINARY_TEXT_START)
 
 extern struct unwind_table_entry __start___unwind[];
 extern struct unwind_table_entry __stop___unwind[];
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index fda4baa..9dab4a4 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -78,9 +78,6 @@ SECTIONS
 	 */
 	. = ALIGN(PAGE_SIZE);
 	data_start = .;
-	EXCEPTION_TABLE(16)
