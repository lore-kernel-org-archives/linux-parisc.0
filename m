From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: [PATCH 2/5] parisc: add missing forward declarations in asm/hardware.h
Date: Thu, 10 May 2012 23:01:40 +0200
Message-ID: <1970353.sFHxzMjcN0@donald.sf-tec.de>
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

=46ixes this warnings:

In file included from /home/buildbot/repos/linux/arch/parisc/include/as=
m/processor.h:15:0,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/spinlock.h:4,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/atomic.h:20,
                 from /home/buildbot/repos/linux/include/linux/atomic.h=
:4,
                 from /home/buildbot/repos/linux/arch/parisc/include/as=
m/bitops.h:11,
                 from /home/buildbot/repos/linux/include/linux/bitops.h=
:22,
                 from /home/buildbot/repos/linux/include/linux/kernel.h=
:19,
                 from /home/buildbot/repos/linux/include/linux/sched.h:=
55,
                 from /home/buildbot/repos/linux/arch/parisc/kernel/asm=
-offsets.c:31:
/home/buildbot/repos/linux/arch/parisc/include/asm/hardware.h:106:10: w=
arning: =E2=80=98struct hardware_path=E2=80=99 declared inside paramete=
r list [enabled by default]
/home/buildbot/repos/linux/arch/parisc/include/asm/hardware.h:106:10: w=
arning: its scope is only this definition or declaration, which is prob=
ably not what you want [enabled by default]
/home/buildbot/repos/linux/arch/parisc/include/asm/hardware.h:116:59: w=
arning: =E2=80=98struct hardware_path=E2=80=99 declared inside paramete=
r list [enabled by default]
/home/buildbot/repos/linux/arch/parisc/include/asm/hardware.h:118:47: w=
arning: =E2=80=98struct hardware_path=E2=80=99 declared inside paramete=
r list [enabled by default]
/home/buildbot/repos/linux/arch/parisc/include/asm/hardware.h:119:57: w=
arning: =E2=80=98struct hardware_path=E2=80=99 declared inside paramete=
r list [enabled by default]

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
---
 arch/parisc/include/asm/hardware.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/include/asm/hardware.h b/arch/parisc/include/a=
sm/hardware.h
index 4e96268..036e703 100644
--- a/arch/parisc/include/asm/hardware.h
+++ b/arch/parisc/include/asm/hardware.h
@@ -95,12 +95,14 @@ struct bc_module {
 #define HPHW_MC	       15
 #define HPHW_FAULTY    31
=20
+struct parisc_device_id;
=20
 /* hardware.c: */
 extern const char *parisc_hardware_description(struct parisc_device_id=
 *id);
 extern enum cpu_type parisc_get_cpu_type(unsigned long hversion);
=20
 struct pci_dev;
+struct hardware_path;
=20
 /* drivers.c: */
 extern struct parisc_device *alloc_pa_dev(unsigned long hpa,
--=20
1.7.9.2


--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
