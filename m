From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture patches for v3.20
Date: Tue, 17 Feb 2015 21:27:16 +0100
Message-ID: <20150217202716.GA2856@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please the latest patches and fixes for the parisc architecture for kernel 3.20/4.0 from 

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.20-1

The major change in here is the removal of the old HP-UX compat code
which should have made it possible to load and execute 32-bit HP-UX
binaries on PA-RISC Linux. Since it was never functional and since
nobody cares about old 32-bit HPUX binaries any longer, it's now time to
free up 3200 lines of kernel code (CONFIG_HPUX and CONFIG_BINFMT_SOM).

Other than that we wire up the execveat() syscall, fix sparse errors and have
some whitespace cleanups.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (8):
      parisc: Wire up execveat syscall
      parisc: Add error checks when building up signal trampoline handler
      parisc: hpux - Drop support for HP-UX binaries
      parisc: hpux - Do not compile hpux subdirectory
      parisc: hpux - Delete files in hpux subdirectory
      parisc: hpux - Remove hpux gateway page
      parisc: hpux - Remove HPUX syscall numbers
      fs/binfmt_som: Drop kernel support for HP-UX SOM binaries

Michael S. Tsirkin (2):
      parisc/uaccess: fix sparse errors
      parisc: macro whitespace fixes

Rickard Strandqvist (1):
      parisc: Remove unused function

 arch/parisc/Kconfig                   |   4 -
 arch/parisc/Makefile                  |   1 -
 arch/parisc/hpux/Makefile             |   5 -
 arch/parisc/hpux/entry_hpux.S         | 546 -------------------
 arch/parisc/hpux/fs.c                 | 192 -------
 arch/parisc/hpux/gate.S               | 107 ----
 arch/parisc/hpux/ioctl.c              |  72 ---
 arch/parisc/hpux/sys_hpux.c           | 963 ----------------------------------
 arch/parisc/hpux/wrappers.S           | 250 ---------
 arch/parisc/include/asm/processor.h   |   2 -
 arch/parisc/include/asm/uaccess.h     | 116 ++--
 arch/parisc/include/uapi/asm/unistd.h | 481 +----------------
 arch/parisc/kernel/entry.S            |  20 -
 arch/parisc/kernel/process.c          |  15 +-
 arch/parisc/kernel/signal.c           |  32 +-
 arch/parisc/kernel/smp.c              |   3 -
 arch/parisc/kernel/syscall_table.S    |   1 +
 arch/parisc/mm/init.c                 |  72 ---
 fs/Kconfig.binfmt                     |   7 -
 fs/Makefile                           |   1 -
 fs/binfmt_som.c                       | 299 -----------
 include/uapi/linux/Kbuild             |   1 -
 include/uapi/linux/som.h              | 154 ------
 23 files changed, 80 insertions(+), 3264 deletions(-)
 delete mode 100644 arch/parisc/hpux/Makefile
 delete mode 100644 arch/parisc/hpux/entry_hpux.S
 delete mode 100644 arch/parisc/hpux/fs.c
 delete mode 100644 arch/parisc/hpux/gate.S
 delete mode 100644 arch/parisc/hpux/ioctl.c
 delete mode 100644 arch/parisc/hpux/sys_hpux.c
 delete mode 100644 arch/parisc/hpux/wrappers.S
 delete mode 100644 fs/binfmt_som.c
 delete mode 100644 include/uapi/linux/som.h
