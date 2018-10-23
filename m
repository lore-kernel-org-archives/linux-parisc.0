From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for kernel v4.20
Date: Tue, 23 Oct 2018 17:00:26 +0200
Message-ID: <20181023150026.GA15165@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Christoph Hellwig <hch@lst.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the parisc architecture patches and fixes for 4.20-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.20-1

Lots of small fixes and enhancements, most noteably:

- Many TLB and cache flush optimizations (Dave)
- Fixed HPMC/crash handler on 64-bit kernel (Dave and myself)
- Added alternative infrastructre. The kernel now live-patches itself
  for various situations, e.g. replace SMP code when running on one CPU
  only or drop cache flushes when system has no cache installed.
- vmlinuz now contains a full copy of the compressed vmlinux file. This
  simplifies debugging the currently booted kernel.
- Unused driver removal (Christoph)
- Reduced warnings of Dino PCI bridge when running in qemu
- Removed gcc version check (Masahiro)

Thanks,
Helge

----------------------------------------------------------------
Christoph Hellwig (1):
      parisc: remove the dead ccio-rm-dma driver

Helge Deller (14):
      parisc: Use PARISC_ITLB_TRAP constant in entry.S
      parisc: Add SYSTEM_INFO and REGISTER TOC PAT functions
      parisc: Clean up crash header output
      parisc: dino: Utilize DINO_MASK_IRQ() macro
      parisc: Ratelimit dino stuck interrupt warnings
      parisc: Fix map_pages() to not overwrite existing pte entries
      parisc: Fix exported address of os_hpmc handler
      extract-vmlinux: Check for uncompressed image as fallback
      parisc: Include compressed vmlinux file in vmlinuz boot kernel
      parisc: Add alternative coding infrastructure
      parisc: Use zdep for shlw macro on PA1.1 and PA2.0
      parisc: Drop two instructions from pte lookup code
      parisc: Add PDC PAT cell_info() and pd_get_pdc_revisions() functions
      parisc: Retrieve and display the PDC PAT capabilities

John David Anglin (7):
      parisc: Reorder TLB flush timing calculation
      parisc: Remove PTE load and fault check from L2_ptep macro
      parisc: Release spinlocks using ordered store
      parisc: Purge TLB entries after updating page table entry and set page accessed flag in TLB handler
      parisc: Fix address in HPMC IVA
      parisc: Remove pte_inserted define
      parisc: Optimze cache flush algorithms

Masahiro Yamada (1):
      parisc: remove check for minimum required GCC version

 arch/parisc/Makefile                      |   9 -
 arch/parisc/boot/compressed/Makefile      |   4 +-
 arch/parisc/boot/compressed/misc.c        |  95 ++++++++--
 arch/parisc/boot/compressed/vmlinux.lds.S |  10 +-
 arch/parisc/include/asm/alternative.h     |  47 +++++
 arch/parisc/include/asm/assembly.h        |   9 +-
 arch/parisc/include/asm/cache.h           |  22 ++-
 arch/parisc/include/asm/page.h            |  12 +-
 arch/parisc/include/asm/pdc.h             |   1 +
 arch/parisc/include/asm/pdcpat.h          |  62 +++++--
 arch/parisc/include/asm/pgtable.h         |  33 ++--
 arch/parisc/include/asm/sections.h        |   2 +
 arch/parisc/include/asm/spinlock.h        |   4 +-
 arch/parisc/include/asm/tlbflush.h        |   3 +-
 arch/parisc/kernel/cache.c                |  63 ++++---
 arch/parisc/kernel/entry.S                |  34 ++--
 arch/parisc/kernel/firmware.c             |  57 ++++++
 arch/parisc/kernel/hpmc.S                 |   3 +-
 arch/parisc/kernel/inventory.c            |  10 ++
 arch/parisc/kernel/pacache.S              | 280 ++++++++++++++++++++++++++----
 arch/parisc/kernel/setup.c                |  81 +++++++++
 arch/parisc/kernel/signal.c               |   1 -
 arch/parisc/kernel/syscall.S              |  12 +-
 arch/parisc/kernel/traps.c                |   7 +-
 arch/parisc/kernel/vmlinux.lds.S          |   6 +
 arch/parisc/mm/init.c                     |  23 ++-
 drivers/parisc/Makefile                   |   3 -
 drivers/parisc/ccio-dma.c                 |  12 +-
 drivers/parisc/ccio-rm-dma.c              | 202 ---------------------
 drivers/parisc/dino.c                     |   5 +-
 drivers/parisc/sba_iommu.c                |  17 +-
 scripts/extract-vmlinux                   |   6 +-
 32 files changed, 721 insertions(+), 414 deletions(-)
 create mode 100644 arch/parisc/include/asm/alternative.h
 delete mode 100644 drivers/parisc/ccio-rm-dma.c
