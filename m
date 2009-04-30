From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 4/5] parisc: use new macro for .data.read_mostly section.
Date: Thu, 30 Apr 2009 19:55:18 -0400
Message-ID: <1241135719-9286-5-git-send-email-tabbott@mit.edu>
References: <1241135719-9286-1-git-send-email-tabbott@mit.edu>
 <1241135719-9286-2-git-send-email-tabbott@mit.edu>
 <1241135719-9286-3-git-send-email-tabbott@mit.edu>
 <1241135719-9286-4-git-send-email-tabbott@mit.edu>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Anders Kaseorg <andersk@mit.edu>,
	Waseem Daher <wdaher@mit.edu>,
	Denys Vlasenko <vda.linux@googlemail.com>,
	Jeff Arnold <jbarnold@mit.edu>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org, Tim Abbott <tabbott@mit.edu>
To: Sam Ravnborg <sam@ravnborg.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1241135719-9286-4-git-send-email-tabbott@mit.edu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

.data.read_mostly should not need a separate output section; this
change moves it into the .data section.

I used alignment L1_CACHE_BYTES instead of 16 since the whole point is
for read-mostly data to have different cache lines than other stuff.

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/vmlinux.lds.S |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index c8a528d..3176407 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -94,19 +94,13 @@ SECTIONS
 		__stop___unwind = .;
 	}
 
-	/* rarely changed data like cpu maps */
-	. = ALIGN(16);
-	.data.read_mostly : {
-		*(.data.read_mostly)
-	}
