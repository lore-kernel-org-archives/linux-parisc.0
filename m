From: Helge Deller <deller@gmx.de>
Subject: parisc: fix compile warnings triggered by atomic_sub(sizeof(),v)
Date: Wed, 27 Feb 2013 23:15:52 +0100
Message-ID: <20130227221552.GA2817@p100.box>
References: <20130227221137.GA2806@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130227221137.GA2806@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit 4e5a5143e77add104aeee9cd6a92a2f89ab6edd6
Author: Helge Deller <deller@gmx.de>
Date:   Wed Feb 27 00:14:56 2013 +0100

parisc: fix compile warnings triggered by atomic_sub(sizeof(),v)

This fixes compile warnings like this one:
net/ipv4/igmp.c: In function =E2=80=98ip_mc_leave_group=E2=80=99:
net/ipv4/igmp.c:1898:3: warning: overflow in implicit constant conversi=
on [-Woverflow]

atomic_sub() is defined as
and if VAL is of type unsigned int (as returned by sizeof()), negating
this value will overflow. Fix this by type-casting VAL to int type:

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm=
/atomic.h
index af9cf30..f38e198 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -115,8 +115,8 @@ static __inline__ int __atomic_add_unless(atomic_t =
*v, int a, int u)
 }
=20
=20
-#define atomic_add(i,v)	((void)(__atomic_add_return( (i),(v))))
-#define atomic_sub(i,v)	((void)(__atomic_add_return(-(i),(v))))
+#define atomic_add(i,v)	((void)(__atomic_add_return(        (i),(v))))
+#define atomic_sub(i,v)	((void)(__atomic_add_return(-((int) (i)),(v)))=
)
 #define atomic_inc(v)	((void)(__atomic_add_return(   1,(v))))
 #define atomic_dec(v)	((void)(__atomic_add_return(  -1,(v))))
=20
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
