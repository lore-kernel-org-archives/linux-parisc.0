From: Helge Deller <deller@gmx.de>
Subject: Fwd: [PATCH RESEND 10/14] hppa: locks: remove redundant arch_*_relax
 operations
Date: Wed, 05 Mar 2014 21:38:14 +0100
Message-ID: <53178B36.2070307@gmx.de>
References: <1393004101-25382-11-git-send-email-will.deacon@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1393004101-25382-11-git-send-email-will.deacon@arm.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Forwarding to parisc patchwork...


-------- Original Message --------
Subject: 	[PATCH RESEND 10/14] hppa: locks: remove redundant 
arch_*_relax operations
Date: 	Fri, 21 Feb 2014 17:34:57 +0000
From: 	Will Deacon <will.deacon@arm.com>
To: 	akpm@linux-foundation.org
CC: 	linux-arch@vger.kernel.org, Will Deacon <will.deacon@arm.com>, 
Helge Deller <deller@gmx.de>



Now that the arch_{spin,read,write}_relax macros default to cpu_relax(),
remove the redundant definitions for parisc.

Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Will Deacon <will.deacon@arm.com>
---
  arch/parisc/include/asm/spinlock.h | 4 ----
  1 file changed, 4 deletions(-)

diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/spinlock.h
index 3516e0b27044..64f2992e439f 100644
--- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -191,8 +191,4 @@ static __inline__ int arch_write_can_lock(arch_rwlock_t *rw)
  #define arch_read_lock_flags(lock, flags) arch_read_lock(lock)
  #define arch_write_lock_flags(lock, flags) arch_write_lock(lock)
  
-#define arch_spin_relax(lock)	cpu_relax()
-#define arch_read_relax(lock)	cpu_relax()
-#define arch_write_relax(lock)	cpu_relax()
