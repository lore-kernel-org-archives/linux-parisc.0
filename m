From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.10
Date: Tue, 18 Jun 2013 23:39:56 +0200
Message-ID: <20130618213956.GA20451@p100.box>
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

Please pull the latest parisc architecture fixes from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.10

It contains a kernel segfault fix when reading /proc/kpageflags or /proc/kpagecount,
two fixes for the serial port and PCI graphic card support on C8000 workstations
and a fix to use unshadowed registers for flushing D- and I-caches.


This patchset touches parisc-specific source files only.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      parisc: fix kernel BUG at arch/parisc/include/asm/mmzone.h:50 (part 2)

John David Anglin (1):
      parisc: Use unshadowed index register for flush instructions in flush_dcache_page_asm and flush_icache_page_asm

Thomas Bogendoerfer (2):
      parisc: fix serial ports on C8000 workstation
      parisc: provide pci_mmap_page_range() for parisc

 arch/parisc/include/asm/mmzone.h   |  4 +-
 arch/parisc/include/asm/pci.h      |  5 +++
 arch/parisc/kernel/hardware.c      |  1 +
 arch/parisc/kernel/pacache.S       | 76 +++++++++++++++++++-------------------
 arch/parisc/kernel/pci.c           | 27 ++++++++++++++
 arch/parisc/mm/init.c              |  2 +-
 drivers/parisc/iosapic.c           | 66 +++++++++++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_gsc.c | 10 ++++-
 8 files changed, 149 insertions(+), 42 deletions(-)
