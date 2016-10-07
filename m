From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for v4.9-rc1
Date: Fri, 7 Oct 2016 19:04:07 +0200
Message-ID: <20161007170407.GA13520@p100.box>
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

please pull the updates for 4.9-rc1 for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.9-1

Changes include:
 
- Fix boot of 32bit SMP kernel (initial kernel mapping was too small)

- Added hardened usercopy checks

- Drop bootmem and switch to memblock and NO_BOOTMEM implementation

- Drop the BROKEN_RODATA config option (and thus remove the relevant code from
  the generic headers and files because parisc was the last architecture which
  used this config option)

- Improve segfault reporting by printing human readable error strings

- Various smaller changes, e.g. dwarf debug support for assembly code, update
  comments regarding copy_user_page_asm, switch to kmalloc_array()

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (9):
      parisc: Drop BROKEN_RODATA config option
      parisc: Check return value of smp_boot_one_cpu()
      parisc: Report trap type as human readable string
      parisc: Fix self-detected CPU stall warnings on Mako machines
      parisc: Move hpmc stack into page aligned bss section
      parisc: Add cfi_startproc and cfi_endproc to assembly code
      parisc: Add hardened usercopy feature
      parisc: Drop bootmem and switch to memblock
      parisc: Increase KERNEL_INITIAL_SIZE for 32-bit SMP kernels

John David Anglin (1):
      parisc: Update comment regarding implementation of copy_user_page_asm

Markus Elfring (1):
      parisc: Use kmalloc_array() in add_system_map_addresses()

 arch/parisc/Kconfig               |   4 +-
 arch/parisc/include/asm/dwarf.h   |  23 +++++++
 arch/parisc/include/asm/linkage.h |  12 ++++
 arch/parisc/include/asm/pgtable.h |   2 +-
 arch/parisc/include/asm/uaccess.h |  48 ++++++++++-----
 arch/parisc/kernel/entry.S        |  46 +++++++-------
 arch/parisc/kernel/hpmc.S         |  16 +++--
 arch/parisc/kernel/inventory.c    |   2 +-
 arch/parisc/kernel/pacache.S      |  84 +++++++++++++------------
 arch/parisc/kernel/real2.S        |  24 +++++---
 arch/parisc/kernel/setup.c        |   8 +++
 arch/parisc/kernel/smp.c          |   4 +-
 arch/parisc/kernel/time.c         |   6 --
 arch/parisc/kernel/vmlinux.lds.S  |   2 -
 arch/parisc/lib/fixup.S           |  16 ++---
 arch/parisc/lib/lusercopy.S       |   8 +--
 arch/parisc/lib/memcpy.c          |  11 ++--
 arch/parisc/mm/fault.c            |  48 ++++++++++++++-
 arch/parisc/mm/init.c             | 126 +++++++++++++++++++-------------------
 include/linux/init.h              |  19 ++----
 init/Kconfig                      |   6 --
 21 files changed, 308 insertions(+), 207 deletions(-)
 create mode 100644 arch/parisc/include/asm/dwarf.h
