From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 4/5] PA-RISC: fix compile errors
Date: Wed, 9 May 2012 18:18:38 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.1205091818160.1272@file.rdu.redhat.com>
References: <Pine.LNX.4.64.1205091758310.1272@file.rdu.redhat.com>
 <Pine.LNX.4.64.1205091816470.1272@file.rdu.redhat.com>
 <Pine.LNX.4.64.1205091817170.1272@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1205091817170.1272@file.rdu.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Rolf Eike Beer <eike-kernel@sf-tec.de>

Fixes these errors:

In file included from /home/buildbot/repos/linux/arch/parisc/include/asm/io.h:5:0,
                 from /home/buildbot/repos/linux/include/linux/io.h:22,
                 from /home/buildbot/repos/linux/include/linux/pci.h:54,
                 from /home/buildbot/repos/linux/arch/parisc/kernel/setup.c:35:
/home/buildbot/repos/linux/arch/parisc/include/asm/pgtable.h:92:6: warning: "PAGE_SHIFT" is not defined [-Wundef]
/home/buildbot/repos/linux/arch/parisc/include/asm/pgtable.h:92:6: warning: "PAGE_SHIFT" is not defined [-Wundef]
/home/buildbot/repos/linux/arch/parisc/include/asm/pgtable.h:92:6: warning: "BITS_PER_PTE_ENTRY" is not defined [-Wundef]

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
---
 arch/parisc/include/asm/pgtable.h |    2 ++
 1 file changed, 2 insertions(+)

Index: linux-3.4-rc6-fast/arch/parisc/include/asm/pgtable.h
===================================================================
--- linux-3.4-rc6-fast.orig/arch/parisc/include/asm/pgtable.h	2012-05-09 04:34:41.000000000 +0200
+++ linux-3.4-rc6-fast/arch/parisc/include/asm/pgtable.h	2012-05-09 04:35:16.000000000 +0200
@@ -44,6 +44,8 @@ struct vm_area_struct;
 
 #endif /* !__ASSEMBLY__ */
 
+#include <asm/page.h>
+
 #define pte_ERROR(e) \
 	printk("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \

