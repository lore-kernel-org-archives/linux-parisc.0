From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for kernel v4.19
Date: Mon, 13 Aug 2018 19:13:19 +0200
Message-ID: <20180813171319.GA16531@ls3530.fritz.box>
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

please pull fixes and updates for the parisc architecture for kernel 4.19 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.19-1

Changes include:
- parisc now uses the generic dma_noncoherent_ops implementation, by Christoph Hellwig.
- further memory barrier and spinlock improvements, by John David Anglin.
- prepare removal of current_text_addr() functions, by Nick Desaulniers.
- improve kernel stack unwinding on parisc, by me.
- drop ENOTSUP which was defined on parisc only, by me.

Thanks,
Helge

----------------------------------------------------------------
Christoph Hellwig (3):
      parisc: merge pcx_dma_ops and pcxl_dma_ops
      parisc: always use flush_kernel_dcache_range for DMA cache maintainance
      parisc: use generic dma_noncoherent_ops

Helge Deller (3):
      parisc: Drop architecture-specific ENOTSUP define
      parisc: Add HAVE_REGS_AND_STACK_ACCESS_API feature
      parisc: Fix and improve kernel stack unwinding

John David Anglin (2):
      parisc: Remove ordered stores from syscall.S
      parisc: Remove unnecessary barriers from spinlock.h

Nick Desaulniers (1):
      parisc: prefer _THIS_IP_ and _RET_IP_ statement expressions

 arch/parisc/Kconfig                        |   5 +
 arch/parisc/include/asm/assembly.h         |   2 +
 arch/parisc/include/asm/dma-mapping.h      |   5 -
 arch/parisc/include/asm/linkage.h          |  17 ++-
 arch/parisc/include/asm/ptrace.h           |  11 ++
 arch/parisc/include/asm/spinlock.h         |   8 +-
 arch/parisc/include/asm/unwind.h           |   3 +
 arch/parisc/include/uapi/asm/errno.h       |   1 -
 arch/parisc/kernel/entry.S                 |  53 +++-----
 arch/parisc/kernel/pacache.S               | 125 ------------------
 arch/parisc/kernel/pci-dma.c               | 199 +++++------------------------
 arch/parisc/kernel/process.c               |   2 +-
 arch/parisc/kernel/ptrace.c                | 100 +++++++++++++++
 arch/parisc/kernel/real2.S                 |   6 -
 arch/parisc/kernel/setup.c                 |   8 +-
 arch/parisc/kernel/syscall.S               |  24 ++--
 arch/parisc/kernel/traps.c                 |   2 +-
 arch/parisc/kernel/unwind.c                |  93 ++++++++------
 arch/parisc/lib/lusercopy.S                |  21 ---
 arch/parisc/mm/init.c                      |  11 +-
 kernel/time/posix-timers.c                 |  13 +-
 tools/arch/parisc/include/uapi/asm/errno.h |   1 -
 22 files changed, 262 insertions(+), 448 deletions(-)
