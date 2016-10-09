From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Move exception tables into read-only section
Date: Sun, 9 Oct 2016 11:20:44 +0200
Message-ID: <20161009092044.GA4484@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Since BUILDTIME_EXTABLE_SORT is enabled, the exception tables can move
into the read-only section.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 9a44e92..3d6ef1b 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -109,6 +109,10 @@ SECTIONS
 
 	RO_DATA_SECTION(8)
 
+	/* RO because of BUILDTIME_EXTABLE_SORT */
+	EXCEPTION_TABLE(8)
+	NOTES
+
 	/* unwind info */
 	.PARISC.unwind : {
 		__start___unwind = .;
@@ -124,9 +128,6 @@ SECTIONS
 	. = ALIGN(HUGEPAGE_SIZE);
 	data_start = .;
 
-	EXCEPTION_TABLE(8)
-	NOTES
