From: rubisher <rubisher@scarlet.be>
Subject: [Patch] typo fixe in parisc memcpy
Date: Sat, 29 Mar 2008 19:25:06 +0000
Message-ID: <47EE9792.2080609@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Kyle,

As discussed by this thread <http://www.mail-archive.com/linux-parisc@vger.kernel.org/msg00058.html>
may I re-submit you this hunk:

a fixe of likely's macro usage:
Signed-off-by: Joel Soete <soete dot joel at scarlet dot be>
Index: linux-current/arch/parisc/lib/memcpy.c
===================================================================
--- linux-current.orig/arch/parisc/lib/memcpy.c    2008-01-05 13:57:26.000000000 +0000
+++ linux-current/arch/parisc/lib/memcpy.c    2008-01-05 13:58:01.000000000 +0000
@@ -405,7 +405,7 @@

  unaligned_copy:
      /* possibly we are aligned on a word, but not on a double... */
-    if (likely(t1 & (sizeof(unsigned int)-1)) == 0) {
+    if (likely((t1 & (sizeof(unsigned int) - 1)) == 0)) {
          t2 = src & (sizeof(unsigned int) - 1);

          if (unlikely(t2 != 0)) {
=== <> ===

Tia,
	r.
