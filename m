From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] Merge status update
Date: Sat, 29 Oct 2005 15:10:09 -0400
Message-ID: <20051029191009.GA6475@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
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

Hi,

As many of you noticed, Linus pulled my git tree and a whole big chunk of
our diff went upstream on Friday. This email is just a quick note to let
everyone know what got pulled, and how much further we have to go to
mainline, as well as what will go next.

Status:

344K    linus_to_parisc_1.diff
460K    patch-2.6.14-pa0
------------------------------
116K	remaining

Remaining chunks is approximately:
	5K 	ad1889		<- I will handle
	24K	sym53c8xx	<- willy will handle
	27K	compat
	7.3K	opl3
	20K	oss harmony & ad1889	<- will remove oss ad1889
	2K	misc
	4K	tulip
	--------------
	~89K accounted for

The rest is approximately what has been committed since I took a snapshot
of the diff for splitting up. I intend to now track CVS commits 
approximately as they happen, with manual quality control.

The plan I have in my head right now is to have a git tree of parisc
specific things that Linus can constantly pull from, a git tree of
compat related things, and a third parisc-linux tree, which will merge
the other two, and have other modifications that probably shouldn't
go upstream. The goal is to have something I can build kernels out of
for all my machines.

A note on commits; please make it really clear who should get credit
for things if you're committing a patch from someone else. I had a bit
of difficulty tracking down who did "the most work" on some commits,
apologies if anyone feels neglected.

Please also try to seperate out commits that modify architecture
independent code from parisc related commits. This will make it much
easier for me to split out what needs to go where when I go to merge.

Cheers,
	Kyle

I've appended the shortlog and diffstat from what Linus merged:

Carlos O'Donell:
  [PARISC] Implement 5 argument clone.

Grant Grundler:
  [PARISC] Update sba_iommu from parisc tree
  [PARISC] Update ccio-dma from parisc tree
  [PARISC] Allow STI_CONSOLE access to some FONTS
  [PARISC] Make sure use of RFI conforms to PA 2.0 and 1.1 arch docs
  [PARISC] Move pa_tlb_lock to tlb_flush.h
  [PARISC] Update bitops from parisc tree
  [PARISC] Use work queue in LED/LCD driver instead of tasklet.
  [PARISC] Replace uses of __LP64__ with CONFIG_64BIT
  [PARISC] Minor iosapic.c cleanup
  [PARISC] Add sync required after fdc to enforce insn ordering
  [PARISC] More informative error message in pcibios_link_hba_resources
  [PARISC] Cleanup whitespace and handle proc_mkdir() failures in pci-dma.c
  [PARISC] Document history of PDC_NARROW as it is now obsolete
  [PARISC] Update Kconfig for itimer selection
  [PARISC] Add ECANCELED to errno.h
  [PARISC] Define pgprot_noncached macro in pgtable.h
  [PARISC] Fix copy_user_page_asm to NOT access past end of page
  [PARISC] Properly specify index field to I/D cache flush ops
  [PARISC] Specify level to fix binutils level promotion bug
  [PARISC] Properly specify section alignment for real2.S

James Bottomley:
  [PARISC] Fix the alloc_slabmgmt panic
  [PARISC] Remove the spurious do_softirq calls from entry.S

Jens Axboe:
  [PARISC] Add new ioprio_{set,get} syscalls

Jesper Juhl:
  [PARISC] kfree cleanups to ioctl32.c

Kyle McMartin:
  [PARISC] Add ability for prctl to change unaligned trap behaviour
  [PARISC] Initialize serial spinlocks in superio.c
  [PARISC] Add other CRT_ID for newer cards to grfioctl.h
  [PARISC] defconfig updates
  [PARISC] Update MAINTAINERS and CREDITS

Matthew Wilcox:
  [PARISC] Convert parisc_device tree to use struct device klists
  [PARISC] Change the driver names so /sys/bus/parisc/drivers/ looks better
  [PARISC] Convert parisc_device to use struct resource for hpa
  [PARISC] Update dino from parisc tree
  [PARISC] Update spinlocks from parisc tree
  [PARISC] Reorganize sticore probe routine to be a little less convoluted
  [PARISC] Fix compile warning in pci.h
  [PARISC] Update pdc console from parisc tree
  [PARISC] Explicitly specify sr4 when flushing kernel space
  [PARISC] Update scsi drivers from parisc tree
  [PARISC] Fix mux.c driver
  [PARISC] Update parisc specific input code from parisc tree

Randolph Chung:
  [PARISC] Take into account nullified insn and lock functions for profiling
  [PARISC] Replace some calls to bl with b,l or bv to use longer offsets
  [PARISC] Disable use of fpregs in pa_memcpy
  [PARISC] Prevent signal loops if we have a problem setting up a frame
  [PARISC] Update minimum compiler version and CROSS_COMPILE for parisc64
  [PARISC] Avoid use of floating point in the kernel

Stuart Brady:
  [PARISC] Update harmony from parisc tree
  [PARISC] Fix parisc_setup_cache_timing to choose a better flush threshold

