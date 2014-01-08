From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fix for v3.13
Date: Wed, 8 Jan 2014 23:46:36 +0100
Message-ID: <20140108224636.GA19216@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull one late fix for Linux v3.13 for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.13

This patch fixes the kmap/kunmap implementation on parisc and finally makes AIO work on parisc.

Thanks,
Helge

----------------------------------------------------------------
John David Anglin (1):
      parisc: Ensure full cache coherency for kmap/kunmap

 arch/parisc/include/asm/cacheflush.h | 12 ++++--------
 arch/parisc/include/asm/page.h       |  5 ++---
 arch/parisc/kernel/cache.c           | 35 -----------------------------------
 3 files changed, 6 insertions(+), 46 deletions(-)
