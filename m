From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [GIT]: parisc for 2.6.31
Date: Fri, 3 Jul 2009 05:22:20 +0000
Message-ID: <20090703052220.GA6012@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca,
	linux-kernel@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Sorry these got delayed passed -rc1, but we were tracking down a few
last minute bugs, and I wanted it to get some testing across a bunch of
different hardware. (The only reason for the new commit timestamps is I
rewrote a few of the commit messages, the patch contents are unchanged
from what's been in the parisc branch for a few weeks now.)

parisc-folks: the 'parisc' branch will get rebased after the merge, so
you'll have to manually update your local branches that follow it.

Thanks, Kyle

The following changes since commit d888a4c76c51092993643f8992bf55b3c28da483:
  Linus Torvalds (1):
        Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/vapier/blackfin

are available in the git repository at:

  hera.kernel.org:/pub/scm/linux/kernel/git/kyle/parisc-2.6.git for-linus

Alexander Beregalov (5):
      parisc: stifb: should depend on STI_CONSOLE
      parisc: ccio-dma: fix build failure without procfs
      parisc: remove CVS keywords
      parisc: decode_exc.c should include kernel.h
      parisc: superio: fix build breakage

Bastian Blank (1):
      parisc: Remove casts from atomic macros

Christoph Hellwig (1):
      parisc: remove dead code from sys_parisc32.c

Coly Li (1):
      parisc: add parameter to read_cr16()

Grant Grundler (3):
      parisc: advertise PCI devs after "assign_resources"
      parisc: Fix gcc 4.4 warning in lba_pci.c
      parisc: fix "delay!" timer handling

Helge Deller (3):
      parisc: fix ldcw inline assembler
      parisc: fix irq compile bugs in arch/parisc/kernel/irq.c
      parisc: ensure broadcast tlb purge runs single threaded

Kyle McMartin (10):
      parisc: wire up preadv/pwritev syscalls
      parisc: kill WARN in free_initmem when DEBUG_KERNEL
      parisc: wire up rt_tgsigqueueinfo
      parisc: fix compile warning in mm/init.c
      parisc: processor.c, fix bloated stack frame
      parisc: inventory.c, fix bloated stack frame
      parisc: wire sys_perf_counter_open to sys_ni_syscall
      parisc: add task_pt_regs macro
      parisc: perf: wire up sys_perf_counter_open
      parisc: use generic atomic64 on 32-bit

Matthew Wilcox (1):
      parisc: Fix PCI resource allocation on non-PAT SBA machines

Randolph Chung (1):
      parisc: fix mismatched parenthesis in memcpy.c

Thomas Gleixner (1):
      parisc: remove obsolete hw_interrupt_type

 arch/parisc/Kconfig                    |    2 +
 arch/parisc/include/asm/atomic.h       |   14 +++--
 arch/parisc/include/asm/dma.h          |    3 +-
 arch/parisc/include/asm/perf_counter.h |    7 +++
 arch/parisc/include/asm/processor.h    |    3 +
 arch/parisc/include/asm/system.h       |    4 +-
 arch/parisc/include/asm/tlbflush.h     |   14 +++---
 arch/parisc/include/asm/unistd.h       |    6 ++-
 arch/parisc/kernel/cache.c             |   26 ++++++----
 arch/parisc/kernel/inventory.c         |   41 +++++++++------
 arch/parisc/kernel/irq.c               |   10 ++--
 arch/parisc/kernel/pci-dma.c           |   12 +++--
 arch/parisc/kernel/pci.c               |    3 +-
 arch/parisc/kernel/processor.c         |   19 ++++---
 arch/parisc/kernel/setup.c             |    3 +-
 arch/parisc/kernel/sys_parisc32.c      |   62 ----------------------
 arch/parisc/kernel/syscall_table.S     |    4 ++
 arch/parisc/kernel/time.c              |   90 +++++++++++++++++++-------------
 arch/parisc/lib/checksum.c             |    2 -
 arch/parisc/lib/memcpy.c               |    2 +-
 arch/parisc/math-emu/decode_exc.c      |    2 +-
 arch/parisc/mm/fault.c                 |    3 +-
 arch/parisc/mm/init.c                  |   29 +++-------
 drivers/parisc/ccio-dma.c              |    7 ++-
 drivers/parisc/dino.c                  |   12 ++--
 drivers/parisc/eisa.c                  |    2 +-
 drivers/parisc/gsc.c                   |    4 +-
 drivers/parisc/gsc.h                   |    2 +-
 drivers/parisc/iosapic.c               |    2 +-
 drivers/parisc/lba_pci.c               |   41 ++++++++++-----
 drivers/parisc/sba_iommu.c             |    2 +
 drivers/parisc/superio.c               |    6 +-
 drivers/video/Kconfig                  |    2 +
 tools/perf/perf.h                      |    6 ++
 34 files changed, 228 insertions(+), 219 deletions(-)
 create mode 100644 arch/parisc/include/asm/perf_counter.h
