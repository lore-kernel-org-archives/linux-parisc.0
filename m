From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [git patches] parisc build fix for 2.6.37-rc1
Date: Fri, 29 Oct 2010 14:37:26 -0400
Message-ID: <20101029183726.GZ8332@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Sorry, looks like I missed a build fix on top of my previous pull
request.

Thanks,
 Kyle

The following changes since commit 18cb657ca1bafe635f368346a1676fb04c512edf:

  Merge branch 'stable/xen-pcifront-0.8.2' of git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen   and branch 'for-linus' of git://xenbits.xen.org/people/sstabellini/linux-pvhvm (2010-10-28 17:11:17 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git next

Kyle McMartin (1):
      parisc-agp: fix missing slab.h include

 drivers/char/agp/parisc-agp.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
