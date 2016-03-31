From: Helge Deller <deller@gmx.de>
Subject: [PATCH] selftests/thuge-gen: Use platform specific MAP_HUGETLB value
Date: Thu, 31 Mar 2016 13:11:05 +0200
Message-ID: <20160331111105.GA30888@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, linux-kselftest@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Do not hardcode MAP_HUGETLB to 0x40000, since quite some architectures
use a different value.

Tested with a parisc architecture 64bit kernel.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/tools/testing/selftests/vm/thuge-gen.c b/tools/testing/selftests/vm/thuge-gen.c
index c879572..0bc737a 100644
--- a/tools/testing/selftests/vm/thuge-gen.c
+++ b/tools/testing/selftests/vm/thuge-gen.c
@@ -30,7 +30,9 @@
 #define MAP_HUGE_1GB    (30 << MAP_HUGE_SHIFT)
 #define MAP_HUGE_SHIFT  26
 #define MAP_HUGE_MASK   0x3f
+#if !defined(MAP_HUGETLB)
 #define MAP_HUGETLB	0x40000
+#endif
 
 #define SHM_HUGETLB     04000   /* segment will use huge TLB pages */
 #define SHM_HUGE_SHIFT  26
