From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [git pull] parisc-linux for 2.6.15
Date: Fri, 18 Nov 2005 17:16:01 -0500
Message-ID: <20051118221601.GD28276@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org
To: torvalds@osdl.org
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

Hi Linus,

This pull contains the last remnants of parisc divergence in parisc
specific files up to this point. At least, until someone commits to cvs.
Remaining changes in CVS are compat_signal and some ALSA stuff that will
be forwarded along to Jaroslav.

Before you consider whether to pull, I'd just like to double check
whether I made any mistakes in the process:

	! merged a bunch of patches

	$ git-send-pack $remote parisc	to master.kernel.org

	! merged some more, made a mistake, nuked tree

	$ git pull my tree from master.kernel.org and fixed up remotes to
	  point master:origin to your tree, and parisc:parisc to mine

	! merged some more patches, noticed I had accumulated a patch in the
	  branch from "origin" somehow since I branched

	$ git checkout -f master
	$ git pull origin
	$ git checkout -f parisc
	$ git pull . master		to merge up to your tree
	$ git-send-pack $remote --all	to master.kernel.org to update all
					branches(?)

However, in doing this, I accumulated one of those annoying
"Merge branch 'master'" messages. I looked at Jeff's pull requests, and
he didn't seem to have any in there. Is this process kosher? Should I do
more or less the same thing next time?

--

Please pull the `parisc' branch from,

master.kernel.org:/pub/scm/linux/kernel/git/kyle/parisc-2.6.git parisc

Which contains the following changesets,

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

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
