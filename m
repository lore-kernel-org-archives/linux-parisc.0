From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 16/23] [PARISC] Remove unused macro
	fixup_branch in syscall.S
Date: Sun, 25 Jun 2006 19:34:44 -0400
Message-ID: <11512784931712-git-send-email-kyle@parisc-linux.org>
References: <20060625233123.GC2837@athena.road.mcmartin.ca>
Reply-To: Kyle McMartin <kyle@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060625233123.GC2837@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 arch/parisc/kernel/syscall.S |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

9f6d09dc715952f5d953645d050a400ffa881af5
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index a028c99..9670a89 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -29,18 +29,6 @@ #else
 	.level		1.1
 #endif
 
-#ifndef CONFIG_64BIT
-	.macro fixup_branch,lbl
-	b	    \lbl
-	.endm
-#else
-	.macro fixup_branch,lbl
-	ldil	    L%\lbl, %r1
-	ldo	    R%\lbl(%r1), %r1
-	bv,n        %r0(%r1)
-	.endm
-#endif
