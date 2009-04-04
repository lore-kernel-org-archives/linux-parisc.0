From: Bastian Blank <waldi@debian.org>
Subject: [PATCH] Remove casts from atomic macros
Date: Sat, 4 Apr 2009 22:54:26 +0200
Message-ID: <20090404205426.GA27225@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The atomic operations on parisc are defined as macros. The macros
includes casts which disallows the use of some syntax elements and
produces error like this:

net/phonet/pep.c: In function 'pipe_rcv_status':
net/phonet/pep.c:262: error: lvalue required as left operand of assignment

The patch removes this superfluous casts.

Signed-off-by: Bastian Blank <waldi@debian.org>

diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index edbfe25..43e101b 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -222,13 +222,13 @@ static __inline__ int atomic_add_unless(atomic_t *v, int a, int u)
 
 #define atomic_inc_not_zero(v) atomic_add_unless((v), 1, 0)
 
-#define atomic_add(i,v)	((void)(__atomic_add_return( ((int)i),(v))))
-#define atomic_sub(i,v)	((void)(__atomic_add_return(-((int)i),(v))))
+#define atomic_add(i,v)	((void)(__atomic_add_return( (i),(v))))
+#define atomic_sub(i,v)	((void)(__atomic_add_return(-(i),(v))))
 #define atomic_inc(v)	((void)(__atomic_add_return(   1,(v))))
 #define atomic_dec(v)	((void)(__atomic_add_return(  -1,(v))))
 
-#define atomic_add_return(i,v)	(__atomic_add_return( ((int)i),(v)))
-#define atomic_sub_return(i,v)	(__atomic_add_return(-((int)i),(v)))
+#define atomic_add_return(i,v)	(__atomic_add_return( (i),(v)))
+#define atomic_sub_return(i,v)	(__atomic_add_return(-(i),(v)))
 #define atomic_inc_return(v)	(__atomic_add_return(   1,(v)))
 #define atomic_dec_return(v)	(__atomic_add_return(  -1,(v)))
 