Sven Schnelle:
  [PARISC] Add NETPOLL support to lasi_82596

Thibaut Varene:
  [PARISC] Add printing of fpregs state to stack dump

 CREDITS                             |    6 
 MAINTAINERS                         |    9 
 arch/parisc/Kconfig                 |    5 
 arch/parisc/Makefile                |   13 
 arch/parisc/configs/712_defconfig   |  456 ++++++++++++++----------
 arch/parisc/configs/a500_defconfig  |  551 +++++++++++++++++------------
 arch/parisc/configs/b180_defconfig  |  309 ++++++++++------
 arch/parisc/configs/c3000_defconfig |  676 +++++++++++++++++++++++-------------
 arch/parisc/defconfig               |  618 ++++++++++++++++++++++++--------
 arch/parisc/kernel/cache.c          |   10 
 arch/parisc/kernel/drivers.c        |  273 +++++++++-----
 arch/parisc/kernel/entry.S          |  188 ++++------
 arch/parisc/kernel/firmware.c       |   18 
 arch/parisc/kernel/head.S           |   73 +--
 arch/parisc/kernel/ioctl32.c        |   32 -
 arch/parisc/kernel/pacache.S        |  186 +++++----
 arch/parisc/kernel/pci-dma.c        |   48 +-
 arch/parisc/kernel/pci.c            |    3 
 arch/parisc/kernel/pdc_cons.c       |   46 --
 arch/parisc/kernel/perf.c           |   12 
 arch/parisc/kernel/process.c        |   34 +
 arch/parisc/kernel/processor.c      |    8 
 arch/parisc/kernel/real2.S          |   36 -
 arch/parisc/kernel/signal.c         |   22 -
 arch/parisc/kernel/smp.c            |    2 
 arch/parisc/kernel/syscall.S        |   37 -
 arch/parisc/kernel/syscall_table.S  |   10 
 arch/parisc/kernel/time.c           |   26 -
 arch/parisc/kernel/traps.c          |   37 +
 arch/parisc/kernel/unaligned.c      |   16 
 arch/parisc/lib/fixup.S             |    4 
 arch/parisc/lib/memcpy.c            |    2 
 drivers/input/keyboard/hil_kbd.c    |   28 +
 drivers/input/keyboard/hilkbd.c     |    8 
 drivers/input/mouse/hil_ptr.c       |   33 +
 drivers/input/serio/gscps2.c        |   17 
 drivers/input/serio/hil_mlc.c       |   14 
 drivers/input/serio/hp_sdc.c        |    8 
 drivers/net/lasi_82596.c            |   30 +
 drivers/parisc/asp.c                |    6 
 drivers/parisc/ccio-dma.c           |  142 ++++---
 drivers/parisc/ccio-rm-dma.c        |    2 
 drivers/parisc/dino.c               |   42 +-
 drivers/parisc/eisa.c               |    4 
 drivers/parisc/gsc.c                |   11 
 drivers/parisc/hppb.c               |   10 
 drivers/parisc/iosapic.c            |    2 
 drivers/parisc/lasi.c               |    4 
 drivers/parisc/lba_pci.c            |   14 
 drivers/parisc/led.c                |  225 +++++------
 drivers/parisc/pdc_stable.c         |    2 
 drivers/parisc/sba_iommu.c          |  164 +++++---
 drivers/parisc/superio.c            |    3 
 drivers/parisc/wax.c                |    2 
 drivers/parport/parport_gsc.c       |    5 
 drivers/scsi/lasi700.c              |    6 
 drivers/scsi/zalon.c                |    4 
 drivers/serial/8250_gsc.c           |    6 
 drivers/serial/mux.c                |   11 
 drivers/video/console/Kconfig       |    8 
 drivers/video/console/sticore.c     |  132 +++----
 include/asm-parisc/assembly.h       |   71 +++
 include/asm-parisc/bitops.h         |  290 +++++++--------
 include/asm-parisc/errno.h          |    1 
 include/asm-parisc/grfioctl.h       |    2 
 include/asm-parisc/led.h            |    3 
 include/asm-parisc/parisc-device.h  |    7 
 include/asm-parisc/pci.h            |    2 
 include/asm-parisc/pgtable.h        |    2 
 include/asm-parisc/processor.h      |   19 +
 include/asm-parisc/psw.h            |   51 +-
 include/asm-parisc/ptrace.h         |    2 
 include/asm-parisc/spinlock.h       |    5 
 include/asm-parisc/spinlock_types.h |    8 
 include/asm-parisc/system.h         |   50 +-
 include/asm-parisc/tlbflush.h       |   29 +
 include/asm-parisc/types.h          |    2 
 include/asm-parisc/unistd.h         |   16 
 include/linux/hil.h                 |  483 +++++++++++++++++++++++++
 include/linux/hil_mlc.h             |  168 ++++++++
 include/linux/hp_sdc.h              |  300 +++++++++++++++
 include/linux/input.h               |    1 
 sound/parisc/harmony.c              |  116 +++++-
 sound/parisc/harmony.h              |   17 
 84 files changed, 4265 insertions(+), 2089 deletions(-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
