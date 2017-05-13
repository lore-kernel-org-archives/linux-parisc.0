From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for 4.12
Date: Sat, 13 May 2017 16:16:27 +0200
Message-ID: <20170513141627.GA31019@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull fixes and enhancements for the parisc architecture for kernel 4.12 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.12-1

We added initial support for the Page Deallocation Table (PDT) which is
maintained by firmware and holds the list of memory addresses which have
physical errors.  By checking that list we can instruct Linux to not include
such bad memory regions into the free memory list.

Additionally we improved the detection of CPUs where the internal cr16
cycle clocks are synchronous and as such can be used as high-resolution
clock sources. 

The third enhancement is that we shut down secondary CPUs via firmware before
entering system shutdown or reboot.

The last two patches are trivial and drop unused code and simplify code.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (5):
      parisc: Inline trivial exception code in lusercopy.S
      parisc: Drop per_cpu uaccess related exception_data struct
      parisc: Enhance detection of synchronous cr16 clocksources
      parisc: Add Page Deallocation Table (PDT) support
      parisc: Stop CPUs via PAT firmware before system halt or reboot.

 arch/parisc/include/asm/pdc.h       |  18 +++++
 arch/parisc/include/asm/pdcpat.h    |  36 ++++++---
 arch/parisc/include/asm/pgtable.h   |   3 +
 arch/parisc/include/asm/processor.h |   2 +
 arch/parisc/include/asm/uaccess.h   |  11 ---
 arch/parisc/include/uapi/asm/pdc.h  |  12 +--
 arch/parisc/kernel/Makefile         |   2 +-
 arch/parisc/kernel/asm-offsets.c    |   5 --
 arch/parisc/kernel/firmware.c       | 130 ++++++++++++++++++++++++++++++++
 arch/parisc/kernel/inventory.c      |   9 +++
 arch/parisc/kernel/pdt.c            | 143 ++++++++++++++++++++++++++++++++++++
 arch/parisc/kernel/process.c        |  18 ++++-
 arch/parisc/kernel/processor.c      |   5 +-
 arch/parisc/kernel/smp.c            |   3 +
 arch/parisc/kernel/time.c           |  24 +++++-
 arch/parisc/lib/lusercopy.S         |  25 +++----
 arch/parisc/mm/fault.c              |   9 ---
 arch/parisc/mm/init.c               |   3 +
 18 files changed, 393 insertions(+), 65 deletions(-)
 create mode 100644 arch/parisc/kernel/pdt.c
