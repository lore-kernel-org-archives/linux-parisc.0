From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for 4.15-rc5
Date: Mon, 18 Dec 2017 19:34:09 +0100
Message-ID: <20171218183409.GA12524@ls3530.fritz.box>
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

please pull a few important fixes for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.15-2

There are two important fixes:
- Add PCI quirks to disable built-in a serial AUX and a graphics cards from
  specific GSP (management board) PCI cards. This fixes boot via serial console
  on rp3410 and rp3440 machines.

- Revert the "Re-enable interrups early" patch which was added to kernel v4.10.
  It can trigger stack overflows and thus silent data corruption. With this
  patch reverted we can lower our thread stack back to 16kb again.

The other patches are minor cleanups: avoid duplicate includes, indenting
fixes, correctly align variable in asm code.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (3):
      parisc: Fix indenting in puts()
      parisc: Align os_hpmc_size on word boundary
      parisc: Hide Diva-built-in serial aux and graphics card

John David Anglin (2):
      Revert "parisc: Re-enable interrupts early"
      parisc: Reduce thread stack to 16 kb

Pravin Shedge (1):
      parisc: remove duplicate includes

 arch/parisc/boot/compressed/misc.c    |  4 ++--
 arch/parisc/include/asm/thread_info.h |  5 +++++
 arch/parisc/kernel/entry.S            | 12 +++++++++---
 arch/parisc/kernel/hpmc.S             |  1 +
 arch/parisc/kernel/unwind.c           |  1 -
 arch/parisc/lib/delay.c               |  2 --
 drivers/parisc/lba_pci.c              | 33 +++++++++++++++++++++++++++++++++
 7 files changed, 50 insertions(+), 8 deletions(-)
