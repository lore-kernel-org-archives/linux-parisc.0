From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] one parisc patch for v4.13-rc1
Date: Wed, 5 Jul 2017 22:28:54 +0200
Message-ID: <20170705202854.GA14623@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Christoph Hellwig provided one patch for the parisc architecture to drop the
DMA_ERROR_CODE define from the parisc architecture.
He asked me to test it and send it to you ASAP so that he can send the pull
request for the dma-mapping tree.

That said, can you please pull it from
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.13-1
before you pull Christophs dma-mapping tree ?

Changes:
- Drop DMA_ERROR_CODE and convert to ->mapping_error (by Christoph Hellwig)

Thanks,
Helge

----------------------------------------------------------------
Christoph Hellwig (1):
      parisc: ->mapping_error

 arch/parisc/include/asm/dma-mapping.h |  2 --
 drivers/parisc/ccio-dma.c             | 10 +++++++++-
 drivers/parisc/sba_iommu.c            | 10 +++++++++-
 3 files changed, 18 insertions(+), 4 deletions(-)
