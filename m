From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] Merge progress update
Date: Sat, 19 Nov 2005 11:42:59 -0500
Message-ID: <20051119164259.GO28276@tachyon.int.mcmartin.ca>
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

So, the following went upstream to Linus yesterday:

	68K     linus_to_parisc_2.diff

Shortlog and diffstat are contained below.

The ide_toggle_bounce fix went upstream with Bartlomiej yesterday,
so that's another chunk out of our diff. I'll be maintaining a 
ad1889 git tree to upstream via the ALSA folks some of our other
changes.

Approximate remaining bits,

	100K    parisc_remainingish.diff

Which consists primarily of:

	-rw-r--r--  1 kyle kyle 22881 Nov 19 11:37 scsi
		(sym2 + 53c700 changes) [willy for sym2]
	
	-rw-r--r--  1 kyle kyle 29568 Nov 19 11:38 sound
		(oss harmony & ad1889 and alsa ad1889 changes)

	-rw-r--r--  1 kyle kyle 33188 Nov 19 11:40 compat
		(compat_signal)

	-rw-r--r--  1 kyle kyle 3676 Nov 19 11:41 tulip
		(tulip modifications)

The rest of the diff is primarily small little hacks and a few things
that need to be resolved with subsystem maintainers. For example,
James' fixes for pcmcia, and Grant's fixes for usb hid.

Cheers,
	Kyle

--

Carlos O'Donell:
      [PARISC] Document some register usages in assembly files

Christoph Hellwig:
      [PARISC] move PA perf driver over to ->compat_ioctl
      [PARISC] remove drm compat ioctls handlers

Grant Grundler:
      [PARISC] Disable nesting of interrupts
      [PARISC] irq_affinityp[] only available for SMP builds
      [PARISC] Remove unused variable in signal.c

James Bottomley:
      [PARISC] Make sure timer and IPI execute with interrupts disabled
      [PARISC] Fix our interrupts not to use smp_call_function
      [PARISC] Add IRQ affinities
      [PARISC] Fix our spinlock implementation

Kyle McMartin:
      [PARISC] Fix uniprocessor build by dummying smp_send_all_nop()
      [PARISC] Make superio.c initialize before any driver needs it
      [PARISC] Update CREDITS entries
      Merge branch 'master'

Matthew Wilcox:
      [PARISC] Return PDC_OK when alloc_pa_dev fails to enumerate all devices
      [PARISC] Improve the error message when we get a clashing mod path
      [PARISC] Fix some compile problems in ptrace.c
      [PARISC] Always spinlock tlb flush operations to ensure preempt safety
      [PARISC] Fix compile warning caused by conflicting types of expand_upwards()
      [PARISC] Make Serial MUX depend on a specific bus type.
      [PARISC] Mention PA-RISC in NS87415 help
      [PARISC] Mark hisax and pcbit ISDN drivers as not for parisc

Ryan Bradetich:
      [PARISC] Make redirecting irq messages less noisy
      [PARISC] Compile fixups for serial/mux.c
      [PARISC] Define port->timeout to fix a long msleep in mux.c

 CREDITS                        |   12 
 arch/parisc/kernel/drivers.c   |    8 
 arch/parisc/kernel/entry.S     |    1 
 arch/parisc/kernel/inventory.c |    2 
 arch/parisc/kernel/ioctl32.c   |  546 -----------------------------------------
 arch/parisc/kernel/irq.c       |  110 ++++++--
 arch/parisc/kernel/perf.c      |   33 +-
 arch/parisc/kernel/ptrace.c    |    5 
 arch/parisc/kernel/signal.c    |    1 
 arch/parisc/kernel/smp.c       |   24 +
 arch/parisc/kernel/syscall.S   |    3 
 drivers/ide/Kconfig            |    2 
 drivers/isdn/hisax/Kconfig     |   12 
 drivers/isdn/pcbit/Kconfig     |    2 
 drivers/parisc/iosapic.c       |   26 +
 drivers/parisc/superio.c       |   35 +-
 drivers/serial/Kconfig         |    2 
 drivers/serial/mux.c           |   19 -
 include/asm-parisc/irq.h       |    5 
 include/asm-parisc/smp.h       |    7 
 include/asm-parisc/spinlock.h  |   19 -
 include/asm-parisc/tlbflush.h  |   16 -
 include/linux/mm.h             |    2 
 mm/mmap.c                      |    2 
 24 files changed, 245 insertions(+), 649 deletions(-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
