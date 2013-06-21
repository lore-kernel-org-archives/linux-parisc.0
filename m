From: Helge Deller <deller@gmx.de>
Subject: Fwd: [RFC PATCH 11/16] hppa: locks: remove unused arch_*_relax operations
Date: Fri, 21 Jun 2013 20:32:37 +0200
Message-ID: <51C49C45.1060207@gmx.de>
References: <1371835057-19335-12-git-send-email-will.deacon@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040803040109040107000308"
To: Will Deacon <will.deacon@arm.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1371835057-19335-12-git-send-email-will.deacon@arm.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------040803040109040107000308
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Thanks Will,

forwarding to linux-parisc@vger.kernel.org so that it gets into parisc patchwork.

I'll queue this patch up for 3.11 if it's OK for you.

Helge

-------- Original Message --------
Subject: [RFC PATCH 11/16] hppa: locks: remove unused arch_*_relax operations
Date: Fri, 21 Jun 2013 18:17:32 +0100
From: Will Deacon <will.deacon@arm.com>
To: linux-arch@vger.kernel.org
CC: Will Deacon <will.deacon@arm.com>, Helge Deller <deller@gmx.de>

The arch_{spin,read,write}_relax macros are not used anywhere in the
kernel and are typically just aliases for cpu_relax().

This patch removes the unused definitions for parisc.

Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Will Deacon <will.deacon@arm.com>
---
 arch/parisc/include/asm/spinlock.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/spinlock.h
index 3516e0b..64f2992 100644
--- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -191,8 +191,4 @@ static __inline__ int arch_write_can_lock(arch_rwlock_t *rw)
 #define arch_read_lock_flags(lock, flags) arch_read_lock(lock)
 #define arch_write_lock_flags(lock, flags) arch_write_lock(lock)
 
-#define arch_spin_relax(lock)	cpu_relax()
-#define arch_read_relax(lock)	cpu_relax()
-#define arch_write_relax(lock)	cpu_relax()
--------------040803040109040107000308--
