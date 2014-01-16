From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [PATCH] Make EWOULDBLOCK be equal to EAGAIN on parisc.
Date: Thu, 16 Jan 2014 17:17:53 +0100
Message-ID: <7b86ec9f26dd9a18e7fae7a39e6a3382@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Linux, only parisc uses a different value for EWOULDBLOCK which
causes a lot of troubles for applications not checking for both values.
Since the hpux compat is long dead, make EWOULDBLOCK behave the same as
all other architectures.

Signed-off-by: Guy Martin  <gmsoft@tuxicoman.be>
---
  arch/parisc/include/uapi/asm/errno.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/uapi/asm/errno.h 
b/arch/parisc/include/uapi/asm/errno.h
index f3a8aa5..c0ae625 100644
--- a/arch/parisc/include/uapi/asm/errno.h
+++ b/arch/parisc/include/uapi/asm/errno.h
@@ -106,7 +106,7 @@

  #define	EALREADY	244	/* Operation already in progress */
  #define	EINPROGRESS	245	/* Operation now in progress */
-#define	EWOULDBLOCK	246	/* Operation would block (Linux returns EAGAIN) 
*/
+#define	EWOULDBLOCK	EAGAIN	/* Operation would block (Not HPUX 
compliant) */
  #define	ENOTEMPTY	247	/* Directory not empty */
  #define	ENAMETOOLONG	248	/* File name too long */
  #define	ELOOP		249	/* Too many symbolic links encountered */
-- 
1.8.3.2

