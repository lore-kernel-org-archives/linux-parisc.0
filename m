From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 175/199] arch/parisc/lib/memset.c: Checkpatch cleanup
Date: Sun, 23 May 2010 22:02:02 +0200
Message-ID: <1274644930-26600-18-git-send-email-andrea.gelmini@gelma.net>
References: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: andrea.gelmini@gelma.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

arch/parisc/lib/memset.c:28: WARNING: space prohibited between function name and open parenthesis '('
arch/parisc/lib/memset.c:33: ERROR: that open brace { should be on the previous line
arch/parisc/lib/memset.c:33: WARNING: suspect code indent for conditional statements (2, 6)
arch/parisc/lib/memset.c:47: ERROR: that open brace { should be on the previous line
arch/parisc/lib/memset.c:47: WARNING: suspect code indent for conditional statements (6, 10)
arch/parisc/lib/memset.c:56: ERROR: that open brace { should be on the previous line
arch/parisc/lib/memset.c:56: WARNING: suspect code indent for conditional statements (6, 10)
arch/parisc/lib/memset.c:73: ERROR: that open brace { should be on the previous line
arch/parisc/lib/memset.c:73: WARNING: suspect code indent for conditional statements (6, 10)
arch/parisc/lib/memset.c:83: ERROR: that open brace { should be on the previous line
arch/parisc/lib/memset.c:83: WARNING: suspect code indent for conditional statements (2, 6)

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/lib/memset.c |   23 +++++++++--------------
 1 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/arch/parisc/lib/memset.c b/arch/parisc/lib/memset.c
index 1d7929b..66e518f 100644
--- a/arch/parisc/lib/memset.c
+++ b/arch/parisc/lib/memset.c
@@ -25,13 +25,12 @@
 typedef unsigned long op_t;
 
 void *
-memset (void *dstpp, int sc, size_t len)
+memset(void *dstpp, int sc, size_t len)
 {
   unsigned int c = sc;
   long int dstp = (long int) dstpp;
 
-  if (len >= 8)
-    {
+  if (len >= 8) {
       size_t xlen;
       op_t cccc;
 
@@ -44,17 +43,15 @@ memset (void *dstpp, int sc, size_t len)
 
       /* There are at least some bytes to set.
 	 No need to test for LEN == 0 in this alignment loop.  */
-      while (dstp % OPSIZ != 0)
-	{
-	  ((unsigned char *) dstp)[0] = c;
-	  dstp += 1;
-	  len -= 1;
+	while (dstp % OPSIZ != 0) {
+		((unsigned char *) dstp)[0] = c;
+		dstp += 1;
+		len -= 1;
 	}
 
       /* Write 8 `op_t' per iteration until less than 8 `op_t' remain.  */
       xlen = len / (OPSIZ * 8);
-      while (xlen > 0)
-	{
+      while (xlen > 0) {
 	  ((op_t *) dstp)[0] = cccc;
 	  ((op_t *) dstp)[1] = cccc;
 	  ((op_t *) dstp)[2] = cccc;
@@ -70,8 +67,7 @@ memset (void *dstpp, int sc, size_t len)
 
       /* Write 1 `op_t' per iteration until less than OPSIZ bytes remain.  */
       xlen = len / OPSIZ;
-      while (xlen > 0)
-	{
+      while (xlen > 0) {
 	  ((op_t *) dstp)[0] = cccc;
 	  dstp += OPSIZ;
 	  xlen -= 1;
@@ -80,8 +76,7 @@ memset (void *dstpp, int sc, size_t len)
     }
 
   /* Write the last few bytes.  */
-  while (len > 0)
-    {
+  while (len > 0) {
       ((unsigned char *) dstp)[0] = c;
       dstp += 1;
       len -= 1;
-- 
1.7.1.251.gf80a2

