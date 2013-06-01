From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.10-rc4
Date: Sat, 1 Jun 2013 15:29:52 +0200
Message-ID: <20130601132952.GA26730@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the latest changes for the parisc architecture.

They are available in the for-3.10 branch in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-3.10

Thanks!
Helge

----------------------------------------------------------------

This patcheset includes fixes for:
- the PCI/LBA which brings back the stifb graphics framebuffer console
- possible memory overflows in parisc kernel init code
- parport support on older GSC machines
- avoids that users by mistake enable PARPORT_PC_SUPERIO on parisc
- MAINTAINERS file list updates for parisc.

----------------------------------------------------------------
Bjorn Helgaas (1):
      parisc/PCI: Set type for LBA bus_num resource

Chen Gang (2):
      parisc: memory overflow, 'name' length is too short for using
      parisc: kernel: using strlcpy() instead of strcpy()

Helge Deller (5):
      parisc: fix kernel BUG at arch/parisc/include/asm/mmzone.h:50
      MAINTAINERS: update parisc architecture file list
      parisc/PCI: lba: fix: convert to pci_create_root_bus() for correct root bus resources (v2)
      parport_pc: disable PARPORT_PC_SUPERIO on parisc architecture
      parisc: parport0: fix this legacy no-device port driver!

Paul Bolle (1):
      parisc: rename "CONFIG_PA7100" to "CONFIG_PA7000"

 MAINTAINERS                      | 8 ++++++++
 arch/parisc/Makefile             | 2 +-
 arch/parisc/include/asm/mmzone.h | 5 +----
 arch/parisc/kernel/drivers.c     | 2 +-
 arch/parisc/kernel/setup.c       | 3 ++-
 drivers/parisc/lba_pci.c         | 9 +++++----
 drivers/parport/Kconfig          | 2 +-
 drivers/parport/parport_gsc.c    | 6 +++---
 drivers/parport/parport_gsc.h    | 2 +-
 9 files changed, 23 insertions(+), 16 deletions(-)
