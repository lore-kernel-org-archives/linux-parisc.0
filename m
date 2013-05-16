From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: use long branch in fork_like macro
Date: Thu, 16 May 2013 21:28:12 +0200
Message-ID: <20130516192812.GB357@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: stable@vger.kernel.org, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

please add to stable kernel v3.9
upstream commit bbbfde782084b4f0d85ddffb88f1cf4650ff40e4

From: John David Anglin <dave.anglin@bell.net>

The "b" branch instruction used in the fork_like macro only can handle
17-bit pc-relative offsets.
This fails with an out of range offset with some .config files.
Rewrite to use the "be" instruction which
can branch to any address in a space.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index aa486e4..36f4f1d 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1702,7 +1702,8 @@ ENTRY(sys_\name\()_wrapper)
 	ldo	TASK_REGS(%r1),%r1
 	reg_save %r1
 	mfctl	%cr27, %r28
-	b	sys_\name
+	ldil	L%sys_\name, %r31
+	be	R%sys_\name(%sr4,%r31)
 	STREG	%r28, PT_CR27(%r1)
 ENDPROC(sys_\name\()_wrapper)
 	.endm

