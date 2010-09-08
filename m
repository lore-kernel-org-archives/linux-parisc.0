From: Nikitas Angelinas <nikitasangelinas@gmail.com>
Subject: [PATCH 2/8] arch/parisc/include/asm: use ARRAY_SIZE macro in mmzone.h
Date: Wed,  8 Sep 2010 22:11:13 +0100
Message-ID: <1283980273-4880-1-git-send-email-nikitasangelinas@gmail.com>
References: <1283979457-4649-1-git-send-email-nikitasangelinas@gmail.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nikitas Angelinas <nikitasangelinas@gmail.com>
To: kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1283979457-4649-1-git-send-email-nikitasangelinas@gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Replace sizeof(pfnnid_map) / sizeof(pfnnid_map[0]) with
ARRAY_SIZE(pfnnid_map) in mmzone.h

Signed-off-by: Nikitas Angelinas <nikitasangelinas@gmail.com>
---
 arch/parisc/include/asm/mmzone.h |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/include/asm/mmzone.h b/arch/parisc/include/asm/mmzone.h
index 9608d2c..85b23b6 100644
--- a/arch/parisc/include/asm/mmzone.h
+++ b/arch/parisc/include/asm/mmzone.h
@@ -3,6 +3,8 @@
 
 #ifdef CONFIG_DISCONTIGMEM
 
+#include <linux/kernel.h>
+
 #define MAX_PHYSMEM_RANGES 8 /* Fix the size for now (current known max is 3) */
 extern int npmem_ranges;
 
@@ -51,7 +53,7 @@ static inline int pfn_to_nid(unsigned long pfn)
 		return 0;
 
 	i = pfn >> PFNNID_SHIFT;
-	BUG_ON(i >= sizeof(pfnnid_map) / sizeof(pfnnid_map[0]));
+	BUG_ON(i >= ARRAY_SIZE(pfnnid_map));
 	r = pfnnid_map[i];
 	BUG_ON(r == 0xff);
 
-- 
1.7.2.3
