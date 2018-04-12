From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for 4.17-rc1
Date: Thu, 12 Apr 2018 20:41:01 +0200
Message-ID: <20180412184101.GA20775@ls3530.fritz.box>
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

please pull a few last changes for this merge window for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.17-2

Changes:
- Fix panic when halting system via "shutdown -h now"
- Drop own coding in favour of generic CONFIG_COMPAT_BINFMT_ELF implementation
- Add FPE_CONDTRAP constant: last outstanding parisc-specific cleanup for Eric
  Biedermans siginfo patches
- move some functions to .init and some to .text.hot linker sections

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (4):
      parisc/signal: Add FPE_CONDTRAP for conditional trap handling
      parisc: Move cache flush functions into .text.hot section
      parisc: Switch to generic COMPAT_BINFMT_ELF
      parisc: Prevent panic at system halt

 arch/parisc/Kconfig                    |  1 +
 arch/parisc/include/asm/compat.h       |  6 +++
 arch/parisc/include/asm/elf.h          | 69 ++++++++++++------------
 arch/parisc/include/uapi/asm/siginfo.h |  7 ---
 arch/parisc/kernel/binfmt_elf32.c      | 98 ----------------------------------
 arch/parisc/kernel/cache.c             |  2 +-
 arch/parisc/kernel/pacache.S           |  9 ++--
 arch/parisc/kernel/process.c           | 13 ++---
 arch/parisc/kernel/traps.c             |  7 +--
 arch/x86/kernel/signal_compat.c        |  2 +-
 include/uapi/asm-generic/siginfo.h     |  3 +-
 11 files changed, 60 insertions(+), 157 deletions(-)
 delete mode 100644 arch/parisc/kernel/binfmt_elf32.c
