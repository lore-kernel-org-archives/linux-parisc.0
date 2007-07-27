From: Yoann Padioleau <padator@wanadoo.fr>
Subject: [parisc-linux] [PATCH 11/68] 0 -> NULL, for arch/parisc
Date: Fri, 27 Jul 2007 11:45:05 +0200 (MEST)
Message-ID: <200707270945.LAA17250__26185.7494399466$1416624640$gmane$org@ifs.emn.fr>
Cc: matthew@wil.cx,
 linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org,
 parisc-linux@parisc-linux.org
To: kernel-janitors@vger.kernel.org
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


When comparing a pointer, it's clearer to compare it to NULL than to 0.

Here is an excerpt of the semantic patch: 

@@
expression *E;
@@

  E ==
- 0
+ NULL

@@
expression *E;
@@

  E !=
- 0
+ NULL

Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
Cc: matthew@wil.cx
Cc: grundler@parisc-linux.org
Cc: kyle@parisc-linux.org
Cc: parisc-linux@parisc-linux.org
Cc: akpm@linux-foundation.org
---

 smp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 04c7e1d..16fccbe 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -333,7 +333,7 @@ smp_call_function (void (*func) (void *i
 
 	if (retry) {
 		spin_lock (&lock);
-		while (smp_call_function_data != 0)
+		while (smp_call_function_data != NULL)
 			barrier();
 	}
 	else {

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
