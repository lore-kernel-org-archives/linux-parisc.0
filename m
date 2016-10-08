From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Move exception table into read-only section
Date: Sat, 8 Oct 2016 16:11:13 +0200
Message-ID: <20161008141113.GA31533@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The exception tables are sorted during buildtime (due to
BUILDTIME_EXTABLE_SORT), so it's safe to move those into the read-only kernel
section.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index b37787d..f366a1a 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -106,6 +106,10 @@ SECTIONS
 	}
 #endif
 
+	/* RO because we have BUILDTIME_EXTABLE_SORT */
+	EXCEPTION_TABLE(8)
+	NOTES
+
 	/* unwind info */
 	.PARISC.unwind : {
 		__start___unwind = .;
@@ -121,9 +125,6 @@ SECTIONS
 	. = ALIGN(HUGEPAGE_SIZE);
 	data_start = .;
 
-	EXCEPTION_TABLE(8)
-	NOTES
