From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git patches] parisc updates for 2.6.26
Date: Thu, 15 May 2008 15:37:14 +0000
Message-ID: <20080515153714.GA10374@hera.kernel.org>
Reply-To: kyle@mcmartin.ca
Mime-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Cc: kyle@mcmartin.ca, akpm@linux-foundation.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following changes since commit 492c2e476eac010962850006c49df326919b=
284c:
  Linus Torvalds (1):
        Linux 2.6.26-rc2

are available in the git repository at:

  /pub/scm/linux/kernel/git/kyle/parisc-2.6.git master

Alan Cox (1):
      parisc: new termios definitions

Harvey Harrison (2):
      parisc: replace remaining __FUNCTION__ occurrences
      drivers/parisc: replace remaining __FUNCTION__ occurrences

Helge Deller (1):
      parisc: fix trivial section name warnings

Johannes Weiner (1):
      parisc: remove redundant display of free swap space in show_mem()

Kyle McMartin (3):
      parisc: use conditional macro for 64-bit wide ops
      parisc: remove -traditional from assembler flags
      arch/parisc/kernel/perf_asm.S: build fix

Robert P. J. Day (1):
      parisc: Remove ioctl.h content picked up from <asm-generic/ioctl.=
h>.

S.=C3=87a=C4=9Flar Onur (1):
      arch/parisc/kernel/unaligned.c: use time_* macros

 arch/parisc/hpux/gate.S        |    3 +-
 arch/parisc/hpux/wrappers.S    |    3 +-
 arch/parisc/kernel/Makefile    |    3 --
 arch/parisc/kernel/entry.S     |   49 +++++++++++---------------
 arch/parisc/kernel/head.S      |    2 +-
 arch/parisc/kernel/hpmc.S      |    3 +-
 arch/parisc/kernel/inventory.c |    2 +-
 arch/parisc/kernel/pacache.S   |   73 ++++++++++++++++++++------------=
-------
 arch/parisc/kernel/perf_asm.S  |    4 ++-
 arch/parisc/kernel/real2.S     |   13 ++++---
 arch/parisc/kernel/syscall.S   |    5 ++-
 arch/parisc/kernel/traps.c     |    2 +-
 arch/parisc/kernel/unaligned.c |    5 ++-
 arch/parisc/lib/fixup.S        |    3 +-
 arch/parisc/lib/lusercopy.S    |    5 ++-
 arch/parisc/lib/memcpy.c       |    2 +-
 arch/parisc/mm/init.c          |    2 -
 drivers/parisc/asp.c           |    2 +-
 drivers/parisc/ccio-dma.c      |   36 ++++++++++----------
 drivers/parisc/dino.c          |   14 ++++----
 drivers/parisc/gsc.c           |    4 +-
 drivers/parisc/lasi.c          |    2 +-
 drivers/parisc/lba_pci.c       |   22 ++++++------
 drivers/parisc/led.c           |    2 +-
 drivers/parisc/sba_iommu.c     |   42 +++++++++++-----------
 drivers/parisc/wax.c           |    2 +-
 include/asm-parisc/assembly.h  |    6 +--
 include/asm-parisc/ioctl.h     |   51 +---------------------------
 include/asm-parisc/ioctls.h    |    4 ++
 include/asm-parisc/termbits.h  |    5 ++-
 include/asm-parisc/termios.h   |    6 ++-
 31 files changed, 167 insertions(+), 210 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
