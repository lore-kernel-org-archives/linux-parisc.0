From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: document the parisc gateway page
Date: Thu, 2 May 2013 23:16:38 +0200
Message-ID: <20130502211638.GA28415@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Include some documentation about how the parisc gateway page technically
works and how it is used from userspace.

James Bottomley is the original author of this description and it was
copied here out of an email thread from Apr 12 2013 titled:
man2 : syscall.2 : document syscall calling conventions

CC: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 5e05524..546770a 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -1,12 +1,35 @@
 /* 
  * Linux/PA-RISC Project (http://www.parisc-linux.org/)
  * 
- * System call entry code Copyright (c) Matthew Wilcox 1999 <willy@bofh.ai>
+ * System call entry code / Linux gateway page
+ * Copyright (c) Matthew Wilcox 1999 <willy@bofh.ai>
  * Licensed under the GNU GPL.
  * thanks to Philipp Rumpf, Mike Shaver and various others
  * sorry about the wall, puffin..
  */
 
+/*
+How does the Linux gateway page on PA-RISC work?
+------------------------------------------------
+The Linux gateway page on PA-RISC is "special".
+It actually has PAGE_GATEWAY bits set (this is linux terminology; in parisc
+terminology it's Execute, promote to PL0) in the page map.  So anything
+executing on this page executes with kernel level privilege (there's more to it
+than that: to have this happen, you also have to use a branch with a ,gate
+completer to activate the privilege promotion).  The upshot is that everything
+that runs on the gateway page runs at kernel privilege but with the current
+user process address space (although you have access to kernel space via %sr2).
+For the 0x100 syscall entry, we redo the space registers to point to the kernel
+address space (preserving the user address space in %sr3), move to wide mode if
+required, save the user registers and branch into the kernel syscall entry
+point.  For all the other functions, we execute at kernel privilege but don't
+flip address spaces. The basic upshot of this is that these code snippets are
+executed atomically (because the kernel can't be pre-empted) and they may
+perform architecturally forbidden (to PL3) operations (like setting control
+registers).
+*/
+
+
 #include <asm/asm-offsets.h>
 #include <asm/unistd.h>
 #include <asm/errno.h>
