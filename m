From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for 4.17-rc4
Date: Thu, 3 May 2018 18:54:00 +0200
Message-ID: <20180503165400.GA6897@ls3530.fritz.box>
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

please pull a few fixes and documentation updates for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.17-4

Fix two section mismatches, convert to read_persistent_clock64(), add further
documentation regarding the HPMC crash handler and make bzImage the default
build target.

Thanks,
Helge

----------------------------------------------------------------
Baolin Wang (1):
      parisc: time: Convert read_persistent_clock() to read_persistent_clock64()

Helge Deller (4):
      parisc: Make bzImage default build target
      parisc: Document rules regarding checksum of HPMC handler
      parisc: drivers.c: Fix section mismatches
      parisc: Fix section mismatches

 arch/parisc/Makefile         |  3 +++
 arch/parisc/kernel/drivers.c |  7 ++++---
 arch/parisc/kernel/pci.c     |  2 +-
 arch/parisc/kernel/time.c    |  2 +-
 arch/parisc/kernel/traps.c   | 11 +++++++++++
 arch/parisc/mm/init.c        |  2 +-
 drivers/parisc/ccio-dma.c    |  2 +-
 7 files changed, 22 insertions(+), 7 deletions(-)
