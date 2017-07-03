From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for v4.13
Date: Mon, 3 Jul 2017 21:13:03 +0200
Message-ID: <20170703191303.GA1182@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Eric Biggers <ebiggers@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull fixes and enhancements for the parisc architecture for kernel 4.13-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.13-1

Main changes are:

- Added support to the parisc dma functions to return DMA_ERROR_CODE if DMA
  isn't possible. This fixes a long standing kernel crash if parport_pc is
  enabled (by Thomas Bogendoerfer, marked for stable series).

- Use the compat_sys_keyctl() in compat mode (by Eric Biggers, marked for stable
  series).
 
- Initial support for the Page Deallocation Table (PDT) which is maintained by
  firmware and holds the list of memory addresses which had physical errors.
  By checking that list we can prevent Linux to use those broken memory areas.

- Ensure IRQs are off in switch_mm().

- Report SIGSEGV instead of SIGBUS when running out of stack.

- Mark the cr16 clocksource stable on single-socket and single-core machines.

Thanks,
Helge

----------------------------------------------------------------
Eric Biggers (1):
      parisc: use compat_sys_keyctl()

Helge Deller (9):
      parisc: Inline trivial exception code in lusercopy.S
      parisc: Drop per_cpu uaccess related exception_data struct
      parisc: Enhance detection of synchronous cr16 clocksources
      parisc: Add Page Deallocation Table (PDT) support
      parisc/mm: Ensure IRQs are off in switch_mm()
      parisc: Avoid zeroing gr[0] in fixup_exception()
      parisc: Don't hardcode PSW values in gsc_*() functions
      parisc: Don't hardcode PSW values in hpmc code
      parisc: Report SIGSEGV instead of SIGBUS when running out of stack

Thomas Bogendoerfer (1):
      parisc: DMA API: return error instead of BUG_ON for dma ops on non dma devs

 arch/parisc/include/asm/dma-mapping.h |  11 ++-
 arch/parisc/include/asm/io.h          |  16 ++--
 arch/parisc/include/asm/mmu_context.h |  15 +++-
 arch/parisc/include/asm/pdc.h         |  18 +++++
 arch/parisc/include/asm/pdcpat.h      |  35 ++++++---
 arch/parisc/include/asm/pgtable.h     |   3 +
 arch/parisc/include/asm/processor.h   |   2 +
 arch/parisc/include/asm/uaccess.h     |  11 ---
 arch/parisc/include/uapi/asm/pdc.h    |  12 +--
 arch/parisc/kernel/Makefile           |   2 +-
 arch/parisc/kernel/asm-offsets.c      |   5 --
 arch/parisc/kernel/firmware.c         | 108 +++++++++++++++++++++++++
 arch/parisc/kernel/hpmc.S             |   5 +-
 arch/parisc/kernel/inventory.c        |   9 +++
 arch/parisc/kernel/pdt.c              | 143 ++++++++++++++++++++++++++++++++++
 arch/parisc/kernel/processor.c        |   5 +-
 arch/parisc/kernel/syscall_table.S    |   2 +-
 arch/parisc/kernel/time.c             |  24 +++++-
 arch/parisc/lib/lusercopy.S           |  25 +++---
 arch/parisc/mm/fault.c                |  12 +--
 arch/parisc/mm/init.c                 |   3 +
 drivers/parisc/ccio-dma.c             |  12 +++
 drivers/parisc/dino.c                 |   5 +-
 drivers/parisc/lba_pci.c              |   6 +-
 drivers/parisc/sba_iommu.c            |  14 ++++
 25 files changed, 420 insertions(+), 83 deletions(-)
 create mode 100644 arch/parisc/kernel/pdt.c
