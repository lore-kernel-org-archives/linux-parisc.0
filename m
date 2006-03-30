From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [git patches] Please pull on parisc tree
Date: Thu, 30 Mar 2006 17:38:21 -0500
Message-ID: <20060330223819.GB31321@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org
To: torvalds@osdl.org
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

The following changes since commit 5d4fe2c1ce83c3e967ccc1ba3d580c1a5603a866:
  Lennert Buytenhek:
        ixp2000: fix gcc4 breakage

are found in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git

Helge Deller:
      [PARISC] Enable free_initrd_mem()
      [PARISC] I/O-Space must be ioremap_nocache()'d
      [PARISC] Fix IOREMAP with a 64-bit kernel
      [PARISC] Add STRICT_MM_TYPECHECKS
      [PARISC] Add CONFIG_HPPA_IOREMAP to conditionally enable ioremap
      [PARISC] Fix stifb with IOREMAP and a 64-bit kernel
      [PARISC] Enable ioremap functionality unconditionally
      [PARISC] Temporary FIXME for ioremapping EISA regions
      [PARISC] Remove obsolete CONFIG_DEBUG_IOREMAP
      [PARISC] Fixup CONFIG_EISA a bit
      [PARISC] Convert HIL drivers to use input_allocate_device
      [PARISC] Update defconfigs

James Bottomley:
      [PARISC] Add parisc implementation of flush_anon_page()
      [PARISC] Add parisc implementation of flush_kernel_dcache_page()

Kyle McMartin:
      [PARISC] getsockopt should be ENTRY_COMP
      [PARISC] More useful readwrite lock helpers
      [PARISC] Add PREEMPT support
      [PARISC] Make local_t use atomic_long_t
      [PARISC] Move ioremap EXPORT_SYMBOL from parisc_ksyms.c
      [PARISC] Kill duplicated EXPORT_SYMBOL warnings
      [PARISC] Add atomic_sub_and_test
      [PARISC] Fix double free when removing HIL drivers

Stuart Brady:
      [PARISC] Enabled some NLS modules in a500, b180 and c3000 defconfigs

Thibaut VARENE:
      [PARISC] Clarify pdc_stable license terms

 arch/parisc/Kconfig                 |    6 -
 arch/parisc/configs/712_defconfig   |  160 ++++++++++------------
 arch/parisc/configs/a500_defconfig  |    4 -
 arch/parisc/configs/b180_defconfig  |   12 +-
 arch/parisc/configs/c3000_defconfig |  252 +++++++++++++++--------------------
 arch/parisc/defconfig               |  165 +++++++++++++++--------
 arch/parisc/kernel/cache.c          |    6 -
 arch/parisc/kernel/entry.S          |   45 +++++-
 arch/parisc/kernel/pacache.S        |    4 -
 arch/parisc/kernel/parisc_ksyms.c   |   19 ---
 arch/parisc/kernel/pdc_chassis.c    |    5 -
 arch/parisc/kernel/perf.c           |    2 
 arch/parisc/kernel/syscall_table.S  |    2 
 arch/parisc/lib/iomap.c             |    4 -
 arch/parisc/mm/init.c               |    7 -
 arch/parisc/mm/ioremap.c            |   54 +-------
 drivers/input/keyboard/hil_kbd.c    |   58 ++++----
 drivers/input/keyboard/hilkbd.c     |   49 ++++---
 drivers/input/mouse/hil_ptr.c       |   92 +++++++------
 drivers/input/serio/gscps2.c        |    4 -
 drivers/parisc/ccio-dma.c           |    2 
 drivers/parisc/dino.c               |    5 -
 drivers/parisc/eisa.c               |    2 
 drivers/parisc/iosapic.c            |    2 
 drivers/parisc/lba_pci.c            |    8 +
 drivers/parisc/pdc_stable.c         |    5 -
 drivers/parisc/sba_iommu.c          |    6 -
 drivers/parisc/superio.c            |   46 +++---
 drivers/scsi/lasi700.c              |    2 
 drivers/scsi/zalon.c                |    2 
 drivers/serial/8250_gsc.c           |   15 +-
 drivers/serial/mux.c                |    4 -
 drivers/video/console/sticore.c     |   18 ---
 drivers/video/sticore.h             |   37 ++---
 drivers/video/stifb.c               |   91 +------------
 include/asm-parisc/atomic.h         |    3 
 include/asm-parisc/cache.h          |    2 
 include/asm-parisc/cacheflush.h     |   17 ++
 include/asm-parisc/io.h             |   95 -------------
 include/asm-parisc/local.h          |   18 +--
 include/asm-parisc/page.h           |   58 ++++++--
 include/asm-parisc/pci.h            |    5 +
 include/asm-parisc/pdc_chassis.h    |    5 -
 include/asm-parisc/spinlock.h       |   16 ++
 include/asm-parisc/thread_info.h    |    3 
 lib/Kconfig.debug                   |   13 --
 46 files changed, 625 insertions(+), 805 deletions(-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
