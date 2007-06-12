From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [git patches] parisc updates for 2.6.22
Date: Tue, 12 Jun 2007 01:50:46 -0400
Message-ID: <20070612055046.GA24425__12178.4887662672$1416624396$gmane$org@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@linux-foundation.org,
 parisc-linux@lists.parisc-linux.org
To: torvalds@linux-foundation.org
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

Mostly "critical" (if you can call anything on arch/parisc critical)
bugfixes against 2.6.21 that took me a while to find the time to fix up.

Thanks,
	Kyle M.

The following changes since commit d25790532370e7448e3d3bd25a17e1e9f1299816:
  Stephen Rothwell (1):
        Fix headers check fallout

are available in the git repository at:

 master.kernel.org:/pub/scm/linux/kernel/git/kyle/parisc-2.6.git
 
Alexandr Andreev (1):
      parisc: sync compat getdents

Alexey Dobriyan (2):
      parisc: make command_line[] static
      parisc: convert /proc/gsc/pcxl_dma to seq_file

Aurelien Jarno (1):
      [PARISC] Disable LWS debugging

Grant Grundler (2):
      [PARISC] remove remnants of parisc-specific softirq code
      [PARISC] remove global_ack_eiem

Helge Deller (10):
      [PARISC] fix lasi_82596 build
      [PARISC] fix section mismatch in parport_gsc
      [PARISC] fix section mismatch in parisc STI video drivers
      [PARISC] fix section mismatch in ccio-dma
      [PARISC] fix section mismatches in arch/parisc/kernel
      [PARISC] fix section mismatch in parisc eisa driver
      [PARISC] fix section mismatch in superio serial drivers
      [PARISC] Wire up utimensat/signalfd/timerfd/eventfd syscalls
      [PARISC] fix "ENTRY" macro redefinition
      [PARISC] fix section mismatch in smp.c

Kyle McMartin (11):
      [PARISC] Move #undef to end of syscall table
      [PARISC] Wire up kexec_load syscall
      [PARISC] Let PA-8900 processors boot
      [PARISC] kobject is embedded in subsys, not kset
      [PARISC] Build fixes for power.c
      [PARISC] fix trivial spelling nit in asm/linkage.h
      [PARISC] fix null ptr deref in unwind.c
      [PARISC] fix "reduce size of task_struct on 64-bit machines" fallout
      [PARISC] be more defensive in process.c::get_wchan
      [PARISC] Fix bug when syscall nr is __NR_Linux_syscalls
      [PARISC] Fix kernel panic in check_ivt

Milind Arun Choudhary (2):
      [PARISC] ROUND_UP macro cleanup in arch/parisc
      [PARISC] ROUNDUP macro cleanup in drivers/parisc

Simon Arlott (1):
      [PARISC] spelling fixes: arch/parisc/

 arch/parisc/hpux/fs.c              |    5 +-
 arch/parisc/kernel/entry.S         |   40 +--------------
 arch/parisc/kernel/firmware.c      |    4 +-
 arch/parisc/kernel/hardware.c      |   14 +++--
 arch/parisc/kernel/hpmc.S          |    5 +--
 arch/parisc/kernel/irq.c           |   26 +++-------
 arch/parisc/kernel/pci-dma.c       |   94 ++++++++++++++++++++----------------
 arch/parisc/kernel/perf.c          |   18 ++++---
 arch/parisc/kernel/process.c       |    4 ++
 arch/parisc/kernel/processor.c     |   14 +++---
 arch/parisc/kernel/setup.c         |    5 +-
 arch/parisc/kernel/signal32.h      |    2 +-
 arch/parisc/kernel/smp.c           |    8 ++--
 arch/parisc/kernel/sys_parisc32.c  |   13 ++++--
 arch/parisc/kernel/syscall.S       |   12 ++--
 arch/parisc/kernel/syscall_table.S |   16 ++++--
 arch/parisc/kernel/time.c          |    2 +-
 arch/parisc/kernel/traps.c         |    9 ++--
 arch/parisc/kernel/unwind.c        |    4 +-
 arch/parisc/math-emu/dbl_float.h   |    4 +-
 arch/parisc/math-emu/dfsqrt.c      |    2 +-
 arch/parisc/math-emu/sfsqrt.c      |    2 +-
 arch/parisc/math-emu/sgl_float.h   |    4 +-
 arch/parisc/mm/init.c              |   10 ++--
 drivers/net/lasi_82596.c           |    1 +
 drivers/parisc/ccio-dma.c          |   14 +++---
 drivers/parisc/eisa.c              |    4 +-
 drivers/parisc/iommu-helpers.h     |    4 +-
 drivers/parisc/pdc_stable.c        |    2 +-
 drivers/parisc/power.c             |    1 +
 drivers/parisc/sba_iommu.c         |    6 +--
 drivers/parisc/superio.c           |    8 ++--
 drivers/parport/parport_gsc.c      |    2 +-
 drivers/video/console/sticore.c    |   50 ++++++++++----------
 include/asm-parisc/hardware.h      |    5 +-
 include/asm-parisc/linkage.h       |    5 ++-
 include/asm-parisc/processor.h     |    8 ++--
 include/asm-parisc/unistd.h        |   13 +++++-
 38 files changed, 221 insertions(+), 219 deletions(-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
