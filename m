From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for v4.13-rc4
Date: Tue, 1 Aug 2017 18:30:53 +0200
Message-ID: <20170801163053.GA1151@p100.box>
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

please pull four small important fixes for the parisc architecture for 4.13-rc4 from

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.13-4

Changes:
- Our cache flushing code runs into a BUG in case context is not current. Fix
  it by flushing the whole cache in such rare situations (by Dave Anglin).

- Fix a "sleeping function called from invalid context BUG" in our pdc_stable
  driver by rearranging our locks (by James Bottomley)

- The thread and irq stacks require more than 16 KB since kernel 4.11. Increase
  both to 32 KB.

- Define CONFIG_CPU_BIG_ENDIAN unconditionally on parisc to avoid wrong behaviour
  in qrwlock functions (by Babu Moger).

Thanks,
Helge

----------------------------------------------------------------
Babu Moger (1):
      parisc: Define CONFIG_CPU_BIG_ENDIAN

Helge Deller (1):
      parisc: Increase thread and stack size to 32kb

James Bottomley (1):
      parisc: pdc_stable: Fix locking when creating sysfs links

John David Anglin (1):
      parisc: Handle vma's whose context is not current in flush_cache_range

 arch/parisc/Kconfig                   | 3 +++
 arch/parisc/include/asm/thread_info.h | 2 +-
 arch/parisc/kernel/cache.c            | 5 ++---
 arch/parisc/kernel/irq.c              | 2 +-
 drivers/parisc/pdc_stable.c           | 6 +++---
 5 files changed, 10 insertions(+), 8 deletions(-)
