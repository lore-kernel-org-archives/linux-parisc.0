From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v4.1
Date: Tue, 21 Apr 2015 22:59:22 +0200
Message-ID: <20150421205922.GA16749@p100.box>
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

Please pull two patches for kernel v4.1 for the parisc architecture from

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.1-1

The patch by Guenter Roeck fixes the build on parisc which got broken because
of commit f24ffde43237 (parisc: expose number of page table levels on Kconfig
level) and the patch from Matthew Wilcox converts our code to use the generic
scatterlist.h header file.
 
Thanks,
Helge

----------------------------------------------------------------
Guenter Roeck (1):
      parisc: Replace PT_NLEVELS with CONFIG_PGTABLE_LEVELS

Matthew Wilcox (1):
      parisc: Eliminate sg_virt_addr() and private scatterlist.h

 arch/parisc/include/asm/Kbuild        |  1 +
 arch/parisc/include/asm/pgalloc.h     |  6 +++---
 arch/parisc/include/asm/scatterlist.h | 10 ----------
 arch/parisc/kernel/pci-dma.c          |  8 ++++----
 drivers/parisc/ccio-dma.c             |  6 +++---
 drivers/parisc/iommu-helpers.h        | 26 ++++++++++++++------------
 drivers/parisc/sba_iommu.c            |  7 +++----
 7 files changed, 28 insertions(+), 36 deletions(-)
 delete mode 100644 arch/parisc/include/asm/scatterlist.h
