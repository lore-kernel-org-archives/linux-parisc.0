Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0E523482D
	for <parisc-linux@parisc-linux.org>; Tue, 11 Feb 2003 16:03:55 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18ijRS-0007vd-00
	for parisc-linux@parisc-linux.org; Tue, 11 Feb 2003 23:03:54 +0000
Date: Tue, 11 Feb 2003 23:03:54 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030211230354.T5992@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.5 status update 2003-02-11
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Warning: Linus' tree will probably now build for PA-RISC.  This does
NOT mean that it will work.  You still need to pick up a PA patch from
ftp.parisc-linux.org for it to work.

The good news is that patch is now smaller than ever.  The .gz is down
to 50k; uncompressed it's around 200k.  Almost all of this is the
HIL drivers.

Things which've been done since the last report:
 - Start of module support (Randolph)
 - Merged 2.5.59 (James)
 - More compat chanages (Randolph / Stephen)
 - Convert lasi 82596 driver to DMA api (James)
 - Eliminate ccio_get_fake (James)
 - Raw keyboard support (Helge)
 - Merged 2.5.60 (Matthew / James)

Current status:
 - Merged to 2.5.60, boots on 712
 - 2.5.58 booted on A500, 715/64
 - 2.5.57 booted on C160
 - SuckyIO serial problems still exist.
 - Don't know what other patches need to be brought forward from 2.4
 - SMP compiles, but doesn't work yet
 - No preemptible support

Todo list:
 - review diff vs 2.4 for additional changes
 - Serial code not working for c3000
 - the fix for do_fork needs checking
 - our PDC early debug console hacks need to be cleaned up somehow
 - ad1889 driver: only works with .wav;  Convert to ALSA (ggg, tausq, tbone)
 - ns87415 dma doesn't work reliably on suckyio-systems
 - CPU hotplug support (useful to take flaky CPU "offline")
 - flush_tlb_kernel_range is horribly inefficient
 - flush_icache_user_range could flush just that range rather than the
   entire page.
 - (ab)use kmap/kunmap on 64-bit to eliminate flush_dcache calls.
 - cp_new_stat32 for sys_parisc32.c is inefficient; maybe it's better
   to fill in a tmp stat32 and just do copy_to_user in one go at the end?
 - syscall signal return path needs work
 - changes in arch/parisc/kernel/signal.c regarding HACK needs testing
 - signal.c #if CACHE_FLUSHING_IS_NOT_BROKEN needs to be solved
 - task_struct/thread_info split -- task_struct should not be visible in
   entry.S, we need to move some items into thread_info -- this includes
   pt_regs and maybe some of the flags (ptrace, etc)
 - Use zone_highmem for the 256MB of RAM at 64GB on Astro-based machines.
   (NB, what does Stretch do?)
 - investigate not putting in extable entries for put_kernel_asm; will
   probably reduce kernel size
 - call to pdc_suspend_usb() in inventory.c crashes c3k with kernel 2.5
 - fix HIL problem: ksoftirqd/0 eats 56% cpu (kernel 2.4 & kernel 2.5)
 - write floppy driver for lasi
 - write floppy driver for suckyio
 - XFS goes into an infinite loop when mounting volume.
 - spifi driver (rbrad)
 - write optimized versions of lcopy_{to,from}_user. Can we port the
   hpux versions?
 - kernel module loader support
 - IRQ cpu-affinity support
 - NPTL kernel support (CLONE_*TID flags need to be correctly handled by 
   sys_clone() and friends)
 - port sym53c8xx hppa changes forward (still needed?)

In progress:
 - Some options still need Kconfig help entries (see below!)
 - Look at Config.help too. (tbone, HIL -> helge?)
 - commit beta ALSA harmony driver (laurent)
 - port hil_kbd.c to new input layer
 - port hil_ptr.c to new input layer
 - oprofile support (tausq)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
