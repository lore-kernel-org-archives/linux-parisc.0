From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.14
Date: Sat, 1 Feb 2014 21:23:20 +0100
Message-ID: <20140201202320.GA1313@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the latest updates for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-for-3.14

The three major changes in this patchset is a implementation for flexible
userspace memory maps, cache-flushing fixes (again), and a long-discussed ABI
change to make EWOULDBLOCK the same value as EAGAIN.

parisc has been the only platform where we had EWOULDBLOCK != EAGAIN to keep
HP-UX compatibility.  Since we will probably never implement full HP-UX
support, we prefer to drop this compatibility to make it easier for us with
Linux userspace programs which mostly never checked for both values.  We don't
expect major fall-outs because of this change, and if we face some, we will
simply rebuild the necessary applications in the debian archives.

The change to fs/exec.c only touches code which affects parisc since it's
inside a #ifdef CONFIG_STACK_GROWSUP section (and parisc is the only platform
where the stack grows upwards).

Thanks,
Helge

----------------------------------------------------------------
Guy Martin (1):
      parisc: Make EWOULDBLOCK be equal to EAGAIN on parisc

Helge Deller (5):
      parisc/sti_console: prefer Linux fonts over built-in ROM fonts
      parisc: fix cache-flushing
      parisc: add flexible mmap memory layout support
      parisc: wire up sched_setattr and sched_getattr
      parisc: convert uapi/asm/stat.h to use native types only

 arch/parisc/include/asm/cacheflush.h  |   2 -
 arch/parisc/include/asm/elf.h         |   7 +
 arch/parisc/include/asm/page.h        |   3 +-
 arch/parisc/include/asm/pgtable.h     |   1 +
 arch/parisc/include/asm/processor.h   |   2 +
 arch/parisc/include/asm/thread_info.h |  10 ++
 arch/parisc/include/uapi/asm/errno.h  |   2 +-
 arch/parisc/include/uapi/asm/stat.h   |  40 +++---
 arch/parisc/include/uapi/asm/unistd.h |   4 +-
 arch/parisc/kernel/cache.c            |  14 ++
 arch/parisc/kernel/process.c          |  21 ++-
 arch/parisc/kernel/sys_parisc.c       | 238 ++++++++++++++++++++++++++++------
 arch/parisc/kernel/syscall_table.S    |   2 +
 drivers/video/console/sticore.c       |   2 +-
 fs/exec.c                             |   3 +
 lib/fonts/Kconfig                     |   6 +-
 16 files changed, 284 insertions(+), 73 deletions(-)
