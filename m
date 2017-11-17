From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for 4.15
Date: Fri, 17 Nov 2017 22:40:15 +0100
Message-ID: <20171117214015.GA23054@ls3530.fritz.box>
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

please pull parisc architecture updates for the merge window of kernel 4.15 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.15-1


Highlights:

- One important fix from Dave to prevent kernel crash when userspace hands over
  invalid values to our in-kernel CAS implementation.

- Added CPU topology support, including multi-core scheduler support on PA8900
  CPUs

Minor changes:

- Minor fixes for sparse (from Luc)

- Drop duplicates for CPU_BIG_ENDIAN from parisc and sparc top Kconfig files
  (from Babu)

- Reorganized parisc PDC (firmware-access) header files for usage from
  userspace. Required for upcoming qemu parisc emulator and SeaBIOS fork
  to support parisc.

Thanks,
Helge


----------------------------------------------------------------
Babu Moger (1):
      arch: Fix duplicates in Kconfig for parisc and sparc

Helge Deller (2):
      parisc: Add CPU topology support
      parisc: Make some PDC structures accessible in uapi headers

John David Anglin (1):
      parisc: Fix validity check of pointer size argument in new CAS implementation

Luc Van Oostenryck (1):
      parisc: Pass endianness info to sparse

 arch/parisc/Kconfig                |  19 ++-
 arch/parisc/Makefile               |   2 +-
 arch/parisc/include/asm/pdc.h      | 255 ------------------------------------
 arch/parisc/include/asm/topology.h |  36 ++++++
 arch/parisc/include/uapi/asm/pdc.h | 256 ++++++++++++++++++++++++++++++++++++-
 arch/parisc/kernel/Makefile        |   4 +-
 arch/parisc/kernel/processor.c     |  13 ++
 arch/parisc/kernel/setup.c         |   2 +
 arch/parisc/kernel/syscall.S       |   6 +-
 arch/parisc/kernel/topology.c      | 153 ++++++++++++++++++----
 arch/sparc/Kconfig                 |   3 -
 11 files changed, 452 insertions(+), 297 deletions(-)
 create mode 100644 arch/parisc/include/asm/topology.h
