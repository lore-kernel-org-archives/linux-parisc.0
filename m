From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Merge millicode routines via linker script
Date: Sun, 9 Jul 2017 22:50:40 +0200
Message-ID: <20170709205040.GA29038@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When compiling the 4.13-rc kernel I got those linker errors:
libgcc2.c:(.text+0x110): relocation truncated to fit: R_PARISC_PCREL22F against symbol `$$divU'
	defined in .text.div section in /usr/lib/gcc/hppa64-linux-gnu/4.9.2/libgcc.a(_divU.o)
hppa64-linux-gnu-ld: /usr/lib/gcc/hppa64-linux-gnu/4.9.2/libgcc.a(_moddi3.o)(.text+0x174): cannot reach $$divU

Avoid such errors by bundling the millicode routines in the linker script.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 3d6ef1b..ffe2cbf 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -78,6 +78,8 @@ SECTIONS
 		*(.text.sys_exit)
 		*(.text.do_sigaltstack)
 		*(.text.do_fork)
+		*(.text.div)
+		*($$*)			/* millicode routines */
 		*(.text.*)
 		*(.fixup)
 		*(.lock.text)		/* out-of-line lock text */
