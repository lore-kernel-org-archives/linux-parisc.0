From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git patches] parisc patches for v2.6.29
Date: Fri, 9 Jan 2009 16:03:40 +0000
Message-ID: <20090109160340.GA12065@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752737AbZAIQEX@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following changes since commit fe0bdec68b77020281dc814805edfe594ae89e0f:
  Linus Torvalds (1):
        Merge branch 'audit.b61' of git://git.kernel.org/.../viro/audit-current

are available in the git repository at:

  /pub/scm/linux/kernel/git/kyle/parisc-2.6.git master

Adrian Bunk (2):
      parisc: lib/: make code static
      parisc: drivers/parisc/: make code static

FUJITA Tomonori (1):
      parisc: remove dead BIO_VMERGE_BOUNDARY and BIO_VMERGE_MAX_SIZE definitions

Harvey Harrison (1):
      parisc: use the new byteorder headers

Helge Deller (4):
      parisc: fix GFP_KERNEL use while atomic in unwinder
      parisc: trivial fixes
      parisc: Replace NR_CPUS in parisc code
      parisc: add uevent helper for parisc bus

Julia Lawall (1):
      parisc: Use DEFINE_SPINLOCK

Kyle McMartin (7):
      parisc: use leX_to_cpu in place of __fswabX
      parisc: factor out sid to protid conversion
      parisc: fix braino in commit adding __space_to_prot
      parisc: quiet palo not-found message from "which"
      parisc: fix ipv6 checksum
      parisc: fix kernel crash (protection id trap) when compiling ruby1.9
      parisc: export length of os_hpmc vector

Roel Kluin (1):
      parisc: set_time() catch errors

 arch/parisc/Makefile                  |    2 +-
 arch/parisc/include/asm/byteorder.h   |   37 ++++++------------
 arch/parisc/include/asm/checksum.h    |    2 +-
 arch/parisc/include/asm/io.h          |   12 +----
 arch/parisc/include/asm/mmu_context.h |   13 ++++--
 arch/parisc/include/asm/processor.h   |    4 +-
 arch/parisc/include/asm/uaccess.h     |    2 +
 arch/parisc/kernel/drivers.c          |   40 ++++++++++++++++---
 arch/parisc/kernel/hpmc.S             |    8 +++-
 arch/parisc/kernel/irq.c              |   11 +++--
 arch/parisc/kernel/pdc_cons.c         |    2 +-
 arch/parisc/kernel/perf.c             |    4 +-
 arch/parisc/kernel/processor.c        |   68 +++++++++++++++++----------------
 arch/parisc/kernel/setup.c            |   11 +----
 arch/parisc/kernel/smp.c              |   32 +++++++--------
 arch/parisc/kernel/time.c             |    4 +-
 arch/parisc/kernel/topology.c         |    4 +-
 arch/parisc/kernel/traps.c            |    9 +++-
 arch/parisc/kernel/unwind.c           |    2 +-
 arch/parisc/lib/iomap.c               |    2 +-
 arch/parisc/lib/memcpy.c              |    2 +-
 arch/parisc/mm/fault.c                |   58 +++++++++++++++-------------
 drivers/parisc/asp.c                  |    3 +-
 drivers/parisc/ccio-dma.c             |    4 +-
 drivers/parisc/dino.c                 |    4 +-
 drivers/parisc/hppb.c                 |    2 +-
 drivers/parisc/lasi.c                 |    5 +-
 drivers/parisc/lba_pci.c              |    2 +-
 drivers/parisc/sba_iommu.c            |    9 +---
 drivers/parisc/wax.c                  |    3 +-
 drivers/rtc/rtc-parisc.c              |    3 +-
 31 files changed, 191 insertions(+), 173 deletions(-)
