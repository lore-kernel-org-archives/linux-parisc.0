From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Avoid compiler warnings with access_ok()
Date: Wed, 15 Mar 2017 21:48:42 +0100
Message-ID: <20170315204842.GA32075@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit 09b871ffd4d8 (parisc: Define access_ok() as macro) missed to mark uaddr
as used, which then gives compiler warnings about unused variables.

Fix it by comparing uaddr to uaddr which then gets optimized away by the
compiler.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: 09b871ffd4d8 ("parisc: Define access_ok() as macro")

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index fb4382c..edfbf9d 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -32,7 +32,8 @@
  * that put_user is the same as __put_user, etc.
  */
 
-#define access_ok(type, uaddr, size) (1)
+#define access_ok(type, uaddr, size)	\
+	( (uaddr) == (uaddr) )
 
 #define put_user __put_user
 #define get_user __get_user
