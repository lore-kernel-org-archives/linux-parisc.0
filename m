Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85785484B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Oct 2003 17:38:16 -0600 (MDT)
Date: Thu, 23 Oct 2003 16:39:35 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031023233935.GZ24406@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20031023072157.GX24406@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031023072157.GX24406@tausq.org>
Subject: [parisc-linux] Re: teaching the kernel to do division
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> does anyone want to look into fixing it, and/or writing an optimized
> version of that function for pa? :-) it needs to do basically this (but
> be standalone)

Here's one way to do it, but maybe it can be optimized a bit. Any
suggestions before i send it upstream?

randolph

Index: lib/div64.c
===================================================================
RCS file: /var/cvs/linux-2.6/lib/div64.c,v
retrieving revision 1.1
diff -u -p -r1.1 div64.c
--- lib/div64.c	29 Jul 2003 17:02:19 -0000	1.1
+++ lib/div64.c	23 Oct 2003 23:36:08 -0000
@@ -25,26 +25,28 @@
 
 uint32_t __div64_32(uint64_t *n, uint32_t base)
 {
-	uint32_t low, low2, high, rem;
+        uint64_t rem = *n;
+        uint64_t b = base;
+        uint64_t res = 0, d = 1;
 
-	low   = *n   & 0xffffffff;
-	high  = *n  >> 32;
-	rem   = high % (uint32_t)base;
-	high  = high / (uint32_t)base;
-	low2  = low >> 16;
-	low2 += rem << 16;
-	rem   = low2 % (uint32_t)base;
-	low2  = low2 / (uint32_t)base;
-	low   = low  & 0xffff;
-	low  += rem << 16;
-	rem   = low  % (uint32_t)base;
-	low   = low  / (uint32_t)base;
+        if (b > 0) {
+                while (b < rem) {
+                        b <<= 1;
+                        d <<= 1;
+                }
+        }
+        
+        do {
+                if (rem >= b) {
+                        rem -= b;
+                        res += d;
+                }
+                b >>= 1;
+                d >>= 1;
+        } while (d);
 
-	*n = low +
-		((uint64_t)low2 << 16) +
-		((uint64_t)high << 32);
-
-	return rem;
+        *n = res;
+        return rem;
 }
 
 EXPORT_SYMBOL(__div64_32);

-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
