From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [git patches] parisc changes for 2.6.37-rc1
Date: Thu, 28 Oct 2010 10:10:34 -0400
Message-ID: <20101028141034.GX8332@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following changes since commit 0acc1b2afb6ded060b7d6b1b5e6ac8a00ec47547:

  Merge branch 'kvm-updates/2.6.36' of git://git.kernel.org/pub/scm/virt/kvm/kvm (2010-10-12 09:16:01 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git next

Christian Dietrich (1):
      arch/parisc: Removing undead ifdef CONFIG_PA20

FUJITA Tomonori (1):
      parisc: remove homegrown L1_CACHE_ALIGN macro

Guy Martin (1):
      parisc: add tty driver to PDC console

Joe Perches (1):
      drivers/parisc/iosapic.c: Remove unnecessary kzalloc cast

Julia Lawall (1):
      drivers/char/agp/parisc-agp.c: eliminate memory leak

Kyle McMartin (9):
      parisc: squelch warning when using dev_get_stats
      parisc: add prlimit64 syscall
      parisc: lay groundwork for killing __do_IRQ
      parisc: convert cpu interrupts to proper flow handlers
      parisc: convert iosapic interrupts to proper flow handlers
      parisc: convert suckyio interrupts to flow handlers
      parisc: convert gsc and dino pci interrupts to flow handlers
      parisc: convert eisa interrupts to flow handlers
      parisc: kill __do_IRQ

Phil Carmody (1):
      parisc: unwind - optimise linked-list searches for modules

matt mooney (1):
      parisc: change to new flag variable

 arch/parisc/Kconfig                |    4 +
 arch/parisc/include/asm/cache.h    |    2 -
 arch/parisc/include/asm/irq.h      |    2 +-
 arch/parisc/include/asm/unistd.h   |    3 +-
 arch/parisc/kernel/irq.c           |   41 +++++------
 arch/parisc/kernel/pdc_cons.c      |  141 ++++++++++++++++++++++++++++++++++--
 arch/parisc/kernel/syscall_table.S |    1 +
 arch/parisc/kernel/unaligned.c     |    3 -
 arch/parisc/kernel/unwind.c        |    5 +-
 arch/parisc/math-emu/Makefile      |    2 +-
 drivers/char/agp/parisc-agp.c      |    4 +
 drivers/parisc/dino.c              |   29 +++-----
 drivers/parisc/eisa.c              |   29 +++-----
 drivers/parisc/gsc.c               |   36 +++------
 drivers/parisc/iosapic.c           |   56 +++-----------
 drivers/parisc/led.c               |    6 +-
 drivers/parisc/superio.c           |   25 ++-----
 17 files changed, 222 insertions(+), 167 deletions(-)
