From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture code cleanups and fixes
Date: Sat, 30 Jun 2018 22:23:35 +0200
Message-ID: <20180630202335.GA7097@ls3530.fritz.box>
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

please pull some patches for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.18-1

Nothing exiting in this patchset, just small cleanups of header files, kernel
now defaults to 4 CPUs when building a SMP kernel, mark 16- and 64-kB page
sizes broken and addition of the new io_pgetevents syscall.  

Thanks,
Helge

----------------------------------------------------------------
Andy Shevchenko (1):
      parisc: Convert printk(KERN_LEVEL) to pr_lvl()

Helge Deller (6):
      parisc: Drop struct sigaction from not exported header file
      parisc: Mark 16kB and 64kB page sizes BROKEN
      parisc: Default to 4 SMP CPUs
      parisc: Wire up io_pgetevents syscall
      parisc: Reduce debug output in unwind code
      parisc: Build kernel without -ffunction-sections

 arch/parisc/Kconfig                   |  6 +++---
 arch/parisc/Makefile                  |  4 ----
 arch/parisc/include/asm/signal.h      |  8 --------
 arch/parisc/include/uapi/asm/unistd.h |  3 ++-
 arch/parisc/kernel/drivers.c          | 25 +++++++++----------------
 arch/parisc/kernel/syscall_table.S    |  1 +
 arch/parisc/kernel/unwind.c           |  4 ++--
 7 files changed, 17 insertions(+), 34 deletions(-)
