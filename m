From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git patches] xfs and block fixes for virtually indexed arches
Date: Wed, 16 Dec 2009 04:36:18 +0000
Message-ID: <20091216043618.GB9104@hera.kernel.org>
Reply-To: kyle@mcmartin.ca
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	James.Bottomley@suse.de, hch@infradead.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

As discussed on linux-arch@ recently, these fixes are necessary for
XFS to work on virtually indexed architectures since otherwise vmalloc'd
pages are not properly flushed from the cache.

Thanks!
 Kyle

The following changes since commit 8bea8672edfca7ec5f661cafb218f1205863b343:
  Stephen Rothwell (1):
        mfd: compile fix for twl4030 renaming

are available in the git repository at:

  hera.kernel.org:/pub/scm/linux/kernel/git/kyle/parisc-2.6.git coherence

James Bottomley (6):
      mm: add coherence API for DMA to vmalloc/vmap areas
      parisc: add mm API for DMA to vmalloc/vmap areas
      arm: add mm API for DMA to vmalloc/vmap areas
      sh: add mm API for DMA to vmalloc/vmap areas
      block: permit I/O to vmalloc/vmap kernel pages
      xfs: fix xfs to work with Virtually Indexed architectures

 Documentation/cachetlb.txt           |   24 ++++++++++++++++++++++++
 arch/arm/include/asm/cacheflush.h    |   10 ++++++++++
 arch/parisc/include/asm/cacheflush.h |    8 ++++++++
 arch/sh/include/asm/cacheflush.h     |    8 ++++++++
 fs/bio.c                             |   20 ++++++++++++++++++--
 fs/xfs/linux-2.6/xfs_buf.c           |   20 ++++++++++++++++++++
 include/linux/highmem.h              |    6 ++++++
 7 files changed, 94 insertions(+), 2 deletions(-)
