From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes and updates for kernel v4.19
Date: Wed, 22 Aug 2018 21:35:17 +0200
Message-ID: <20180822193517.GA31476@ls3530.fritz.box>
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

please pull the second round of fixes and updates in this merge window
for the parisc architecture for kernel 4.19 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.19-2

Changes:
- fix boot failure of 64-bit kernel. It got broken by the unwind
  optimization commit in merge window.
- fix 64-bit userspace support (static 64-bit applications only, e.g. we
  don't yet have 64-bit userspace support in glibc).
- consolidate unwind initialization code.
- add machine model description to stack trace.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (6):
      parisc: Restore possibility to execute 64-bit applications
      parisc: Fix ptraced 64-bit applications to call 64-bit syscalls
      parisc: Update comments in syscall.S regarding wide userland
      parisc: Consolidate unwind initialization calls
      parisc: Fix boot failure of 64-bit kernel
      parisc: Add hardware description to stack traces

 arch/parisc/include/asm/elf.h       |  9 +++--
 arch/parisc/include/asm/linkage.h   |  9 -----
 arch/parisc/include/asm/processor.h |  6 +--
 arch/parisc/include/asm/traps.h     |  4 +-
 arch/parisc/include/asm/unwind.h    |  6 ++-
 arch/parisc/kernel/entry.S          | 79 ++++++++++++++++++-------------------
 arch/parisc/kernel/processor.c      |  2 +
 arch/parisc/kernel/stacktrace.c     | 15 +------
 arch/parisc/kernel/sys_parisc.c     |  5 ---
 arch/parisc/kernel/syscall.S        | 35 +++++++++-------
 arch/parisc/kernel/traps.c          | 37 +++--------------
 arch/parisc/kernel/unwind.c         | 43 ++++++++++++++------
 12 files changed, 113 insertions(+), 137 deletions(-)
