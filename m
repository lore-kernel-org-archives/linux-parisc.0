From: Helge Deller <deller@gmx.de>
Subject: [PATCH 0/9] Add Huge Page support for parisc
Date: Fri, 20 Nov 2015 22:38:33 +0100
Message-ID: <1448055522-11594-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following patch series adds huge page (large page) support to parisc.

Both 32 and 64bit kernels are supported as long as kernel is being compiled for
PA8X00 / PA2.0 CPUs.

Helge Deller (9):
  parisc: Fix wrong comment regarding first pmd entry flags
  parisc: Drop definition of start_thread_som for HP-UX SOM binaries
  parisc: Fix asm/mman.h regarding MAP_HUGETLB and MADV_XX flags
  parisc: Add defines for Huge page support
  parisc: Initialize the fault vector earlier in the boot process.
  parisc: Increase initial kernel mapping to 32MB on 64bit kernel
  parisc: Use long branch to do_syscall_trace_exit
  parisc: Add Huge Page and HUGETLBFS support
  parisc: Map kernel text and data on huge pages

 arch/parisc/Kconfig                 |   3 +
 arch/parisc/include/asm/hugetlb.h   |  85 +++++++++++++++++++
 arch/parisc/include/asm/page.h      |  13 ++-
 arch/parisc/include/asm/pgalloc.h   |   2 +-
 arch/parisc/include/asm/pgtable.h   |  26 +++++-
 arch/parisc/include/asm/processor.h |  27 ------
 arch/parisc/include/uapi/asm/mman.h |  29 +++----
 arch/parisc/kernel/asm-offsets.c    |   8 ++
 arch/parisc/kernel/entry.S          |  56 ++++++++-----
 arch/parisc/kernel/head.S           |   4 +-
 arch/parisc/kernel/setup.c          |  14 +++-
 arch/parisc/kernel/syscall.S        |   4 +-
 arch/parisc/kernel/traps.c          |  35 ++++----
 arch/parisc/kernel/vmlinux.lds.S    |   9 +-
 arch/parisc/mm/Makefile             |   1 +
 arch/parisc/mm/hugetlbpage.c        | 162 ++++++++++++++++++++++++++++++++++++
 arch/parisc/mm/init.c               |  42 ++++------
 17 files changed, 394 insertions(+), 126 deletions(-)
 create mode 100644 arch/parisc/include/asm/hugetlb.h
 create mode 100644 arch/parisc/mm/hugetlbpage.c

-- 
2.1.0

