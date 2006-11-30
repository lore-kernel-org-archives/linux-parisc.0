From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Subject: [parisc-linux] [PATCH] parisc: pdcpat remove extra brackets
Date: Thu, 30 Nov 2006 10:20:50 +0100
Message-ID: <200611301020.51261.m.kozlowski__39162.9402911805$1416624624$gmane$org@tuxland.pl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-2"
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: matthew@wil.cx,
 grundler@parisc-linux.org,
 kyle@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
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

	This patch removes extra brackets.

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 include/asm-parisc/pdcpat.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-2.6.19-rc6-mm2-a/include/asm-parisc/pdcpat.h	2006-11-16 05:03:40.000000000 +0100
+++ linux-2.6.19-rc6-mm2-b/include/asm-parisc/pdcpat.h	2006-11-30 01:09:47.000000000 +0100
@@ -250,7 +250,7 @@ struct pdc_pat_pd_addr_map_entry {
 #define PAT_GET_ENTITY(value)	(((value) >> 56) & 0xffUL)
 #define PAT_GET_DVI(value)	(((value) >> 48) & 0xffUL)
 #define PAT_GET_IOC(value)	(((value) >> 40) & 0xffUL)
-#define PAT_GET_MOD_PAGES(value)(((value) & 0xffffffUL)
+#define PAT_GET_MOD_PAGES(value) ((value) & 0xffffffUL)
 
 
 /*
@@ -330,7 +330,7 @@ extern int pdc_pat;     /* arch/parisc/k
 #define PAT_GET_ENTITY(value)	(((value) >> 56) & 0xffUL)
 #define PAT_GET_DVI(value)	(((value) >> 48) & 0xffUL)
 #define PAT_GET_IOC(value)	(((value) >> 40) & 0xffUL)
-#define PAT_GET_MOD_PAGES(value)(((value) & 0xffffffUL)
+#define PAT_GET_MOD_PAGES(value) ((value) & 0xffffffUL)
 
 #endif /* __ASSEMBLY__ */
 


-- 
Regards,

	Mariusz Kozlowski
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
