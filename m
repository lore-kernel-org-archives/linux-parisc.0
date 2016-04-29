From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Merge ftrace C-helper and assembler functions into
 .text.hot section
Date: Fri, 29 Apr 2016 22:07:31 +0200
Message-ID: <20160429200731.GA1297@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When enabling all-branch ftrace support (CONFIG_PROFILE_ALL_BRANCHES) the
kernel gets really huge and some ftrace assembler functions like mcount can't
reach the ftrace helper functions which are written in C.  Avoid this problem
of too distant branches by moving the ftrace C-helper functions into the
.text.hot section which is put in front of the standard .text section by the
linker.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 39127d3..2b2b0df 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -667,7 +667,7 @@
 	 * boundary
 	 */
 
-	.text
+	.section .text.hot
 	.align 2048
 
 ENTRY(fault_vector_20)
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index b13f9ec..a828a0a 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -18,12 +18,15 @@
 #include <asm/ftrace.h>
 
 
+#define __hot __attribute__ ((__section__ (".text.hot")))
+
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 /*
  * Hook the return address and push it in the stack of return addrs
  * in current thread info.
  */
-static void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
+static void __hot prepare_ftrace_return(unsigned long *parent,
+					unsigned long self_addr)
 {
 	unsigned long old;
 	struct ftrace_graph_ent trace;
@@ -53,7 +56,7 @@ static void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr
 }
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
 
-void notrace ftrace_function_trampoline(unsigned long parent,
+void notrace __hot ftrace_function_trampoline(unsigned long parent,
 				unsigned long self_addr,
 				unsigned long org_sp_gr3)
 {
