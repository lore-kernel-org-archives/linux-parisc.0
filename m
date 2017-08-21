From: Helge Deller <deller@gmx.de>
Subject: [PATCH 00/14] parisc: Fix section mismatches
Date: Mon, 21 Aug 2017 22:22:47 +0200
Message-ID: <1503346981-28024-1-git-send-email-deller@gmx.de>
Cc: John David Anglin <dave.anglin@bell.net>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Clean up section mismatches.
Helge

Helge Deller (14):
  parisc: Add support for self-extracting kernel
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

 arch/parisc/Kconfig                       |   6 +
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
 arch/parisc/include/asm/page.h            |   4 +
 arch/parisc/include/asm/pdc.h             |   2 +
 arch/parisc/kernel/firmware.c             |  15 +-
 arch/parisc/kernel/processor.c            |   6 +-
 arch/parisc/kernel/real2.S                |   4 +
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
 drivers/parisc/lba_pci.c                  |   4 +-
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
 39 files changed, 808 insertions(+), 87 deletions(-)
 create mode 100644 arch/parisc/boot/.gitignore
 create mode 100644 arch/parisc/boot/Makefile
 create mode 100644 arch/parisc/boot/compressed/.gitignore
 create mode 100644 arch/parisc/boot/compressed/Makefile
 create mode 100644 arch/parisc/boot/compressed/head.S
 create mode 100644 arch/parisc/boot/compressed/misc.c
 create mode 100644 arch/parisc/boot/compressed/vmlinux.lds.S
 create mode 100644 arch/parisc/boot/compressed/vmlinux.scr
 create mode 100644 arch/parisc/boot/install.sh

-- 
2.1.0

