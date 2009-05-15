From: Roel Kluin <roel.kluin@gmail.com>
Subject: [PATCH] misplaced parenthesis?
Date: Fri, 15 May 2009 21:23:29 +0200
Message-ID: <4A0DC131.8020606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
To: kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix misplaced parenthesis.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
I think this is what was intended? Note that this patch may affect
profiling.

diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index bbda909..30207b0 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -405,7 +405,7 @@ byte_copy:
 
 unaligned_copy:
 	/* possibly we are aligned on a word, but not on a double... */
-	if (likely(t1 & (sizeof(unsigned int)-1)) == 0) {
+	if (likely(t1 & (sizeof(unsigned int)-1) == 0)) {
 		t2 = src & (sizeof(unsigned int) - 1);
 
 		if (unlikely(t2 != 0)) {
