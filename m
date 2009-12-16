From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git patches] parisc pull request for 2.6.33
Date: Wed, 16 Dec 2009 04:27:38 +0000
Message-ID: <20091216042738.GA9104@hera.kernel.org>
Reply-To: kyle@mcmartin.ca
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Mostly just compile and bug fixes this release, with a clean up from
Alexey to use seq_file, plus some ftrace stuff from Helge.

Thanks!
	Kyle

The following changes since commit 8bea8672edfca7ec5f661cafb218f1205863b343:
  Stephen Rothwell (1):
        mfd: compile fix for twl4030 renaming

are available in the git repository at:

  /pub/scm/linux/kernel/git/kyle/parisc-2.6.git next

Alexey Dobriyan (1):
      parisc: convert /proc/pdc/{lcd,led} to seq_file

David Daney (1):
      parisc: Convert BUG() to use unreachable()

Helge Deller (3):
      parisc: remove unused IRQSTAT_SIRQ_PEND and IRQSTAT_SZ defines
      parisc: add CALLER_ADDR{0-6} macros
      parisc: use sort() instead of home-made implementation (v2)

Huang Weiyi (1):
      parisc: remove duplicated #include

Thomas Gleixner (2):
      parisc: Replace old style lock init in smp.c
      parisc: Fixup last users of irq_chip->typename

 arch/parisc/include/asm/bug.h    |    4 +-
 arch/parisc/include/asm/ftrace.h |   14 +++++++++
 arch/parisc/kernel/asm-offsets.c |    3 --
 arch/parisc/kernel/irq.c         |    4 +-
 arch/parisc/kernel/signal.c      |    1 -
 arch/parisc/kernel/smp.c         |    9 ++++--
 arch/parisc/kernel/unwind.c      |   50 +++++++++++++++++++++++---------
 drivers/parisc/dino.c            |    2 +-
 drivers/parisc/eisa.c            |    2 +-
 drivers/parisc/gsc.c             |    2 +-
 drivers/parisc/iosapic.c         |    2 +-
 drivers/parisc/led.c             |   59 ++++++++++++++++++-------------------
 drivers/parisc/superio.c         |    2 +-
 13 files changed, 94 insertions(+), 60 deletions(-)
