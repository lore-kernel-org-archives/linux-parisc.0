From: Adrian Bunk <bunk@stusta.de>
Subject: [parisc-linux] [2.6 patch] i386/x86_64/parisc process.c: make
	hlt_counter static
Date: Mon, 6 Dec 2004 01:41:39 +0100
Message-ID: <20041206004139.GL2953__36099.6159179651$1416624507$gmane$org@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: discuss@x86-64.org,
 parisc-linux@parisc-linux.org,
 ak@suse.de,
 matthew@wil.cx
To: linux-kernel@vger.kernel.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

The patch below makes a needlessly global variable static.


diffstat output:
 arch/i386/kernel/process.c   |    2 +-
 arch/parisc/kernel/process.c |    2 +-
 arch/x86_64/kernel/process.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)


Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.10-rc2-mm4-full/arch/i386/kernel/process.c.old	2004-12-06 01:25:27.000000000 +0100
+++ linux-2.6.10-rc2-mm4-full/arch/i386/kernel/process.c	2004-12-06 01:25:38.000000000 +0100
@@ -60,7 +60,7 @@
 
 asmlinkage void ret_from_fork(void) __asm__("ret_from_fork");
 
-int hlt_counter;
+static int hlt_counter;
 
 unsigned long boot_option_idle_override = 0;
 EXPORT_SYMBOL(boot_option_idle_override);
--- linux-2.6.10-rc2-mm4-full/arch/parisc/kernel/process.c.old	2004-12-06 01:25:55.000000000 +0100
+++ linux-2.6.10-rc2-mm4-full/arch/parisc/kernel/process.c	2004-12-06 01:26:01.000000000 +0100
@@ -54,7 +54,7 @@
 #include <asm/uaccess.h>
 #include <asm/unwind.h>
 
-int hlt_counter;
+static int hlt_counter;
 
 /*
  * Power off function, if any
--- linux-2.6.10-rc2-mm4-full/arch/x86_64/kernel/process.c.old	2004-12-06 01:26:17.000000000 +0100
+++ linux-2.6.10-rc2-mm4-full/arch/x86_64/kernel/process.c	2004-12-06 01:26:28.000000000 +0100
@@ -53,7 +53,7 @@
 
 unsigned long kernel_thread_flags = CLONE_VM | CLONE_UNTRACED;
 
-atomic_t hlt_counter = ATOMIC_INIT(0);
+static atomic_t hlt_counter = ATOMIC_INIT(0);
 
 unsigned long boot_option_idle_override = 0;
 EXPORT_SYMBOL(boot_option_idle_override);

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
