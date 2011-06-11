From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [PATCH] parisc, fix return type of __atomic64_add_return
Date: Sat, 11 Jun 2011 14:42:06 -0400
Message-ID: <20110611184205.GA27903@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The return type of __atomic64_add_return of should be s64 or long, not
int.  This fixes the atomic64 test failure that I previously reported.

Signed-off-by: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index f819559..26fd114 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -259,10 +259,10 @@ static __inline__ int atomic_add_unless(atomic_t *v, int a, int u)
 
 #define ATOMIC64_INIT(i) ((atomic64_t) { (i) })
 
-static __inline__ int
+static __inline__ s64
 __atomic64_add_return(s64 i, atomic64_t *v)
 {
-	int ret;
+	s64 ret;
 	unsigned long flags;
 	_atomic_spin_lock_irqsave(v, flags);
 
