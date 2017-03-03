From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for 4.11
Date: Fri, 3 Mar 2017 23:24:24 +0100
Message-ID: <20170303222424.GA14364@ls3530>
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

Please pull the changes for the parisc architecture for v4.11 from
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.11-1

Nothing really important in this patchset: Fix resource leaks in error paths,
coding style cleanups and code removal.

Thanks,
Helge

----------------------------------------------------------------
Arvind Yadav (3):
      parisc: eisa: Remove coding style errors
      parisc: eisa: Fix resource leaks in error paths
      parisc: ccio-dma: Handle return NULL error from ioremap_nocache

Dan Carpenter (1):
      parisc: fix a printk

Helge Deller (1):
      parisc: Define access_ok() as macro

John David Anglin (1):
      parisc: Remove flush_user_dcache_range and flush_user_icache_range

 arch/parisc/include/asm/cacheflush.h |   2 -
 arch/parisc/include/asm/uaccess.h    |   6 +-
 arch/parisc/kernel/cache.c           |  18 ------
 arch/parisc/kernel/signal.c          |  13 ++--
 arch/parisc/mm/fault.c               |   4 +-
 drivers/parisc/ccio-dma.c            |   6 +-
 drivers/parisc/eisa.c                | 122 +++++++++++++++++++----------------
 7 files changed, 83 insertions(+), 88 deletions(-)
