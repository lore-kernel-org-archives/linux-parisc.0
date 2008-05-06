From: Mel Gorman <mel@csn.ul.ie>
Subject: Re: parisc DISCONTIGMEM compile breakage
Date: Tue, 6 May 2008 16:27:14 +0100
Message-ID: <20080506152713.GA5034@csn.ul.ie>
References: <20080506134648.GA30082@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Cc: Christoph Lameter <clameter@sgi.com>,
	Lee Schermerhorn <lee.schermerhorn@hp.com>,
	kyle@parisc-linux.org, matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Adrian Bunk <bunk@kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080506134648.GA30082@cs181133002.pp.htv.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On (06/05/08 16:46), Adrian Bunk didst pronounce:
> Commit 54a6eb5c4765aa573a030ceeba2c14e3d2ea5706
> (mm: use two zonelist that are filtered by GFP mask)
> causes the following build error with CONFIG_DISCONTIGMEM=y
> on parisc:
> 

Thanks Adrian. I don't have a pa-risc cross-compiler and there isn't one
at the usual source http://userweb.kernel.org/~akpm/cross-compilers but the
patch below should fix it. Note that this debugging code should be deleted if
the mm-initialisation-and-debugging framework in -mm is merged to mainline
as it knows how to print all the zonelists where as the pa-risc equivilant
misses the GFP_THISNODE lists.

=====
Subject: [PATCH] Fix pa-risc DISCONTIGMEM compile breakage
    
PA-RISC to aid debugging prints out the zonelists setup by the system. A
bad call to node_zonelist() breaks at compile-time. This patch fixes it.

Signed-off-by: Mel Gorman <mel@csn.ul.ie>
---
 arch/parisc/mm/init.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 1f01284..b0ed709 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -606,7 +606,7 @@ void show_mem(void)
 		int i, j;
 
 		for (i = 0; i < npmem_ranges; i++) {
-			zl = node_zonelist(i);
+			zl = node_zonelist(i, 0);
 			for (j = 0; j < MAX_NR_ZONES; j++) {
 				struct zoneref *z;
 				struct zone *zone;

-- 
Mel Gorman
Part-time Phd Student                          Linux Technology Center
University of Limerick                         IBM Dublin Software Lab
