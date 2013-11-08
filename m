From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.13
Date: Fri, 8 Nov 2013 23:05:58 +0100
Message-ID: <20131108220558.GA1531@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Please pull the parisc architecture updates for 3.13-rc1 from

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.13

which contains the following main features:

- a bugfix for sticon (parisc text console driver) to not crash the
  64bit kernel on machines with more than 4GB RAM
- added kernel audit support
- made udelay() implementation SMP-safe
- "make install" now does not depend on vmlinux
- added defconfigs for 32- and 64-kernels

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (10):
      parisc: provide macro to create exception table entries
      parisc: add kernel audit feature
      parisc: make "make install" not depend on vmlinux
      parisc: make udelay() SMP-safe
      parisc: do not count IPI calls twice
      parisc: correctly display number of active CPUs
      parisc: implement full version of access_ok()
      parisc: signal fixup - SIGBUS vs. SIGSEGV
      parisc: sticon - unbreak on 64bit kernel
      parisc: add generic 32- and 64-bit defconfigs

Michael Opdenacker (1):
      parisc: remove duplicate define

 arch/parisc/Kconfig                         |   3 +
 arch/parisc/Makefile                        |  22 +-
 arch/parisc/configs/generic-32bit_defconfig | 328 ++++++++++++++++++++++++++
 arch/parisc/configs/generic-64bit_defconfig | 346 ++++++++++++++++++++++++++++
 arch/parisc/include/asm/assembly.h          |  12 +
 arch/parisc/include/asm/delay.h             |  41 +---
 arch/parisc/include/asm/hardirq.h           |   1 -
 arch/parisc/include/asm/ptrace.h            |   4 +
 arch/parisc/include/asm/thread_info.h       |   4 +-
 arch/parisc/include/asm/uaccess.h           |  53 ++++-
 arch/parisc/install.sh                      |  44 +++-
 arch/parisc/kernel/Makefile                 |   4 +-
 arch/parisc/kernel/audit.c                  |  81 +++++++
 arch/parisc/kernel/compat_audit.c           |  40 ++++
 arch/parisc/kernel/irq.c                    |   4 -
 arch/parisc/kernel/ptrace.c                 |  26 ++-
 arch/parisc/kernel/setup.c                  |   8 +-
 arch/parisc/kernel/smp.c                    |   5 -
 arch/parisc/kernel/syscall.S                |   6 +-
 arch/parisc/lib/Makefile                    |   2 +-
 arch/parisc/lib/delay.c                     |  73 ++++++
 arch/parisc/lib/lusercopy.S                 |  10 +-
 arch/parisc/math-emu/float.h                |   1 -
 arch/parisc/mm/fault.c                      |  24 +-
 drivers/video/console/sticore.c             | 166 ++++++++-----
 drivers/video/sticore.h                     |  62 ++++-
 drivers/video/stifb.c                       |  10 +-
 init/Kconfig                                |   2 +-
 28 files changed, 1214 insertions(+), 168 deletions(-)
 create mode 100644 arch/parisc/configs/generic-32bit_defconfig
 create mode 100644 arch/parisc/configs/generic-64bit_defconfig
 create mode 100644 arch/parisc/kernel/audit.c
 create mode 100644 arch/parisc/kernel/compat_audit.c
 create mode 100644 arch/parisc/lib/delay.c
