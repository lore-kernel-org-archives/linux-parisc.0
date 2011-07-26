From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: [PATCH] fix atomic64 on PA-RISC
Date: Wed, 27 Jul 2011 01:57:56 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1107270157040.660@artax.karlin.mff.cuni.cz>
References: <alpine.DEB.2.00.1106290043170.32272@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1106290043170.32272@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix atomic64 on PA-RISC

Signed-off-by: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>

---
 arch/parisc/include/asm/atomic.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-3.0-devel/arch/parisc/include/asm/atomic.h
===================================================================
--- linux-3.0-devel.orig/arch/parisc/include/asm/atomic.h	2011-07-27 01:27:03.000000000 +0200
+++ linux-3.0-devel/arch/parisc/include/asm/atomic.h	2011-07-27 01:30:44.000000000 +0200
@@ -259,10 +259,10 @@ static __inline__ int atomic_add_unless(
 
 #define ATOMIC64_INIT(i) ((atomic64_t) { (i) })
 
-static __inline__ int
+static __inline__ s64
 __atomic64_add_return(s64 i, atomic64_t *v)
 {
-	int ret;
+	s64 ret;
 	unsigned long flags;
 	_atomic_spin_lock_irqsave(v, flags);
 

