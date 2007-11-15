From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Subject: [parisc-linux] [PATCH] parisc: balance parenthesis in
	pte_free_kernel()
Date: Thu, 15 Nov 2007 23:34:27 +0100
Message-ID: <200711152334.28517.m.kozlowski__2691.70550532198$1416624651$gmane$org@tuxland.pl>
References: <20071113175906.497a1a6a.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: Andrew Morton <akpm@linux-foundation.org>,
 grundler@parisc-linux.org,
 kyle@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20071113175906.497a1a6a.akpm@linux-foundation.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello,

	Another parenthesis fix.

Regards,

	Mariusz


Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 include/asm-parisc/pgalloc.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.24-rc2-mm1-a/include/asm-parisc/pgalloc.h	2007-11-15 11:36:44.000000000 +0100
+++ linux-2.6.24-rc2-mm1-b/include/asm-parisc/pgalloc.h	2007-11-15 11:37:17.000000000 +0100
@@ -141,7 +141,7 @@ static inline void pte_free_kernel(struc
 static inline void pte_free_kernel(struct mm_struct *mm, struct page *pte)
 {
 	pgtable_page_dtor(pte);
-	pte_free_kernel(page_address((pte));
+	pte_free_kernel(page_address(pte));
 }

 #define check_pgt_cache()	do { } while (0)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
