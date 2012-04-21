From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: [PATCH 1/6] use linux/bitops.h instead of linux/log2.h to get fls()
Date: Sat, 21 Apr 2012 20:23:58 +0200
Message-ID: <1335033199.699870__39891.7914172218$1335033267$gmane$org@mail.sf-mail.de>
References: <3154414.psmJh6J2U2@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	David Howells <dhowells@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3154414.psmJh6J2U2@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Since d66acc39c7cee323733c8503b9de1821a56dff7e (bitops: Optimise get_order())
getorder.h includes log2.h to get fls() and fls64(). They are not defined in
log2.h, but in bitops.h. This works since log2.h includes bitops.h, but we
should do it properly to not get any bad surprises if log2.h changes.

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
---
 include/asm-generic/getorder.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/getorder.h b/include/asm-generic/getorder.h
index 65e4468..563114f 100644
--- a/include/asm-generic/getorder.h
+++ b/include/asm-generic/getorder.h
@@ -4,7 +4,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/compiler.h>
-#include <linux/log2.h>
+#include <linux/bitops.h>
 
 /*
  * Runtime evaluation of get_order()
-- 
1.7.9.2

