From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [PATCH] parisc: fix unwind with recent gcc versions
Date: Sat, 28 Nov 2009 20:33:11 +0000
Message-ID: <20091128203311.GA24165@hera.kernel.org>
Reply-To: kyle@mcmartin.ca
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: deller@gmx.de, linux-parisc@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Helge Deller <deller@gmx.de>

kernel unwinding is broken with gcc >= 4.x. Part of the problem is, that
binutils seems sensible where the unwind information is stored.

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
---
 arch/parisc/kernel/unwind.c      |    2 +-
 arch/parisc/kernel/vmlinux.lds.S |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 69dad5a..a36799e 100644
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
