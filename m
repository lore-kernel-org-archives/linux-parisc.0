From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: [PATCH 1/5] parisc: add missing includes in asm/spinlock.h
Date: Thu, 10 May 2012 22:57:11 +0200
Message-ID: <1723943.8iulFKmgJs@donald.sf-tec.de>
References: <4430485.xEvkeJU8MB@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	torvalds@linux-foundation.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4430485.xEvkeJU8MB@donald.sf-tec.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This leads to this errors:

In file included from /home/buildbot/repos/linux/arch/parisc/include/as=
m/atomic.h:20:0,
                 from /home/buildbot/repos/linux/include/linux/atomic.h=
:4,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/bitops.h:56,
                 from /home/buildbot/repos/linux/include/linux/bitops.h=
:22,
                 from /home/buildbot/repos/linux/include/linux/kernel.h=
:19,
                 from /home/buildbot/repos/linux/include/linux/sched.h:=
55,
                 from /home/buildbot/repos/linux/arch/parisc/kernel/asm=
-offsets.c:31:
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h: In funct=
ion =E2=80=98arch_spin_is_locked=E2=80=99:
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h:9:2: erro=
r: implicit declaration of function =E2=80=98__ldcw_align=E2=80=99 [-We=
rror=3Dimplicit-function-declaration]
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h:9:29: war=
ning: initialization makes pointer from integer without a cast [enabled=
 by default]
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h: In funct=
ion =E2=80=98arch_spin_lock_flags=E2=80=99:
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h:22:2: err=
or: implicit declaration of function =E2=80=98mb=E2=80=99 [-Werror=3Dim=
plicit-function-declaration]
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h:23:4: war=
ning: assignment makes pointer from integer without a cast [enabled by =
default]
/home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h:24:2: err=
or: implicit declaration of function =E2=80=98__ldcw=E2=80=99 [-Werror=3D=
implicit-function-declaration]

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
---
 arch/parisc/include/asm/spinlock.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/a=
sm/spinlock.h
index 804aa28..3516e0b 100644
--- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_SPINLOCK_H
 #define __ASM_SPINLOCK_H
=20
+#include <asm/barrier.h>
+#include <asm/ldcw.h>
 #include <asm/processor.h>
 #include <asm/spinlock_types.h>
=20
--=20
1.7.9.2
