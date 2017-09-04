From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates and fixes for 4.14
Date: Mon, 4 Sep 2017 13:19:31 +0200
Message-ID: <20170904111931.GA10427@ls3530>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull fixes and enhancements for the parisc architecture for kernel 4.14 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.14-1 

Major changes include:

- Full support of the firmware Page Deallocation Table with MADV_HWPOISON and
  MADV_SOFT_OFFLINE. A kernel thread scans regularily for new bad memory pages.

- Full support for self-extracting kernel.

- Added UBSAN support.

- Lots of section mismatch fixes across all parisc drivers.

- Added examples for %pF and %pS usage in printk-formats.txt

Thanks,
Helge

----------------------------------------------------------------

Helge Deller (27):
      parisc: Add MADV_HWPOISON and MADV_SOFT_OFFLINE
      parisc: PDT/firmware: Add support to read PDT on older PAT-machines
      parisc: PDT: Add full support for memory failure via Page Deallocation Table (PDT)
      parisc: Static initialization of spinlocks in perf and unwind code
      parisc: Drop exception_data struct
      parisc: Static initialization of pcxl_res_lock spinlock
      parisc: Drop MADV_SPACEAVAIL, MADV_VPS_PURGE and MADV_VPS_INHERIT
      parisc/random: Add machine specific randomness
      parisc: Enable UBSAN support
      parisc: Add core code for self-extracting kernel
      parisc: Make existing core files reuseable for bootloader
      parisc: Wire up support for self-extracting kernel
      parisc/harmony: Fix section mismatches
      parisc/sticore: Fix section mismatches
      parisc/mux: Fix section mismatches
      parisc/8250_gsc: Fix section mismatches
      parisc/scsi/zalon: Fix section mismatches
      parisc/scsi/lasi700: Fix section mismatches
      parisc/parport_gsc: Fix section mismatches
      parisc: Fix section mismatches in parisc core drivers
      parisc/serio: Fix section mismatches in gscps2 and hp_sdc drivers
      parisc/net/lasi_82596: Fix section mismatches
      parisc/input/hilkbd: Fix section mismatches
      parisc/ipmi_si_intf: Fix section mismatches on parisc platform
      parisc/core: Fix section mismatches
      parisc: Fix up devices below a PCI-PCI MegaRAID controller bridge
      printk-formats.txt: Add examples for %pF and %pS usage

John David Anglin (1):
      parisc: Optimize switch_mm

 Documentation/printk-formats.txt          |  10 +
 arch/parisc/Kconfig                       |   9 +
 arch/parisc/Makefile                      |  16 +-
 arch/parisc/boot/.gitignore               |   2 +
 arch/parisc/boot/Makefile                 |  26 +++
 arch/parisc/boot/compressed/.gitignore    |   3 +
 arch/parisc/boot/compressed/Makefile      |  86 +++++++++
 arch/parisc/boot/compressed/head.S        |  85 +++++++++
 arch/parisc/boot/compressed/misc.c        | 301 ++++++++++++++++++++++++++++++
 arch/parisc/boot/compressed/vmlinux.lds.S | 101 ++++++++++
 arch/parisc/boot/compressed/vmlinux.scr   |  10 +
 arch/parisc/boot/install.sh               |  65 +++++++
 arch/parisc/include/asm/mmu_context.h     |   3 +
 arch/parisc/include/asm/page.h            |   4 +
 arch/parisc/include/asm/pdc.h             |   2 +
 arch/parisc/include/asm/pdcpat.h          |  14 ++
 arch/parisc/include/uapi/asm/mman.h       |   6 +-
 arch/parisc/kernel/firmware.c             |  62 +++++-
 arch/parisc/kernel/pci-dma.c              |   3 +-
 arch/parisc/kernel/pdt.c                  | 280 +++++++++++++++++++++++----
 arch/parisc/kernel/perf.c                 |   4 +-
 arch/parisc/kernel/processor.c            |  30 ++-
 arch/parisc/kernel/real2.S                |   4 +
 arch/parisc/kernel/unwind.c               |   4 +-
 arch/parisc/lib/memcpy.c                  |   2 -
 drivers/char/ipmi/ipmi_si_intf.c          |  12 +-
 drivers/input/keyboard/hilkbd.c           |  10 +-
 drivers/input/serio/gscps2.c              |  10 +-
 drivers/input/serio/hp_sdc.c              |   4 +-
 drivers/net/ethernet/i825xx/lasi_82596.c  |  10 +-
 drivers/parisc/asp.c                      |   4 +-
 drivers/parisc/ccio-dma.c                 |   4 +-
 drivers/parisc/ccio-rm-dma.c              |   6 +-
 drivers/parisc/dino.c                     |   4 +-
 drivers/parisc/eisa.c                     |   4 +-
 drivers/parisc/hppb.c                     |   6 +-
 drivers/parisc/lasi.c                     |   4 +-
 drivers/parisc/lba_pci.c                  |  46 ++++-
 drivers/parisc/sba_iommu.c                |   6 +-
 drivers/parisc/superio.c                  |   4 +-
 drivers/parisc/wax.c                      |   4 +-
 drivers/parport/parport_gsc.c             |  10 +-
 drivers/scsi/lasi700.c                    |   6 +-
 drivers/scsi/zalon.c                      |   8 +-
 drivers/tty/serial/8250/8250_gsc.c        |   8 +-
 drivers/tty/serial/mux.c                  |  14 +-
 drivers/video/console/sticore.c           |  11 +-
 sound/parisc/harmony.c                    |  10 +-
 tools/arch/parisc/include/uapi/asm/mman.h |   2 -
 49 files changed, 1182 insertions(+), 157 deletions(-)
 create mode 100644 arch/parisc/boot/.gitignore
 create mode 100644 arch/parisc/boot/Makefile
 create mode 100644 arch/parisc/boot/compressed/.gitignore
 create mode 100644 arch/parisc/boot/compressed/Makefile
 create mode 100644 arch/parisc/boot/compressed/head.S
 create mode 100644 arch/parisc/boot/compressed/misc.c
 create mode 100644 arch/parisc/boot/compressed/vmlinux.lds.S
 create mode 100644 arch/parisc/boot/compressed/vmlinux.scr
 create mode 100644 arch/parisc/boot/install.sh
