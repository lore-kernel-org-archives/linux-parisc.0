From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] parisc: remove unused and empty header
Date: Sat, 09 Jun 2012 22:08:59 +0200
Message-ID: <1339272539.30984.21.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Nothing includes real.h. That's unsurprising, since it's basically
empty. This has apparently been the case since (at least) v2.6.12-rc2.
It can safely be removed.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Tested only by prodding at the (history of the) tree with various git commands.

 arch/parisc/include/asm/real.h |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)
 delete mode 100644 arch/parisc/include/asm/real.h

diff --git a/arch/parisc/include/asm/real.h b/arch/parisc/include/asm/real.h
deleted file mode 100644
index 82acb25..0000000
--- a/arch/parisc/include/asm/real.h
+++ /dev/null
@@ -1,5 +0,0 @@
-#ifndef _PARISC_REAL_H
-#define _PARISC_REAL_H
-
-
-#endif
-- 
1.7.7.6
