From: Kyle McMartin <kyle@hera.kernel.org>
Subject: what's in parisc-2.6.git
Date: Tue, 23 Jun 2009 16:15:16 +0000
Message-ID: <20090623161516.GA12499@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit mail seems to be broken again for some reason...

The following changes since commit d888a4c76c51092993643f8992bf55b3c28da483:
  Linus Torvalds (1):
        Merge branch 'for-linus' of git://git.kernel.org/.../vapier/blackfin

are available in the git repository at:

  /pub/scm/linux/kernel/git/kyle/parisc-2.6.git parisc

Alexander Beregalov (4):
      parisc: stifb: should depend on STI_CONSOLE
      parisc: ccio-dma: fix build failure without procfs
      parisc: remove CVS keywords
      parisc: decode_exc.c should include kernel.h

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

Kyle McMartin (4):
      parisc: wire up preadv/pwritev syscalls
      parisc: kill WARN in free_initmem when DEBUG_KERNEL
      parisc: wire up rt_tgsigqueueinfo
      parisc: fix compile warning in mm/init.c

Randolph Chung (1):
      parisc: fix mismatched parenthesis in memcpy.c

Thomas Gleixner (1):
      parisc: remove obsolete hw_interrupt_type

 arch/parisc/include/asm/atomic.h   |    8 ++--
 arch/parisc/include/asm/dma.h      |    3 +-
 arch/parisc/include/asm/system.h   |    4 +-
 arch/parisc/include/asm/tlbflush.h |   14 +++---
 arch/parisc/include/asm/unistd.h   |    5 ++-
 arch/parisc/kernel/cache.c         |   26 ++++++----
 arch/parisc/kernel/irq.c           |   10 ++--
 arch/parisc/kernel/pci-dma.c       |   12 +++--
 arch/parisc/kernel/pci.c           |    3 +-
 arch/parisc/kernel/processor.c     |    3 +-
 arch/parisc/kernel/setup.c         |    3 +-
 arch/parisc/kernel/sys_parisc32.c  |   62 ------------------------
 arch/parisc/kernel/syscall_table.S |    3 +
 arch/parisc/kernel/time.c          |   90 +++++++++++++++++++++--------------
 arch/parisc/lib/checksum.c         |    2 -
 arch/parisc/lib/memcpy.c           |    2 +-
 arch/parisc/math-emu/decode_exc.c  |    2 +-
 arch/parisc/mm/fault.c             |    3 +-
 arch/parisc/mm/init.c              |   29 ++++--------
 drivers/parisc/ccio-dma.c          |    7 ++-
 drivers/parisc/dino.c              |   12 ++--
 drivers/parisc/eisa.c              |    2 +-
 drivers/parisc/gsc.c               |    4 +-
 drivers/parisc/gsc.h               |    2 +-
 drivers/parisc/iosapic.c           |    2 +-
 drivers/parisc/lba_pci.c           |   41 +++++++++++------
 drivers/parisc/superio.c           |    2 +-
 drivers/video/Kconfig              |    2 +
 28 files changed, 164 insertions(+), 194 deletions(-)
