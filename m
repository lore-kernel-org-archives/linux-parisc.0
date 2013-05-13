From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.10
Date: Mon, 13 May 2013 22:48:43 +0200
Message-ID: <20130513204843.GA1858@p100.box>
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

please pull the parisc-for-3.10 branch of 

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-for-3.10

to get the latest bug and build fixes for the parisc architecture.

Thanks,
Helge

---------------------------------------

The second round of parisc updates for 3.10 includes build fixes and
enhancements to utilize irq stacks, fixes SMP races when updating PTE
and TLB entries by proper locking and makes the search for the correct
cross compiler more robust on Debian and Gentoo.

----------------------------------------------------------------
Helge Deller (2):
      parisc: implement irq stacks - part 2 (v2)
      parisc: make default cross compiler search more robust (v3)

John David Anglin (1):
      parisc: fix SMP races when updating PTE and TLB entries in entry.S

 arch/parisc/Kconfig                 |   2 +-
 arch/parisc/Makefile                |  21 +++--
 arch/parisc/include/asm/hardirq.h   |   9 +++
 arch/parisc/include/asm/processor.h |   3 +
 arch/parisc/kernel/entry.S          | 155 +++++++++++++++++++-----------------
 arch/parisc/kernel/irq.c            | 101 +++++++++++++++++++----
 arch/parisc/mm/init.c               |   4 +-
 7 files changed, 194 insertions(+), 101 deletions(-)
