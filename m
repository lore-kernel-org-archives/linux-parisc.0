From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [GIT PULL] parisc fixes for 2.6.39-rc5
Date: Wed, 27 Apr 2011 15:18:38 -0500
Message-ID: <1303935518.2583.27.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

These two fixes contain the agreed fix for our slub panic (agreed with
the mm folks that we'll define SLUB broken in the !NUMA && DISCONTIGMEM
case, which should fix m86k as well) and another buglet that turned up
examining the parisc discontigmem code.

The patches are here:

master.kernel.org:/pub/scm/linux/kernel/git/jejb/parisc-2.6.git#fixes

The short changelog is:

David Rientjes (1):
      [PARISC] set memory ranges in N_NORMAL_MEMORY when onlined

James Bottomley (1):
      [PARISC] slub: fix panic with DISCONTIGMEM

The diffstat is:

 arch/parisc/mm/init.c |    4 +++-
 init/Kconfig          |    1 +
 2 files changed, 4 insertions(+), 1 deletions(-)

And the full diff are below.

James

---

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index b7ed8d7..b1d1262 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -266,8 +266,10 @@ static void __init setup_bootmem(void)
 	}
 	memset(pfnnid_map, 0xff, sizeof(pfnnid_map));
 
-	for (i = 0; i < npmem_ranges; i++)
+	for (i = 0; i < npmem_ranges; i++) {
+		node_set_state(i, N_NORMAL_MEMORY);
 		node_set_online(i);
+	}
 #endif
 
 	/*
diff --git a/init/Kconfig b/init/Kconfig
index 56240e7..a7ad8fb 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1226,6 +1226,7 @@ config SLAB
 	  per cpu and per node queues.
 
 config SLUB
+	depends on BROKEN || NUMA || !DISCONTIGMEM
 	bool "SLUB (Unqueued Allocator)"
 	help
 	   SLUB is a slab allocator that minimizes cache line usage


