From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: [PATCH 4/6] parisc: drop include of asm/pdc.h from asm/hardware.h
Date: Sat, 21 Apr 2012 20:17:43 +0200
Message-ID: <1908845.8gGWeWu9U7@donald.sf-tec.de>
References: <3154414.psmJh6J2U2@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3154414.psmJh6J2U2@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

It seems none of the symbols defined by pdc.h is needed, but it introdu=
ces an
include loop causing compile errors:

In file included from /home/buildbot/repos/linux/arch/parisc/include/as=
m/spinlock.h:4:0,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/atomic.h:20,
                 from /home/buildbot/repos/linux/include/linux/atomic.h=
:4,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/bitops.h:56,
                 from /home/buildbot/repos/linux/include/linux/bitops.h=
:35,
                 from /home/buildbot/repos/linux/include/asm-generic/ge=
torder.h:7,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/page.h:162,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/pdc.h:346,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/hardware.h:5,
                 from /home/buildbot/repos/linux/arch/parisc/kernel/har=
dware.c:30:
/home/buildbot/repos/linux/arch/parisc/include/asm/processor.h:74:16: e=
rror: field =E2=80=98cpu_type=E2=80=99 has incomplete type
/home/buildbot/repos/linux/arch/parisc/include/asm/processor.h:77:20: e=
rror: field =E2=80=98model=E2=80=99 has incomplete type
/home/buildbot/repos/linux/arch/parisc/include/asm/processor.h: In func=
tion =E2=80=98parisc_requires_coherency=E2=80=99:
/home/buildbot/repos/linux/arch/parisc/include/asm/processor.h:349:36: =
error: =E2=80=98mako=E2=80=99 undeclared (first use in this function)
/home/buildbot/repos/linux/arch/parisc/include/asm/processor.h:349:36: =
note: each undeclared identifier is reported only once for each functio=
n it appears in
/home/buildbot/repos/linux/arch/parisc/include/asm/processor.h:350:30: =
error: =E2=80=98mako2=E2=80=99 undeclared (first use in this function)

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
---
 arch/parisc/include/asm/hardware.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/parisc/include/asm/hardware.h b/arch/parisc/include/a=
sm/hardware.h
index 036e703..d1d864b 100644
--- a/arch/parisc/include/asm/hardware.h
+++ b/arch/parisc/include/asm/hardware.h
@@ -2,7 +2,6 @@
 #define _PARISC_HARDWARE_H
=20
 #include <linux/mod_devicetable.h>
-#include <asm/pdc.h>
=20
 #define HWTYPE_ANY_ID		PA_HWTYPE_ANY_ID
 #define HVERSION_ANY_ID		PA_HVERSION_ANY_ID
--=20
1.7.9.2


--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
