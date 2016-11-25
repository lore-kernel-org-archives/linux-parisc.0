From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for 4.9-rc7
Date: Fri, 25 Nov 2016 17:27:18 +0100
Message-ID: <20161125162718.GA10856@ls3530>
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

Please pull important fixes for the parisc architecture for v4.9-rc7 from
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.9-4


On parisc we were still seeing occasional random segmentation faults and memory
corruption on SMP machines. Dave Anglin then looked again at the TLB related
code and found two issues in the PCI DMA and generic TLB flush functions.

Then, in our startup code we had some timing of the cache and TLB functions to
calculate a threshold when to use a complete TLB/cache flush or just to flush a
specific range. This code produced a race with newly started CPUs and thus lead
to occasional kernel crashes (due to stale TLB/cache entries).  The patch by
Dave fixes this issue by flushing the local caches before starting secondary
CPUs and by removing the race.

The last problem fixed by this series is that we quite often suffered from hung
tasks and self-detected stalls on the CPUs. It was somehow clear that this was
related to the (in v4.7) newly introduced cr16 clocksource and the own
implementation of sched_clock(). I replaced the open-coded sched_clock()
function and switched to the generic sched_clock() implementation which seems
to have fixed this isse as well.

All patches have been sucessfully tested on a variety of machines, including our
debian buildd servers.

All patches (beside the small pr_cont fix) are tagged for stable releases.

Thanks,
Helge


----------------------------------------------------------------
Helge Deller (2):
      parisc: Fix printk continuations in system detection
      parisc: Switch to generic sched_clock implementation

John David Anglin (3):
      parisc: Fix races in parisc_setup_cache_timing()
      parisc: Fix race in pci-dma.c
      parisc: Also flush data TLB in flush_icache_page_asm

 arch/parisc/Kconfig            |  4 ++-
 arch/parisc/kernel/cache.c     | 31 +++++++++--------------
 arch/parisc/kernel/inventory.c |  8 +++---
 arch/parisc/kernel/pacache.S   | 37 ++++++++++++++++-----------
 arch/parisc/kernel/pci-dma.c   |  2 +-
 arch/parisc/kernel/setup.c     |  4 +++
 arch/parisc/kernel/time.c      | 57 ++++++++----------------------------------
 7 files changed, 57 insertions(+), 86 deletions(-)
