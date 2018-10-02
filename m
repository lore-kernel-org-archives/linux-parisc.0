From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for kernel v4.19
Date: Tue, 2 Oct 2018 23:02:13 +0200
Message-ID: <20181002210213.GA17826@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Greg,

please pull a last set of fixes for the parisc architecture for kernel 4.19 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.19-3

The major change is for parisc64 to use a 64-bit suseconds_t type to
match what glibc expects for 64-bit userspace. It's an ABI change, but
since we don't have a 64-bit userspace on parisc yet, it won't introduce
a breakage.

Other than that we simply drop unused code and outdated gcc version
checks.

Thanks,
Helge

----------------------------------------------------------------
Arnd Bergmann (1):
      parisc64: change __kernel_suseconds_t to match glibc

Christoph Hellwig (1):
      parisc: remove the dead ccio-rm-dma driver

Helge Deller (1):
      parisc: Use PARISC_ITLB_TRAP constant in entry.S

Masahiro Yamada (1):
      parisc: remove check for minimum required GCC version

 arch/parisc/Makefile                       |   9 --
 arch/parisc/include/uapi/asm/posix_types.h |   3 -
 arch/parisc/kernel/entry.S                 |   2 +-
 drivers/parisc/Makefile                    |   3 -
 drivers/parisc/ccio-rm-dma.c               | 202 -----------------------------
 5 files changed, 1 insertion(+), 218 deletions(-)
 delete mode 100644 drivers/parisc/ccio-rm-dma.c
