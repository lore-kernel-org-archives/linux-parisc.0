From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.14
Date: Sun, 23 Mar 2014 22:02:19 +0100
Message-ID: <20140323210219.GA15854@p100.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please consider pulling some late patches for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.14

This patchset 
- reverts parts of my latest patch regarding font selection with STICON console,
- wires up the utimes() syscall for parisc, and
- removes the unused parisc tmpalias code and unnecessary arch*relax defines

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (2):
      partly revert commit 8a10bc9: parisc/sti_console: prefer Linux fonts over built-in ROM fonts
      parisc: wire up sys_utimes

John David Anglin (1):
      parisc: Remove unused CONFIG_PARISC_TMPALIAS code

Will Deacon (1):
      parisc: locks: remove redundant arch_*_relax operations

 arch/parisc/include/asm/page.h        | 11 ------
 arch/parisc/include/asm/spinlock.h    |  4 ---
 arch/parisc/include/uapi/asm/unistd.h |  4 +--
 arch/parisc/kernel/cache.c            | 64 -----------------------------------
 arch/parisc/kernel/syscall_table.S    |  1 +
 lib/fonts/Kconfig                     |  6 ++--
 6 files changed, 6 insertions(+), 84 deletions(-)
