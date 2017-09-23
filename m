From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for v4.14-rc2
Date: Sat, 23 Sep 2017 10:19:14 +0200
Message-ID: <20170923081914.GA30001@p100.box>
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

please pull fixes for the parisc architecture for kernel 4.14-rc2 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.14-2

Changelog:

- Unbreak parisc bootloader by avoiding a gcc-7 optimization to convert
  multiple byte-accesses into one word-access.

- Add missing HWPOISON page fault handler code. I completely missed that when I
  added HWPOISON support during this merge window and it only showed up now
  with the madvise07 LTP test case.

- Fix backtrace unwinding to stop when stack start has been reached.

- Issue warning if initrd has been loaded into memory regions with broken RAM
  modules.

- Fix HPMC handler (parisc hardware fault handler) to comply with architecture
  specification.

- Avoid compiler warnings about too large frame sizes.

- Minor init-section fixes.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (10):
      parisc: Fix too large frame size warnings
      parisc: Stop unwinding at start of stack
      parisc: Move start_parisc() into init section
      parisc: Add wrapper for pdc_instr() firmware function
      parisc: Add PDCE_CHECK instruction to HPMC handler
      parisc: Check if initrd was loaded into broken RAM
      parisc: Move init_per_cpu() into init section
      parisc: Add HWPOISON page fault handler code
      parisc: Reintroduce option to gzip-compress the kernel
      parisc: Unbreak bootloader due to gcc-7 optimizations

 arch/parisc/Kconfig                  | 12 ++++++++++++
 arch/parisc/Makefile                 |  5 +++++
 arch/parisc/boot/compressed/Makefile |  2 +-
 arch/parisc/boot/compressed/misc.c   |  3 ++-
 arch/parisc/include/asm/pdc.h        |  1 +
 arch/parisc/include/asm/smp.h        |  1 +
 arch/parisc/kernel/firmware.c        | 20 ++++++++++++++++++++
 arch/parisc/kernel/pdt.c             |  9 +++++++++
 arch/parisc/kernel/processor.c       |  2 +-
 arch/parisc/kernel/setup.c           |  6 +++---
 arch/parisc/kernel/smp.c             |  3 +--
 arch/parisc/kernel/traps.c           | 10 +++++++++-
 arch/parisc/kernel/unwind.c          | 12 ++++++++++++
 arch/parisc/mm/fault.c               | 33 +++++++++++++++++++++++++++++----
 lib/Kconfig.debug                    |  3 ++-
 15 files changed, 108 insertions(+), 14 deletions(-)

