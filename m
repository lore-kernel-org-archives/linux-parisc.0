From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [GIT PULL] parisc fixes for 3.3-rc5
Date: Sat, 19 May 2012 19:51:05 +0100
Message-ID: <1337453465.2930.6.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a set of three bug fixes that gets parisc running again on
systems with PA1.1 processors.  Two fix regressions introduced in 2.6.39
and one fixes a prefetch bug that only affects PA7300LC processors.  We
also have another pending fix to do with the sectional arrangement of
vmlinux.lds, but there's a query on it during testing on one particular
system type, so I'll hold off sending it in for now.

The patches are here:

git://git.kernel.org/pub/scm/linux/kernel/git/jejb/parisc-2.6.git parisc-fixes

The short changelog is:


James Bottomley (2):
      [PARISC] fix panic on prefetch(NULL) on PA7300LC
      [PARISC] fix PA1.1 oops on boot

John David Anglin (1):
      [PARISC] fix crash in flush_icache_page_asm on PA1.1


And the diffstat:

 arch/parisc/include/asm/prefetch.h |    7 ++++++-
 arch/parisc/kernel/entry.S         |    4 ++++
 arch/parisc/kernel/pacache.S       |   38 +++++++++++++++++++-----------------
 3 files changed, 30 insertions(+), 19 deletions(-)

With the full diff below

James

---

diff --git a/arch/parisc/include/asm/prefetch.h b/arch/parisc/include/asm/prefetch.h
index c5edc60..1ee7c82 100644
--- a/arch/parisc/include/asm/prefetch.h
+++ b/arch/parisc/include/asm/prefetch.h
@@ -21,7 +21,12 @@
 #define ARCH_HAS_PREFETCH
 static inline void prefetch(const void *addr)
 {
-	__asm__("ldw 0(%0), %%r0" : : "r" (addr));
+	__asm__(
+#ifndef CONFIG_PA20
+		/* Need to avoid prefetch of NULL on PA7300LC */
+		"	extrw,u,= %0,31,32,%%r0\n"
+#endif
+		"	ldw 0(%0), %%r0" : : "r" (addr));
 }
 
 /* LDD is a PA2.0 addition. */
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 6f05944..5350342 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -581,7 +581,11 @@
 	 */
 	cmpiclr,=	0x01,\tmp,%r0
 	ldi		(_PAGE_DIRTY|_PAGE_READ|_PAGE_WRITE),\prot
+#ifdef CONFIG_64BIT
 	depd,z		\prot,8,7,\prot
+#else
+	depw,z		\prot,8,7,\prot
+#endif
 	/*
 	 * OK, it is in the temp alias region, check whether "from" or "to".
 	 * Check "subtle" note in pacache.S re: r23/r26.
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 93ff3d9..5d7218a 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -692,7 +692,7 @@ ENTRY(flush_icache_page_asm)
 
 	/* Purge any old translation */
 
-	pitlb		(%sr0,%r28)
+	pitlb		(%sr4,%r28)
 
 	ldil		L%icache_stride, %r1
 	ldw		R%icache_stride(%r1), %r1
@@ -706,27 +706,29 @@ ENTRY(flush_icache_page_asm)
 	sub		%r25, %r1, %r25
 
 
-1:      fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
-	fic,m		%r1(%r28)
+	/* fic only has the type 26 form on PA1.1, requiring an
+	 * explicit space specification, so use %sr4 */
+1:      fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
+	fic,m		%r1(%sr4,%r28)
 	cmpb,COND(<<)		%r28, %r25,1b
-	fic,m		%r1(%r28)
+	fic,m		%r1(%sr4,%r28)
 
 	sync
 	bv		%r0(%r2)
-	pitlb		(%sr0,%r25)
+	pitlb		(%sr4,%r25)
 	.exit
 
 	.procend


