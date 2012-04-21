From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: [PATCH 5/6] parisc: add missing include of asm/page.h to asm/pgtable.h
Date: Sat, 21 Apr 2012 20:20:52 +0200
Message-ID: <1619381.g3DYLeTvfU@donald.sf-tec.de>
References: <3154414.psmJh6J2U2@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3154414.psmJh6J2U2@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fixes these errors:

In file included from /home/buildbot/repos/linux/arch/parisc/include/asm/io.h:5:0,
                 from /home/buildbot/repos/linux/include/linux/io.h:22,
                 from /home/buildbot/repos/linux/include/linux/pci.h:54,
                 from /home/buildbot/repos/linux/arch/parisc/kernel/setup.c:35:
/home/buildbot/repos/linux/arch/parisc/include/asm/pgtable.h:92:6: warning: "PAGE_SHIFT" is not defined [-Wundef]
/home/buildbot/repos/linux/arch/parisc/include/asm/pgtable.h:92:6: warning: "PAGE_SHIFT" is not defined [-Wundef]
/home/buildbot/repos/linux/arch/parisc/include/asm/pgtable.h:92:6: warning: "BITS_PER_PTE_ENTRY" is not defined [-Wundef]

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
---
 arch/parisc/include/asm/pgtable.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 22dadeb..ee99f23 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -44,6 +44,8 @@ struct vm_area_struct;
 
 #endif /* !__ASSEMBLY__ */
 
+#include <asm/page.h>
+
 #define pte_ERROR(e) \
 	printk("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \
-- 
1.7.9.2


