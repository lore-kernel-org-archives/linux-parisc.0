From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 1/5] parisc: use NOSAVE_DATA macro for .data.nosave section.
Date: Thu, 30 Apr 2009 19:55:15 -0400
Message-ID: <1241135719-9286-2-git-send-email-tabbott@mit.edu>
References: <1241135719-9286-1-git-send-email-tabbott@mit.edu>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Anders Kaseorg <andersk@mit.edu>,
	Waseem Daher <wdaher@mit.edu>,
	Denys Vlasenko <vda.linux@googlemail.com>,
	Jeff Arnold <jbarnold@mit.edu>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org, Tim Abbott <tabbott@mit.edu>
To: Sam Ravnborg <sam@ravnborg.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1241135719-9286-1-git-send-email-tabbott@mit.edu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

.data.nosave should not need a separate output section; this change
moves it into the .data section.

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/vmlinux.lds.S |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index fd2cc4f..0cc9658 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -103,6 +103,7 @@ SECTIONS
 	. = ALIGN(L1_CACHE_BYTES);
 	/* Data */
 	.data : {
+		NOSAVE_DATA
 		DATA_DATA
 		CONSTRUCTORS
 	}
@@ -118,17 +119,6 @@ SECTIONS
 		*(.data.lock_aligned)
 	}
 
-	/* nosave data is really only used for software suspend...it's here
-	 * just in case we ever implement it
-	 */
-	. = ALIGN(PAGE_SIZE);
-	__nosave_begin = .;
-	.data_nosave : {
-		*(.data.nosave)
-	}
-	. = ALIGN(PAGE_SIZE);
-	__nosave_end = .;
