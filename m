From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 2/5] parisc: use new macro for .data.cacheline_aligned section.
Date: Thu, 30 Apr 2009 19:55:16 -0400
Message-ID: <1241135719-9286-3-git-send-email-tabbott@mit.edu>
References: <1241135719-9286-1-git-send-email-tabbott@mit.edu>
 <1241135719-9286-2-git-send-email-tabbott@mit.edu>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Anders Kaseorg <andersk@mit.edu>,
	Waseem Daher <wdaher@mit.edu>,
	Denys Vlasenko <vda.linux@googlemail.com>,
	Jeff Arnold <jbarnold@mit.edu>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org, Tim Abbott <tabbott@mit.edu>
To: Sam Ravnborg <sam@ravnborg.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1241135719-9286-2-git-send-email-tabbott@mit.edu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

.data.cacheline_aligned should not need a separate output section;
this change moves it into the .data section.

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/vmlinux.lds.S |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 0cc9658..b5936c9 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -104,15 +104,11 @@ SECTIONS
 	/* Data */
 	.data : {
 		NOSAVE_DATA
+		CACHELINE_ALIGNED_DATA(L1_CACHE_BYTES)
 		DATA_DATA
 		CONSTRUCTORS
 	}
 
-	. = ALIGN(L1_CACHE_BYTES);
-	.data.cacheline_aligned : {
-		*(.data.cacheline_aligned)
-	}
