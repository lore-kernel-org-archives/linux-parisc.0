From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v3.12
Date: Sat, 19 Oct 2013 22:27:59 +0200
Message-ID: <20131019202759.GA3700@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Please pull the latest parisc fixes from

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.12

There are just two small fixes in here:
- Revert a commit which exported the flush_cache_page function. This was
  noticed by Christoph Hellwig. 
- Enable the DEVTMPFS, DEVTMPFS_MOUNT and BLK_DEV_INITRD config options in the
  parisc defconfigs so that latest udev/initrd finds the root disk at boot.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (2):
      Revert "parisc: Export flush_cache_page() (needed by lustre)"
      parisc: enable DEVTMPFS, DEVTMPFS_MOUNT and BLK_DEV_INITRD in defconfigs

 arch/parisc/configs/712_defconfig     | 2 ++
 arch/parisc/configs/a500_defconfig    | 2 ++
 arch/parisc/configs/b180_defconfig    | 3 +++
 arch/parisc/configs/c3000_defconfig   | 3 +++
 arch/parisc/configs/c8000_defconfig   | 2 ++
 arch/parisc/configs/default_defconfig | 2 ++
 arch/parisc/kernel/cache.c            | 1 -
 7 files changed, 14 insertions(+), 1 deletion(-)
