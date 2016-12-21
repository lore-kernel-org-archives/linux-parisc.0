From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for v4.10-rc1
Date: Wed, 21 Dec 2016 16:48:28 +0100
Message-ID: <20161221154828.GA26282@p100.box>
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

please pull the changes for this merge window for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.10-1

Changes include:
 
- Add Kernel address space layout randomization support
- Re-enable interrupts earlier now that we have a working IRQ stack
- Optimize the timer interrupt function to better cope with missed timer irqs
- Fix error return code in parisc perf code (by Dan Carpenter)
- Fix PAT debug code

Thanks,
Helge

----------------------------------------------------------------
Dan Carpenter (1):
      parisc: perf: return -EFAULT on error

Helge Deller (4):
      parisc: Enable KASLR
      parisc: Re-enable interrupts early
      parisc: Enhance CPU detection code on PAT machines
      parisc: Optimize timer interrupt function

 arch/parisc/Kconfig                 |   1 +
 arch/parisc/include/asm/elf.h       |   7 ++-
 arch/parisc/include/asm/pdcpat.h    |   2 +-
 arch/parisc/include/asm/processor.h |   4 --
 arch/parisc/kernel/entry.S          |  12 +---
 arch/parisc/kernel/firmware.c       |   2 +-
 arch/parisc/kernel/inventory.c      |   8 +--
 arch/parisc/kernel/perf.c           |   5 +-
 arch/parisc/kernel/process.c        |   6 +-
 arch/parisc/kernel/processor.c      |  29 +++++-----
 arch/parisc/kernel/sys_parisc.c     |  18 +++---
 arch/parisc/kernel/time.c           | 112 ++++++++++--------------------------
 12 files changed, 67 insertions(+), 139 deletions(-)
