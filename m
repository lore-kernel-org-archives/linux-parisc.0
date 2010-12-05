From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git pull request] parisc fixes for 2.6.37
Date: Sun, 5 Dec 2010 00:47:10 +0000
Message-ID: <20101205004710.GA10250@hera.kernel.org>
Reply-To: kyle@mcmartin.ca
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Please pull the following bug fixes for parisc. Contents are entirely
bug fixes (two for the do_IRQ removal earlier this release) and a signal
patch to remove redundant initializing of a union pointed out by Randy.

regards, Kyle

---

The following changes since commit bcb38ceb225f5d5b2198a2755277cd441ed1e82b:

  Revert "debug_locks: set oops_in_progress if we will log messages." (2010-11-29 15:18:28 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git fixes

Guy Martin (2):
      parisc: KittyHawk LCD fix
      parisc: Fix GSC PS/2 driver name for keyboard and mouse

James Bottomley (2):
      parisc: fix dino/gsc interrupts
      parisc: convert the rest of the irq handlers to simple/percpu

Kyle McMartin (1):
      parisc: remove redundant initialization in sigsegv path of sys_rt_sigreturn

 arch/parisc/kernel/irq.c     |    7 ++-----
 arch/parisc/kernel/signal.c  |    9 +--------
 drivers/input/serio/gscps2.c |    2 +-
 drivers/parisc/dino.c        |    1 -
 drivers/parisc/eisa.c        |    3 +--
 drivers/parisc/gsc.c         |    3 +--
 drivers/parisc/iosapic.c     |    8 ++++++++
 drivers/parisc/led.c         |   17 +++++++++++++----
 drivers/parisc/superio.c     |    3 +--
 9 files changed, 28 insertions(+), 25 deletions(-)
