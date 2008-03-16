From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [git patches] parisc bug fixes for 2.6.25
Date: Sun, 16 Mar 2008 13:35:39 -0400
Message-ID: <20080316173539.GA3904@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following changes since commit cdeeeae056a429e729ae9e914fa8142ee45bee93:
  Linus Torvalds (1):
        Linux 2.6.25-rc5

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git master

Adrian Bunk (1):
      [PARISC] move defconfig to arch/parisc/configs/

FUJITA Tomonori (1):
      [PARISC] make ptr_to_pide() static

Helge Deller (1):
      [PARISC] head.S: section mismatch fixes

James Bottomley (1):
      [PARISC] add pa8900 CPUs to hardware inventory

Joel Soete (1):
      [PARISC] pdc_stable: fix compile errors

Kyle McMartin (11):
      [PARISC] remove old timerfd syscall
      [PARISC] wire up timerfd syscalls
      [PARISC] move VMALLOC_* definitions to fixmap.h
      [PARISC] unbreak pgalloc.h
      [PARISC] bump __NR_syscalls
      [PARISC] remove unused pdc_iodc_printf function
      [PARISC] dump_stack in show_regs
      [PARISC] pdc_console: fix bizarre panic on boot
      [PARISC] clean up show_stack
      [PARISC] futex: special case cmpxchg NULL in kernel space
      [PARISC] add back Crestone Peak cpu

Randolph Chung (1):
      [PARISC] clean up include/asm-parisc/elf.h

Thibaut VARENE (1):
      [PARISC] add back AD1889 MAINTAINERS entry

 MAINTAINERS                                        |    9 ++++++
 arch/parisc/Makefile                               |    3 ++
 .../{defconfig => configs/default_defconfig}       |    0 
 arch/parisc/kernel/firmware.c                      |   27 +++++++++++------
 arch/parisc/kernel/hardware.c                      |   13 ++++++++-
 arch/parisc/kernel/head.S                          |    7 ++--
 arch/parisc/kernel/pdc_cons.c                      |   30 ++++++++++---------
 arch/parisc/kernel/syscall_table.S                 |    5 ++-
 arch/parisc/kernel/traps.c                         |   25 ++++++++++++++--
 drivers/parisc/pdc_stable.c                        |    6 ++--
 drivers/parisc/sba_iommu.c                         |    4 +-
 include/asm-parisc/elf.h                           |   22 ++++++--------
 include/asm-parisc/fixmap.h                        |    9 +++++-
 include/asm-parisc/futex.h                         |   10 +++++-
 include/asm-parisc/pdc.h                           |    3 +-
 include/asm-parisc/pgalloc.h                       |    4 +-
 include/asm-parisc/pgtable.h                       |    8 -----
 include/asm-parisc/unistd.h                        |    5 ++-
 18 files changed, 125 insertions(+), 65 deletions(-)
 rename arch/parisc/{defconfig => configs/default_defconfig} (100%)
