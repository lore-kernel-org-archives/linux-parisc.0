From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 2/5] PA-RISC: fix compile errors
Date: Wed, 9 May 2012 18:17:13 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.1205091816470.1272@file.rdu.redhat.com>
References: <Pine.LNX.4.64.1205091758310.1272@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1205091758310.1272@file.rdu.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Rolf Eike Beer <eike-kernel@sf-tec.de>

Fixes this warnings:

In file included from /home/buildbot/repos/linux/arch/parisc/include/asm/processor.h:15:0,
                 from /home/buildbot/repos/linux/arch/parisc/include/asm/spinlock.h:4,
                 from /home/buildbot/repos/linux/arch/parisc/include/asm/atomic.h:20,
                 from /home/buildbot/repos/linux/include/linux/atomic.h:4,
                 from /home/buildbot/repos/linux/arch/parisc/include/asm/bitops.h:11,
                 from /home/buildbot/repos/linux/include/linux/bitops.h:22,
                 from /home/buildbot/repos/linux/include/linux/kernel.h:19,
                 from /home/buildbot/repos/linux/include/linux/sched.h:55,
                 from /home/buildbot/repos/linux/arch/parisc/kernel/asm-offsets.c:31:
/home/buildbot/repos/linux/arch/parisc/include/asm/hardware.h:106:10: warning: "struct hardware_path" declared inside parameter list [enabled by default]
/home/buildbot/repos/linux/arch/parisc/include/asm/hardware.h:106:10: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
/home/buildbot/repos/linux/arch/parisc/include/asm/hardware.h:116:59: warning: "struct hardware_path" declared inside parameter list [enabled by default]
/home/buildbot/repos/linux/arch/parisc/include/asm/hardware.h:118:47: warning: "struct hardware_path" declared inside parameter list [enabled by default]
/home/buildbot/repos/linux/arch/parisc/include/asm/hardware.h:119:57: warning: "struct hardware_path" declared inside parameter list [enabled by default]

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
---
 arch/parisc/include/asm/hardware.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/include/asm/hardware.h b/arch/parisc/include/asm/hardware.h
index 4e96268..036e703 100644
--- a/arch/parisc/include/asm/hardware.h
+++ b/arch/parisc/include/asm/hardware.h
@@ -95,12 +95,14 @@ struct bc_module {
 #define HPHW_MC	       15
 #define HPHW_FAULTY    31
 
+struct parisc_device_id;
 
 /* hardware.c: */
 extern const char *parisc_hardware_description(struct parisc_device_id *id);
 extern enum cpu_type parisc_get_cpu_type(unsigned long hversion);
 
 struct pci_dev;
+struct hardware_path;
 
 /* drivers.c: */
 extern struct parisc_device *alloc_pa_dev(unsigned long hpa,

