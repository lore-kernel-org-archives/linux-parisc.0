From: Jeffrey Merkey <jeffmerkey@gmail.com>
Subject: [PATCH 22/31] Add debugger entry points for PARISC
Date: Thu, 28 Jan 2016 12:47:21 -0700
Message-ID: <1454010441-29307-1-git-send-email-jeffmerkey@gmail.com>
Cc: jejb@parisc-linux.org, deller@gmx.de, linux.mdb@gmail.com,
	linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch series adds an export which can be set by system debuggers to
direct the hard lockup and soft lockup detector to trigger a breakpoint
exception and enter a debugger if one is active.  It is assumed that if
someone sets this variable, then an breakpoint handler of some sort will
be actively loaded or registered via the notify die handler chain.

This addition is extremely useful for debugging hard and soft lockups
real time and quickly from a console debugger.

Signed-off-by: Jeffrey Merkey <jeffmerkey@gmail.com>
---
 arch/parisc/include/asm/kdebug.h | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 arch/parisc/include/asm/kdebug.h

diff --git a/arch/parisc/include/asm/kdebug.h b/arch/parisc/include/asm/kdebug.h
new file mode 100644
index 0000000..5d09de1
--- /dev/null
+++ b/arch/parisc/include/asm/kdebug.h
@@ -0,0 +1,4 @@
+
+static inline void arch_breakpoint(void)
+{
+}
-- 
1.8.3.1
