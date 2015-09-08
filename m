From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for v4.3
Date: Tue, 8 Sep 2015 21:20:32 +0200
Message-ID: <20150908192032.GA3171@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the latest changes for the parisc architecture for kernel v4.3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.3-1

The most important changes in this patchset are:
- re-enable 64bit PCI bus addresses which were temporarily disabled for PA-RISC
  in kernel 4.2
- fix the 64bit CAS operation in the LWS path which now enables us to enable the
  64bit gcc atomic builtins even on 32bit userspace with 64bit kernel
- fix a long-standing bug which sometimes crashed kernel at bootup while serial
  interrupt wasn't registered yet

Thanks,
Helge

----------------------------------------------------------------
Guenter Roeck (1):
      parisc: Define ioremap_uc and ioremap_wc

Helge Deller (5):
      PCI,parisc: Enable 64-bit bus addresses on PA-RISC
      parisc: Additionally check for in_atomic() in page fault handler
      parisc: Filter out spurious interrupts in PA-RISC irq handler
      parisc: Drop CONFIG_SMP around update_cr16_clocksource()
      parisc: Use platform_device_register_simple("rtc-generic")

John David Anglin (1):
      parisc: Use double word condition in 64bit CAS operation

 arch/parisc/include/asm/io.h |  2 ++
 arch/parisc/kernel/irq.c     |  9 +++++++--
 arch/parisc/kernel/syscall.S |  2 +-
 arch/parisc/kernel/time.c    | 21 ++++-----------------
 arch/parisc/mm/fault.c       |  2 +-
 drivers/parisc/lba_pci.c     |  7 +++++--
 drivers/pci/Kconfig          |  2 +-
 7 files changed, 21 insertions(+), 24 deletions(-)
