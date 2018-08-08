From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes
Date: Wed, 8 Aug 2018 22:51:10 +0200
Message-ID: <20180808205110.GA3398@ls3530>
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

would you please pull two important patches for the parisc architecture for kernel 4.18 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.18-2

The first patch is trivial and fixes the kernel build if someone chooses to
build the generic 64bit defconfig. Alex Ghiti ran into that issue when he tried
to build a 4.18 kernel with his hugetlb patches on parisc64.

The patch from Dave adds missing memory barriers to the assembler unlock
sequences. Our hope is, that this should help us to fix the issues we rarely
still see with spinlocks.

Both patches had been in the for-next branch for a few days without any
reported issues and are tagged to be backported to all kernels above v4.0.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      parisc: Enable CONFIG_MLONGCALLS by default

John David Anglin (1):
      parisc: Define mb() and add memory barriers to assembler unlock sequences

 arch/parisc/Kconfig               |  2 +-
 arch/parisc/include/asm/barrier.h | 32 ++++++++++++++++++++++++++++++++
 arch/parisc/kernel/entry.S        |  2 ++
 arch/parisc/kernel/pacache.S      |  1 +
 arch/parisc/kernel/syscall.S      |  4 ++++
 5 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 arch/parisc/include/asm/barrier.h
