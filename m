From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: [PATCH 5/5] parisc: move definition of PAGE0 to asm/page.h
Date: Thu, 10 May 2012 23:08:17 +0200
Message-ID: <9994244.7dMrtT61Uk@donald.sf-tec.de>
References: <4430485.xEvkeJU8MB@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	torvalds@linux-foundation.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4430485.xEvkeJU8MB@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This was defined in asm/pdc.h which needs to include asm/page.h for
__PAGE_OFFSET. This leads to an include loop so that page.h eventually =
will
include pdc.h again. While this is no problem because of header guards,=
 it is
a problem because some symbols may be undefined. Such an error is this:

In file included from /home/buildbot/repos/linux/include/linux/bitops.h=
:35:0,
                 from /home/buildbot/repos/linux/include/asm-generic/ge=
torder.h:7,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/page.h:162,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/pdc.h:346,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/processor.h:16,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/spinlock.h:6,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/atomic.h:20,
                 from /home/buildbot/repos/linux/include/linux/atomic.h=
:4,
                 from /home/buildbot/repos/linux/include/linux/sysfs.h:=
20,
                 from /home/buildbot/repos/linux/include/linux/kobject.=
h:21,
                 from /home/buildbot/repos/linux/include/linux/device.h=
:17,
                 from /home/buildbot/repos/linux/include/linux/eisa.h:5=
,
                 from /home/buildbot/repos/linux/arch/parisc/kernel/pci=
=2Ec:11:
/home/buildbot/repos/linux/arch/parisc/include/asm/bitops.h: In functio=
n =E2=80=98set_bit=E2=80=99:
/home/buildbot/repos/linux/arch/parisc/include/asm/bitops.h:82:2: error=
: implicit declaration of function =E2=80=98_atomic_spin_lock_irqsave=E2=
=80=99 [-Werror=3Dimplicit-function-declaration]
/home/buildbot/repos/linux/arch/parisc/include/asm/bitops.h:84:2: error=
: implicit declaration of function =E2=80=98_atomic_spin_unlock_irqrest=
ore=E2=80=99 [-Werror=3Dimplicit-function-declaration]

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
---
 arch/parisc/include/asm/page.h  |    6 ++++++
 arch/parisc/include/asm/pdc.h   |    7 -------
 arch/parisc/kernel/pdc_cons.c   |    1 +
 arch/parisc/kernel/time.c       |    1 +
 drivers/parisc/sba_iommu.c      |    1 +
 drivers/video/console/sticore.c |    2 ++
 6 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/p=
age.h
index a84cc1f..4e0e7db 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -160,5 +160,11 @@ extern int npmem_ranges;
=20
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
+#include <asm/pdc.h>
+
+#define PAGE0   ((struct zeropage *)__PAGE_OFFSET)
+
+/* DEFINITION OF THE ZERO-PAGE (PAG0) */
+/* based on work by Jason Eckhardt (jason@equator.com) */
=20
 #endif /* _PARISC_PAGE_H */
diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pd=
c.h
index 4ca510b..7f0f2d2 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -343,8 +343,6 @@
=20
 #ifdef __KERNEL__
=20
-#include <asm/page.h> /* for __PAGE_OFFSET */
-
 extern int pdc_type;
=20
 /* Values for pdc_type */
@@ -677,11 +675,6 @@ static inline char * os_id_to_string(u16 os_id) {
=20
 #endif /* __KERNEL__ */
=20
-#define PAGE0   ((struct zeropage *)__PAGE_OFFSET)
-
-/* DEFINITION OF THE ZERO-PAGE (PAG0) */
-/* based on work by Jason Eckhardt (jason@equator.com) */
-
 /* flags of the device_path */
 #define	PF_AUTOBOOT	0x80
 #define	PF_AUTOSEARCH	0x40
diff --git a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_con=
s.c
index 4f00459..9bbd2a5 100644
--- a/arch/parisc/kernel/pdc_cons.c
+++ b/arch/parisc/kernel/pdc_cons.c
@@ -50,6 +50,7 @@
 #include <linux/init.h>
 #include <linux/major.h>
 #include <linux/tty.h>
+#include <asm/page.h>		/* for PAGE0 */
 #include <asm/pdc.h>		/* for iodc_call() proto and friends */
=20
 static DEFINE_SPINLOCK(pdc_console_lock);
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 7c07743..70e105d 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -29,6 +29,7 @@
 #include <asm/uaccess.h>
 #include <asm/io.h>
 #include <asm/irq.h>
+#include <asm/page.h>
 #include <asm/param.h>
 #include <asm/pdc.h>
 #include <asm/led.h>
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 8644d53..42cfcd9 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -44,6 +44,7 @@
 #include <asm/ropes.h>
 #include <asm/mckinley.h>	/* for proc_mckinley_root */
 #include <asm/runway.h>		/* for proc_runway_root */
+#include <asm/page.h>		/* for PAGE0 */
 #include <asm/pdc.h>		/* for PDC_MODEL_* */
 #include <asm/pdcpat.h>		/* for is_pdc_pat() */
 #include <asm/parisc-device.h>
diff --git a/drivers/video/console/sticore.c b/drivers/video/console/st=
icore.c
index 6468a29..39571f9 100644
--- a/drivers/video/console/sticore.c
+++ b/drivers/video/console/sticore.c
@@ -22,7 +22,9 @@
 #include <linux/font.h>
=20
 #include <asm/hardware.h>
+#include <asm/page.h>
 #include <asm/parisc-device.h>
+#include <asm/pdc.h>
 #include <asm/cacheflush.h>
 #include <asm/grfioctl.h>
=20
--=20
1.7.9.2


--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
