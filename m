From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for v4.5
Date: Sat, 16 Jan 2016 22:45:00 +0100
Message-ID: <20160116214500.GA17553@p100.box>
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

please pull the patches for the parisc architecture for v4.5 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.5-1

This patchset includes two major fixes which are both scheduled for stable:
First, __ARCH_SI_PREAMBLE_SIZE was defined with a wrong value.
Second, huge page pte and TLB changes needed protection with a spinlock.
Other than that there are just some trivial optimizations and cleanups.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (6):
      parisc: Initialize PCI bridge cache line and default latency
      parisc: Reduce overhead of parisc_requires_coherency()
      parisc: Fix __ARCH_SI_PREAMBLE_SIZE
      parisc: Drop parisc-specific NSIGTRAP define
      parisc: Imporove debug info about space registers and TLB configuration
      parisc: Protect huge page pte changes with spinlocks

 arch/parisc/include/asm/hugetlb.h      | 20 +++---------
 arch/parisc/include/asm/pci.h          |  1 +
 arch/parisc/include/asm/pdc.h          |  2 +-
 arch/parisc/include/asm/processor.h    | 17 +++++-----
 arch/parisc/include/uapi/asm/siginfo.h |  7 ++--
 arch/parisc/kernel/cache.c             | 26 ++++++++++++---
 arch/parisc/kernel/pci.c               | 26 +++++++++++++++
 arch/parisc/kernel/processor.c         | 10 +++++-
 arch/parisc/mm/hugetlbpage.c           | 60 +++++++++++++++++++++++++++-------
 drivers/parisc/dino.c                  |  4 ++-
 drivers/parisc/lba_pci.c               |  4 ++-
 11 files changed, 129 insertions(+), 48 deletions(-)
