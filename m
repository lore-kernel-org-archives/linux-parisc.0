From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for 3.10-rc3
Date: Sat, 25 May 2013 20:27:36 +0200
Message-ID: <20130525182736.GA26375@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the latest parisc architecture fixes.

This time we made the kernel- and interruption stack allocation
reentrant which fixed some strange kernel crashes (specifically
protection ID traps). Furthemore this patchset fixes the interrupt stack
in UP and SMP configurations by using native locking instructions.  And
finally usage of floating point calculations on parisc were disabled in
the MPILIB.

Thanks,
Helge


The following changes since commit 17fdfd0851617b6c18c0913364caf2a54171ce85:

  Merge tag 'trace-fixes-v3.10-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace (2013-05-24 10:46:55 -0700)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-for-3.10

for you to fetch changes up to d96b51ec14650b490ab98e738bcc02309396e5bc:

  parisc: fix irq stack on UP and SMP (2013-05-24 23:29:01 +0200)

----------------------------------------------------------------
Helge Deller (6):
      MPILIB: disable usage of floating point registers on parisc
      parisc: add rp5470 entry to machine database
      parisc: use PAGE_SHIFT instead of hardcoded value 12 in pacache.S
      parisc: add additional parisc git tree to MAINTAINERS file
      parisc: show number of FPE and unaligned access handler calls in /proc/interrupts
      parisc: fix irq stack on UP and SMP

John David Anglin (1):
      parisc: make interrupt and interruption stack allocation reentrant

Peter Huewe (1):
      parisc/superio: Use module_pci_driver to register driver

 MAINTAINERS                         |  1 +
 arch/parisc/include/asm/assembly.h  |  1 -
 arch/parisc/include/asm/hardirq.h   |  7 ++----
 arch/parisc/include/asm/processor.h | 21 ----------------
 arch/parisc/kernel/entry.S          | 19 +++++++-------
 arch/parisc/kernel/hardware.c       |  1 +
 arch/parisc/kernel/irq.c            | 49 +++++++++++++++++++++++++------------
 arch/parisc/kernel/pacache.S        | 12 ++++-----
 arch/parisc/kernel/traps.c          |  1 +
 arch/parisc/kernel/unaligned.c      |  3 +++
 drivers/parisc/superio.c            | 13 +---------
 lib/mpi/longlong.h                  |  5 ++--
 12 files changed, 62 insertions(+), 71 deletions(-)
