From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.12-rc5
Date: Sun, 13 Oct 2013 18:11:30 +0200
Message-ID: <20131013161130.GA19534@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Please pull the latest parisc fixes from

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.12

This patchset includes a bugfix to prevent a kernel crash when memory in
page zero is accessed by the kernel itself, e.g. via
probe_kernel_read(). Furthermore we now export flush_cache_page() which
is needed (indirectly) by the lustre filesystem.  The other patches
remove unused functions and optimizes the page fault handler to only
evaluate variables if needed, which again protects against possible
kernel crashes.

Thanks,
Helge

----------------------------------------------------------------
Geert Uytterhoeven (1):
      parisc: Export flush_cache_page() (needed by lustre)

Helge Deller (4):
      parisc: remove unused syscall_ipi() function.
      parisc: mark parisc_terminate() noreturn and cold.
      parisc: fix interruption handler to respect pagefault_disable()
      parisc: let probe_kernel_read() capture access to page zero

Jiang Liu (1):
      parisc: kill SMP single function call interrupt

John David Anglin (1):
      parisc: optimize variable initialization in do_page_fault

 arch/parisc/include/asm/traps.h |  2 +-
 arch/parisc/kernel/cache.c      |  1 +
 arch/parisc/kernel/smp.c        |  8 +-------
 arch/parisc/kernel/traps.c      | 11 +++--------
 arch/parisc/lib/memcpy.c        | 15 ++++++++++++++-
 arch/parisc/mm/fault.c          | 15 ++++++++++-----
 6 files changed, 30 insertions(+), 22 deletions(-)
