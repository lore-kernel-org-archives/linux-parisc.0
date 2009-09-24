From: Tim Abbott <tabbott@ksplice.com>
Subject: [PATCH v2 03/11] parisc: Remove useless altinstructions code copied from x86.
Date: Thu, 24 Sep 2009 10:36:18 -0400
Message-ID: <1253802986-8132-4-git-send-email-tabbott@ksplice.com>
References: <1253802986-8132-1-git-send-email-tabbott@ksplice.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Tim Abbott <tabbott@ksplice.com>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1253802986-8132-1-git-send-email-tabbott@ksplice.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Tim Abbott <tabbott@ksplice.com>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/parisc/kernel/vmlinux.lds.S |   25 -------------------------
 1 files changed, 0 insertions(+), 25 deletions(-)

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 3fd66d9..775be27 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -135,31 +135,6 @@ SECTIONS
 	INIT_TEXT_SECTION(16384)
 	INIT_DATA_SECTION(16)
 
-	/* alternate instruction replacement.  This is a mechanism x86 uses
-	 * to detect the CPU type and replace generic instruction sequences
-	 * with CPU specific ones.  We don't currently do this in PA, but
-	 * it seems like a good idea...
-	 */
-	. = ALIGN(4);
-	.altinstructions : {
-		__alt_instructions = .;
-		*(.altinstructions)
-		__alt_instructions_end = .; 
-	} 
-	.altinstr_replacement : {
-		*(.altinstr_replacement)
-	} 
-
-	/* .exit.text is discard at runtime, not link time, to deal with references
-	 *  from .altinstructions and .eh_frame
-	 */
-	.exit.text : {
-		EXIT_TEXT
-	}
-	.exit.data : {
-		EXIT_DATA
-	}
