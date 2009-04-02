From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git patches] parisc patches for 2.6.30
Date: Thu, 2 Apr 2009 15:31:20 +0000
Message-ID: <20090402153115.GA15436@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kyle@mcmartin.ca
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following changes since commit 15f7176eb1cccec0a332541285ee752b935c1c85:
  Linus Torvalds (1):
        Merge git://git.kernel.org/.../davem/net-2.6

are available in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/kyle/parisc-2.6.git master

Alexander Beregalov (4):
      parisc: iosapic: fix build breakage
      parisc: led: remove proc_dir_entry::owner
      parisc: asm/pdc.h should include asm/page.h
      parisc: drivers: fix warnings

Colin Watson (1):
      parisc: expose 32/64-bit capabilities in cpuinfo

Helge Deller (10):
      parisc: fix usage of 32bit PTE page table entries on 32bit kernels
      parisc: use constants instead of numbers in assembly
      parisc: allow to build with 16k default kernel page size
      parisc: add LATENCYTOP_SUPPORT and CONFIG_STACKTRACE_SUPPORT
      parisc: simplify sys_clone()
      parisc: add ftrace (function and graph tracer) functionality
      parisc: blink all or loadavg LEDs on oops
      parisc: document light weight syscall ABI
      parisc: oops_enter()/oops_exit() in die()
      parisc: fix "make tar-pkg"

James Bottomley (1):
      parisc: fix macro expansion in atomic.h

Kyle McMartin (5):
      parisc: select BUG always
      Merge branch 'rusty-cpumask-parisc' into parisc
      parisc: fix build when ARCH_HAS_KMAP
      parisc: Move kernel Elf_Fdesc define to <asm/elf.h>
      parisc: move dereference_function_descriptor to process.c

Rusty Russell (3):
      cpumask: arch_send_call_function_ipi_mask: parisc
      cpumask: prepare for iterators to only go to nr_cpu_ids/nr_cpumask_bits.: parisc
      cpumask: Use accessors code.: parisc

 arch/parisc/Kconfig                  |   10 ++
 arch/parisc/Makefile                 |    4 +-
 arch/parisc/include/asm/atomic.h     |   18 ++--
 arch/parisc/include/asm/cacheflush.h |    3 +
 arch/parisc/include/asm/elf.h        |   10 ++
 arch/parisc/include/asm/ftrace.h     |   25 +++++
 arch/parisc/include/asm/page.h       |   13 +--
 arch/parisc/include/asm/pdc.h        |    4 +
 arch/parisc/include/asm/pgtable.h    |   15 ++-
 arch/parisc/include/asm/smp.h        |    3 +-
 arch/parisc/kernel/Makefile          |   15 +++
 arch/parisc/kernel/entry.S           |   60 +++++++++--
 arch/parisc/kernel/firmware.c        |    6 +-
 arch/parisc/kernel/ftrace.c          |  185 ++++++++++++++++++++++++++++++++++
 arch/parisc/kernel/irq.c             |    4 +-
 arch/parisc/kernel/module.c          |   18 ----
 arch/parisc/kernel/parisc_ksyms.c    |    5 +
 arch/parisc/kernel/process.c         |   29 +++---
 arch/parisc/kernel/processor.c       |   13 ++-
 arch/parisc/kernel/smp.c             |   21 ++--
 arch/parisc/kernel/stacktrace.c      |   63 ++++++++++++
 arch/parisc/kernel/syscall.S         |   58 +++++++++--
 arch/parisc/kernel/time.c            |    3 +-
 arch/parisc/kernel/traps.c           |    5 +-
 arch/parisc/kernel/vmlinux.lds.S     |    2 +
 arch/parisc/mm/init.c                |    7 ++
 drivers/parisc/asp.c                 |    2 +-
 drivers/parisc/ccio-dma.c            |   16 ++--
 drivers/parisc/dino.c                |    7 +-
 drivers/parisc/eisa.c                |    2 +-
 drivers/parisc/eisa_enumerator.c     |    4 +-
 drivers/parisc/iosapic.c             |    2 +-
 drivers/parisc/led.c                 |   26 +++--
 scripts/package/buildtar             |    4 +
 34 files changed, 540 insertions(+), 122 deletions(-)
 create mode 100644 arch/parisc/include/asm/ftrace.h
 create mode 100644 arch/parisc/kernel/ftrace.c
 create mode 100644 arch/parisc/kernel/stacktrace.c
