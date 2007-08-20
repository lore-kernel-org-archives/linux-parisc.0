From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Subject: [parisc-linux] [patch 15/23] Add cmpxchg_local to parisc
Date: Mon, 20 Aug 2007 16:15:34 -0400
Message-ID: <20070820201828.584607454__12627.8623509736$1416624641$gmane$org@polymtl.ca>
References: <20070820201519.512791382@polymtl.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@parisc-linux.org,
 Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>,
 clameter@sgi.com
To: akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org
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

Use the new generic cmpxchg_local (disables interrupt). Also use the generic
cmpxchg as fallback if SMP is not set.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
CC: clameter@sgi.com
CC: parisc-linux@parisc-linux.org
---
 include/asm-parisc/atomic.h |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

Index: linux-2.6-lttng/include/asm-parisc/atomic.h
===================================================================
--- linux-2.6-lttng.orig/include/asm-parisc/atomic.h	2007-07-20 19:44:40.000000000 -0400
+++ linux-2.6-lttng/include/asm-parisc/atomic.h	2007-07-20 19:44:47.000000000 -0400
@@ -122,6 +122,35 @@ __cmpxchg(volatile void *ptr, unsigned l
 				    (unsigned long)_n_, sizeof(*(ptr))); \
   })
 
+#include <asm-generic/cmpxchg-local.h>
+
+static inline unsigned long __cmpxchg_local(volatile void *ptr,
+				      unsigned long old,
+				      unsigned long new_, int size)
+{
+	switch (size) {
+#ifdef CONFIG_64BIT
+	case 8:	return __cmpxchg_u64((unsigned long *)ptr, old, new_);
+#endif
+	case 4:	return __cmpxchg_u32(ptr, old, new_);
+	default:
+		return __cmpxchg_local_generic(ptr, old, new_, size);
+	}
+}
+
+/*
+ * cmpxchg_local and cmpxchg64_local are atomic wrt current CPU. Always make
+ * them available.
+ */
+#define cmpxchg_local(ptr,o,n)					  	\
+     (__typeof__(*(ptr)))__cmpxchg_local((ptr), (unsigned long)(o),	\
+			   	 (unsigned long)(n), sizeof(*(ptr)))
+#ifdef CONFIG_64BIT
+#define cmpxchg64_local(ptr,o,n) cmpxchg_local((ptr), (o), (n))
+#else
+#define cmpxchg64_local(ptr,o,n) __cmpxchg64_local_generic((ptr), (o), (n))
+#endif
+
 /* Note that we need not lock read accesses - aligned word writes/reads
  * are atomic, so a reader never sees unconsistent values.
  *

-- 
Mathieu Desnoyers
Computer Engineering Ph.D. Student, Ecole Polytechnique de Montreal
OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE 9A68
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
