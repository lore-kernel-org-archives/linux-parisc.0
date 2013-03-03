From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.9
Date: Sun, 3 Mar 2013 21:41:49 +0100
Message-ID: <20130303204149.GA28970@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

The following changes since commit b0af9cd9aab60ceb17d3ebabb9fdf4ff0a99cf50:

  Merge tag 'lzo-update-signature-20130226' of git://github.com/markus-oberhumer/linux (2013-02-28 20:45:52 -0800)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git fixes-for-3.9-latest

for you to fetch changes up to cf8e18ea2f8be26e8f9e44ed677d25f558ca301a:

  parisc: fix redefinition of SET_PERSONALITY (2013-03-02 20:15:28 +0100)

----------------------------------------------------------------

Second round of patches for the parisc architecture for Linux 3.9

The most important fix in this branch is the switch of io_setup,
io_getevents and io_submit syscalls to use the available compat
syscalls when running 32bit userspace on 64bit kernel.
Other than that it's mostly removal of compile warnings.

----------------------------------------------------------------
Helge Deller (7):
      parisc: select ARCH_WANT_FRAME_POINTERS
      parisc: switch to compat_functions of io_setup, io_getevents and io_submit
      parisc: remove unused variable 'compat_val'
      parisc: avoid unitialized variable warning in pa_memcpy()
      parisc: check return value of down_interruptible() in hp_sdc_rtc.c
      parisc: fix compile warnings triggered by atomic_sub(sizeof(),v)
      parisc: fix redefinition of SET_PERSONALITY

Rolf Eike Beer (1):
      parisc: do not install modules when installing kernel

 arch/parisc/Kconfig                |  1 +
 arch/parisc/Makefile               |  4 +---
 arch/parisc/include/asm/atomic.h   |  4 ++--
 arch/parisc/kernel/binfmt_elf32.c  |  1 +
 arch/parisc/kernel/signal.c        |  1 -
 arch/parisc/kernel/syscall_table.S |  6 +++---
 arch/parisc/lib/memcpy.c           |  2 +-
 drivers/input/misc/hp_sdc_rtc.c    | 15 ++++++++++++---
 8 files changed, 21 insertions(+), 13 deletions(-)
