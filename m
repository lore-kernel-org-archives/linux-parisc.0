From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for v4.4
Date: Sat, 12 Dec 2015 19:33:11 +0100
Message-ID: <20151212183311.GA22472@p100.box>
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

please pull some fixes for the parisc architecture for v4.4 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.4-3

Fix the boot crash on Mako machines with Huge Pages, prevent a panic with SATA
controllers (and others) by correctly calculating the IOMMU space, hook up the
mlock2 syscall and drop unneeded code in the parisc pci code.

Thanks,
Helge

----------------------------------------------------------------
Bjorn Helgaas (1):
      parisc: Remove unused pcibios_init_bus()

Helge Deller (2):
      parisc: Wire up mlock2 syscall
      parisc: Disable huge pages on Mako machines

Mikulas Patocka (1):
      parisc iommu: fix panic due to trying to allocate too large region

 arch/parisc/include/asm/pgtable.h     |  3 ++-
 arch/parisc/include/uapi/asm/unistd.h |  3 ++-
 arch/parisc/kernel/pci.c              | 18 ------------------
 arch/parisc/kernel/syscall_table.S    |  1 +
 drivers/parisc/iommu-helpers.h        | 15 ++++++++-------
 5 files changed, 13 insertions(+), 27 deletions(-)
