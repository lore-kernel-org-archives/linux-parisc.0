From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] What's in parisc.git
Date: Fri, 8 Dec 2006 00:52:16 -0500
Message-ID: <20061208055216.GD2606__44490.1172574193$1416624227$gmane$org@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: akpm@osdl.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Good news is with David's patch to fix up the workqueue changes,
the most recent Linus -git boots on my C8000. I still want to finish
cleaning up some of the compat signals fallout, but all the really
heavyweight changes have either been dropped or merged.

I'll try to keep better track of changes as they hit our development
git this time around...

	Cheers,
		Kyle M.

Browse the tree at,
http://www.kernel.org/git/?p=linux/kernel/git/kyle/parisc-2.6.git;a=summary

Shortlog for branch 'master':

David Howells (1):
      WorkStruct: Fix up some PA-RISC work items

Grant Grundler (1):
      [PARISC] Remove GCC_VERSION usage as suggested by Adrian Bunk

Helge Deller (4):
      [PARISC] Show more memory information and memory layout at bootup
      [PARISC] avoid compiler warnings when compiling 64bit
      [TRIVIAL] [PARISC] Fix module.c printk message, add missing ')'
      [PARISC] lasi_82596: use BUILD_BUG_ON() and constify static array

Kyle McMartin (5):
      [PARISC] Unbreak discontigmem mem_init()
      [PARISC] Reserve 1GB of space for vmalloc/tmpalias space on parisc64
      [PARISC] bloody printf fmt string warnings
      [PARISC] Remove duplicate PDC_PAT_CELL defines
      [PARISC] Move spinlock_t out of struct cpu_data

Mariusz Kozlowski (1):
      [PARISC] pdcpat remove extra brackets

Matthew Wilcox (6):
      [PARISC] Delete arch/parisc/mm/kmap.c again
      [PARISC] parisc-agp: Fix integer/pointer warning
      [PARISC] sparse fixes
      [PARISC] more sparse fixes
      [PARISC] Fix PCI bus numbering in the presence of Cardbus bridges
      [PARISC] Make Lasi Ethernet depend on GSC only

Ryan Bradetich (9):
      [PARISC] Fix ccio_request_resource when CONFIG_IOMMU_CCIO is not defined
      [PARISC] HPPB bus updates for E-Class systems
      [PARISC] [MUX] Mux driver bug fix
      [PARISC] [MUX] Mux driver updates
      [PARISC] [MUX] Claim resources for the Mux driver
      [PARISC] [MUX] Make the Serial Mux driver work as module
      [PARISC] [MUX] Detect multiple cards in the correct order
      [PARISC] [MUX] Correctly report the number of available ports
      [PARISC] [MUX] Get the hversion directly from the parisc_device

 arch/parisc/Makefile             |    8 +--
 arch/parisc/hpux/fs.c            |   26 +++---
 arch/parisc/hpux/sys_hpux.c      |   32 ++++----
 arch/parisc/kernel/drivers.c     |    8 +-
 arch/parisc/kernel/module.c      |    3 +-
 arch/parisc/kernel/pci-dma.c     |    2 +-
 arch/parisc/kernel/pci.c         |    4 +-
 arch/parisc/kernel/process.c     |    4 +-
 arch/parisc/kernel/smp.c         |   11 ++-
 arch/parisc/mm/init.c            |   64 ++++++++++++++-
 arch/parisc/mm/ioremap.c         |    6 +-
 arch/parisc/mm/kmap.c            |  166 -------------------------------------
 arch/parisc/oprofile/init.c      |    2 +-
 drivers/char/agp/parisc-agp.c    |    2 +-
 drivers/net/Kconfig              |    6 +-
 drivers/net/lasi_82596.c         |   34 ++------
 drivers/parisc/hppb.c            |   14 ++--
 drivers/parisc/iosapic_private.h |    2 +-
 drivers/parisc/lba_pci.c         |   34 +++++---
 drivers/parisc/led.c             |   12 ++--
 drivers/parisc/power.c           |    4 +-
 drivers/parisc/sba_iommu.c       |    2 +-
 drivers/serial/mux.c             |  167 ++++++++++++++++++++++++++++++--------
 include/asm-parisc/dma-mapping.h |    2 +-
 include/asm-parisc/page.h        |    6 +-
 include/asm-parisc/pdcpat.h      |   31 +-------
 include/asm-parisc/processor.h   |    1 -
 27 files changed, 303 insertions(+), 350 deletions(-)
 delete mode 100644 arch/parisc/mm/kmap.c
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
