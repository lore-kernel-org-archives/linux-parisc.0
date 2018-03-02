From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for 4.16-rc4
Date: Fri, 2 Mar 2018 21:11:30 +0100
Message-ID: <20180302201130.GA5035@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull a few small updates and fixes for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.16-1

Changes:
- A patch to change the ordering of cache and TLB flushes to hopefully fix the
  random segfaults we very rarely face (by Dave Anglin).
- A patch to hide the virtual kernel memory layout due to security reasons.
- Two small patches to make the kernel run more smoothly under qemu.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (4):
      parisc: Hide virtual kernel memory layout
      parisc: Check if secondary CPUs want own PDC calls
      parisc: Use cr16 interval timers unconditionally on qemu
      parisc: Reduce irq overhead when run in qemu

John David Anglin (1):
      parisc: Fix ordering of cache and TLB flushes

 arch/parisc/include/asm/cacheflush.h |  1 +
 arch/parisc/include/asm/processor.h  |  2 ++
 arch/parisc/kernel/cache.c           | 57 ++++++++++++++++++++----------------
 arch/parisc/kernel/head.S            | 18 ++++++++----
 arch/parisc/kernel/pacache.S         | 22 ++++++++++++++
 arch/parisc/kernel/smp.c             |  7 ++++-
 arch/parisc/kernel/time.c            | 11 +++----
 arch/parisc/mm/init.c                |  7 ++++-
 8 files changed, 86 insertions(+), 39 deletions(-)
