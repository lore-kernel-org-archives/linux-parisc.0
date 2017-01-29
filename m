From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Define access_ok() as macro
Date: Sun, 29 Jan 2017 18:19:33 +0100
Message-ID: <20170129171933.GA26147@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Define access_ok() as macro instead of static function. This fixes build
warnings in code where the second parameter is given as unsigned long.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 9a2aee1..fb4382c 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -32,11 +32,7 @@
  * that put_user is the same as __put_user, etc.
  */
 
-static inline long access_ok(int type, const void __user * addr,
-		unsigned long size)
-{
-	return 1;
-}
+#define access_ok(type, uaddr, size) (1)
 
 #define put_user __put_user
 #define get_user __get_user
