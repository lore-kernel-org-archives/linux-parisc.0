From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v4.2
Date: Fri, 10 Jul 2015 23:04:08 +0200
Message-ID: <20150710210408.GA5000@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Alex Ivanov <lausgans@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the latest fixes for the parisc architecture for v4.2-rc2 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.2-1

We have one important patch from Dave Anglin and myself which fixes PTE/TLB
race conditions which caused random segmentation faults on our debian buildd
servers, and one patch from Alex Ivanov which speeds up the graphical text
console on the STI framebuffer driver.

Thanks,
Helge

----------------------------------------------------------------
Alex Ivanov (1):
      stifb: Implement hardware accelerated copyarea

John David Anglin (1):
      parisc: Fix some PTE/TLB race conditions and optimize __flush_tlb_range based on timing results

 arch/parisc/include/asm/pgtable.h  |  55 +++++++++----
 arch/parisc/include/asm/tlbflush.h |  53 ++++++------
 arch/parisc/kernel/cache.c         | 105 +++++++++++++++---------
 arch/parisc/kernel/entry.S         | 163 ++++++++++++++++++-------------------
 arch/parisc/kernel/traps.c         |   4 -
 drivers/video/fbdev/stifb.c        |  40 ++++++++-
 6 files changed, 250 insertions(+), 170 deletions(-)
