From: Kyle McMartin <kyle@mcmartin.ca>
Subject: parisc: fix ipv6 checksum
Date: Sun, 7 Dec 2008 19:15:51 -0500
Message-ID: <20081208001551.GL28348@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

ipv6 recently started exhibiting the same symptoms as ipv4 was, add
a memory clobber around inline checksum assembly that fribbles memory
to ensure gcc doesn't erroneously cache across it.

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
---
 arch/parisc/include/asm/checksum.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/include/asm/checksum.h b/arch/parisc/include/asm/checksum.h
index e9639cc..c84b2fc 100644
--- a/arch/parisc/include/asm/checksum.h
+++ b/arch/parisc/include/asm/checksum.h
@@ -182,7 +182,7 @@ static __inline__ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 #endif
 	: "=r" (sum), "=r" (saddr), "=r" (daddr), "=r" (len)
 	: "0" (sum), "1" (saddr), "2" (daddr), "3" (len), "r" (proto)
-	: "r19", "r20", "r21", "r22");
+	: "r19", "r20", "r21", "r22", "memory");
 	return csum_fold(sum);
 }
 
-- 
1.6.0.3

