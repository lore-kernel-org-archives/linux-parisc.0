From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.10
Date: Wed, 8 May 2013 00:11:02 +0200
Message-ID: <20130507221102.GA5338@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Linus,

please pull the parisc architecture updates for v3.10 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-for-3.10


Main fixes and updates in this patch series are:
 - we faced kernel stack corruptions because of multiple delivery of interrupts
 - added kernel stack overflow checks
 - added possibility to use dedicated stacks for irq processing
 - initial support for page sizes > 4k
 - more information in /proc/interrupts (e.g. TLB flushes and number of IPI calls)
 - documented how the parisc gateway page works
 - and of course quite some other smaller cleanups and fixes.

Thanks,
Helge

----------------------------------------------------------------
Damian Hobson-Garcia (1):
      parisc: Provide default implementation for dma_{alloc, free}_attrs

Helge Deller (7):
      parisc: fix partly 16/64k PAGE_SIZE boot
      parisc: document the parisc gateway page
      parisc: implement atomic64_dec_if_positive()
      parisc: add kernel stack overflow check
      parisc: implement irq stacks
      parisc: more irq statistics in /proc/interrupts
      parisc: tlb flush counting fix for SMP and UP

John David Anglin (2):
      parisc: use long branch in fork_like macro
      parisc: only re-enable interrupts if we need to schedule or deliver signals when returning to userspace

Mike Frysinger (1):
      parisc: fix NATIVE set up in build

Rolf Eike Beer (1):
      parisc: fix whitespace errors in arch/parisc/kernel/traps.c

Zhao Hongjiang (1):
      parisc: remove the second argument of kmap_atomic

 arch/parisc/Kconfig                   |   9 +++
 arch/parisc/Kconfig.debug             |  11 ++++
 arch/parisc/Makefile                  |   4 +-
 arch/parisc/include/asm/atomic.h      |  23 ++++++++
 arch/parisc/include/asm/dma-mapping.h |   3 +
 arch/parisc/include/asm/hardirq.h     |  32 ++++++++++-
 arch/parisc/include/asm/processor.h   |  20 ++++++-
 arch/parisc/include/asm/thread_info.h |   2 +-
 arch/parisc/include/asm/tlbflush.h    |   2 +
 arch/parisc/kernel/cache.c            |   6 +-
 arch/parisc/kernel/entry.S            |  68 +++++++++++++++++++---
 arch/parisc/kernel/hpmc.S             |   4 +-
 arch/parisc/kernel/irq.c              | 104 +++++++++++++++++++++++++++++++++-
 arch/parisc/kernel/pacache.S          |  33 ++++++-----
 arch/parisc/kernel/setup.c            |   2 +
 arch/parisc/kernel/smp.c              |  14 +----
 arch/parisc/kernel/syscall.S          |  34 +++++++++--
 arch/parisc/kernel/traps.c            |  24 ++++----
 arch/parisc/kernel/vmlinux.lds.S      |   2 +-
 arch/parisc/mm/init.c                 |   2 +
 drivers/parisc/sba_iommu.c            |  19 +++++--
 21 files changed, 348 insertions(+), 70 deletions(-)
