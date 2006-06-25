From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [git patches] parisc changes for 2.6.18
Date: Sun, 25 Jun 2006 19:31:23 -0400
Message-ID: <20060625233123.GC2837@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: torvalds@osdl.org,
 akpm@osdl.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

The following changes since commit f36f44de721db44b4c2944133c3c5c2e06f633f0:
  Linus Torvalds:
        Fix NFS2 compile error

are found in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/kyle/parisc-2.6.git

Carlos O'Donell:
      [PARISC] Use FIXUP_BRANCH_CLOBBER to asm clobber list
      [PARISC] Remove unconditional #define PIC in syscall macros

Grant Grundler:
      [PARISC] Fix gcc 4.1 warnings in sba_iommu.c

James Bottomley:
      [PARISC] Fix PCREL22F relocation problem for most modules
      [PARISC] Fix do_gettimeofday() hang

Kyle McMartin:
      [PARISC] Ensure all ldcw uses are ldcw,co on pa2.0
      [PARISC] Whitespace clean up in asm/pgtable.h
      [PARISC] Add asm/mckinley.h bus header
      [PARISC] Test ioc_needs_fdc variable instead of open coding
      [PARISC] Remove dead function pc_in_user_space
      [PARISC] Use MFIA in current_text_addr on pa2.0 processors
      [PARISC] Add is_compat_task() helper
      [PARISC] Remove unused macro fixup_branch in syscall.S
      [PARISC] Match show_cache_info with reality
      [PARISC] Ensure Space ID hashing is turned off
      [PARISC] OS_ID_LINUX == 0x0006
      [PARISC] Add os_id_to_string helper
      [PARISC] Refactor show_regs in traps.c

Thibaut Varene:
      [PARISC] PDC_CHASSIS is implemented on all machines
      [PARISC] Work around machines which do not support chassis warnings
      [PARISC] pdc_stable version 0.30
      [PARISC] Reduce data footprint in pdc_stable.c
      [PARISC] Update Thibaut Varene's CREDITS entry

 CREDITS                          |    4 -
 arch/parisc/kernel/cache.c       |   28 +++--
 arch/parisc/kernel/entry.S       |    6 +
 arch/parisc/kernel/firmware.c    |   46 +++++++-
 arch/parisc/kernel/module.c      |   63 +++++++++--
 arch/parisc/kernel/pdc_chassis.c |  109 ++++++++++++++-----
 arch/parisc/kernel/ptrace.c      |    8 +
 arch/parisc/kernel/real2.S       |    9 --
 arch/parisc/kernel/setup.c       |    5 +
 arch/parisc/kernel/signal.c      |   20 ++-
 arch/parisc/kernel/syscall.S     |   14 --
 arch/parisc/kernel/time.c        |   18 +++
 arch/parisc/kernel/traps.c       |   84 +++++++-------
 arch/parisc/kernel/unaligned.c   |   18 ++-
 drivers/parisc/Kconfig           |   33 ++++--
 drivers/parisc/pdc_stable.c      |  223 ++++++++++++++++++++++++++++++++++----
 drivers/parisc/sba_iommu.c       |   22 ++--
 include/asm-parisc/assembly.h    |    2 
 include/asm-parisc/compat.h      |   11 ++
 include/asm-parisc/mckinley.h    |    9 ++
 include/asm-parisc/pdc.h         |   22 +++-
 include/asm-parisc/pgtable.h     |    8 +
 include/asm-parisc/processor.h   |   14 +-
 include/asm-parisc/system.h      |   26 ++--
 include/asm-parisc/uaccess.h     |    9 +-
 include/asm-parisc/unistd.h      |    5 -
 26 files changed, 592 insertions(+), 224 deletions(-)
 create mode 100644 include/asm-parisc/mckinley.h
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
