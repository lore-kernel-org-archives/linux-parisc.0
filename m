From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for 4.17
Date: Tue, 3 Apr 2018 21:22:56 +0200
Message-ID: <20180403192256.GA4750@ls3530>
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

please pull the updates regarding the parisc architecture for kernel 4.17 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.17-1

Lots of small enhancements and fixes in this patchset:
- improved the x86-64 compatibility for PCI cards by returning -1UL for timed
  out MMIO transactions (instead of crashing)
- fixed HPMC handler for PAT machines: size needs to be mulitple of 16 
- prepare machine_power_off() to be able to turn rp3410 and c8000 machines off
  via IMPI
- added code to extract machine info for usage with qemu
- some init sections fixes 
- lots of fixes for sparse-, ubsan- and uninitalized variables warnings. 

Thanks,
Helge

----------------------------------------------------------------
Dan Carpenter (1):
      parisc: Silence uninitialized variable warning in dbl_to_sgl_fcnvff()

Helge Deller (14):
      parisc/stifb: Use fb_memset() to avoid sparse warning
      parisc/parport_gsc: Use NULL to avoid sparse warning
      parisc/led: Fix sparse warnings
      parisc/gscps2: Fix sparse warnings
      parisc: Force to various endian types for sparse
      parisc: Convert MAP_TYPE to cover 4 bits on parisc
      parisc: Move various functions and strings to init section
      parisc/Kconfig: SMP kernels boot on all machines
      parisc: machine_power_off() should call pm_power_off()
      parisc: Directly call machine_power_off() in power button driver
      parisc: Fix HPMC handler by increasing size to multiple of 16 bytes
      parisc/pci: Switch LBA PCI bus from Hard Fail to Soft Fail mode
      parisc: Add code generator for Qemu/SeaBIOS machine info
      parisc: Fix out of array access in match_pci_device()

 arch/parisc/Kconfig                 |   6 +-
 arch/parisc/include/asm/io.h        |  12 +--
 arch/parisc/include/uapi/asm/mman.h |   2 +-
 arch/parisc/kernel/drivers.c        | 197 ++++++++++++++++++++++++++++++++++--
 arch/parisc/kernel/hardware.c       |  12 +--
 arch/parisc/kernel/hpmc.S           |   6 +-
 arch/parisc/kernel/process.c        |   6 +-
 arch/parisc/math-emu/fcnvff.c       |   2 +-
 drivers/input/serio/gscps2.c        |  11 +-
 drivers/parisc/lba_pci.c            |  20 +++-
 drivers/parisc/led.c                |   4 +-
 drivers/parisc/power.c              |   3 +-
 drivers/parport/parport_gsc.c       |   2 +-
 drivers/video/fbdev/stifb.c         |   2 +-
 14 files changed, 241 insertions(+), 44 deletions(-)
