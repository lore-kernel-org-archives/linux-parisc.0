Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A32D74829
	for <parisc-linux@parisc-linux.org>; Tue, 14 Jan 2003 08:54:10 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18YTOD-0003dn-00
	for parisc-linux@parisc-linux.org; Tue, 14 Jan 2003 15:54:09 +0000
Date: Tue, 14 Jan 2003 15:54:09 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030114155409.X26554@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.5 status update 2003-01-14
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

A new year, a new kernel.  Er, lots of new kernels.  So much stuff has been
going on, I hope I haven't left too much out (note: do these more often).

 - Lamont prompted me to fix dino_inb/inw/outb/outw, and the airo driver.
 - Lamont wrote faster ip_csum routines.
 - Helge went completely nuts on drivers/video ;-)
 - James did some of the merges while I was away over xmas, and did a lot
   of work converting us over to the generic device model.
 - James & Randolph also finally tracked down a big stability problem;
   needed to check signals more often.
 - Lamont improved the unaligned handler.
 - We have a new framebuffer penguin ;-)  Thanks, Thibaut!
 - Randolph wrote oprofile support for parisc.
 - I found & fixed the cause of init failing to start on my 712 -- the
   kernel was trying to make sure there was at least 80MB ram available
   for each process.
 - I integrated Stephen Rothwell's generic compat changes & Sam Ravnborg's
   Makefile changes.

We did a large merge into Linus' tree yesterday, and he put out 2.5.58
today, leaving our diff standing around:

-rw-r--r--    1 willy    willy      376145 Jan 14 08:38 parisc-2.5.diff

I think that's the smallest it's ever been.

The largest chunks of that are:

-rw-r--r--    1 willy    willy      166953 Jan 12 07:54 parisc-hil.diff
-rw-r--r--    1 willy    willy      151345 Jan 12 07:47 parisc-video.diff

I'm not worried about drivers/video; Helge's doing a great job staying
synchronised with James Simmons' fb tree and that artificially inflates
that diff.

I am a little worried about the HIL keyboard/mouse/etc.  If someone could
step up to take care of making them work in 2.5 and generally look after
them, that'd be great.


Here's the current todo list:

Status:
-------
 - Merged to 2.5.58
 - 2.5.57 booted on A500.  712 has serial problems.
 - 2.5.56 booted on A500, 712
 - Don't know what other patches need to be brought forward from 2.4
 - SMP compiles, but doesn't work yet
 - No preemptible support


Todo:
-----
 - review makefiles for safe parallel builds
 - review diff vs 2.4 for additional changes
 - Serial code not working for c3000 (helge)
 - the fix for do_fork needs checking
 - Some options still need Kconfig help entries
 - drivers/char/keyboard.c:987:2: warning: #warning "Cannot generate rawmode
        keyboard for your architecture yet."
 - our PDC early debug console hacks need to be cleaned up somehow
 - drivers/pci/setup-bus.c has a hppa-specific #ifdef right now to
   prevent pci reinit from hpmc'ing the machine. this probably needs to
   go upstream
 - ad1889 driver - stress, debug, ALSA and commit to 2.5 (ggg, tausq, tbone)
 - ns87415 dma doesn't work reliably on suckyio-systems
 - CPU hotplug support (maybe not needed, V-Class doesn't support that feature)
 - flush_tlb_kernel_range is horribly inefficient
 - flush_icache_user_range could flush just that range rather than the
   entire page.
 - (ab)use kmap/kunmap on 64-bit to eliminate flush_dcache calls.
 - cp_new_stat32 for sys_parisc32.c is inefficient; maybe it's better
   to fill in a tmp stat32 and just do copy_to_user in one go at the end?
 - syscall signal return path needs work
 - task_struct/thread_info split -- task_struct should not be visible in
   entry.S, we need to move some items into thread_info -- this includes
   pt_regs and maybe some of the flags (ptrace, etc)
 - Use zone_highmem for the 256MB of RAM at 64GB on Astro-based machines.
   (NB, what does Stretch do?)
 - investigate not putting in extable entries for put_kernel_asm; will
   probably reduce kernel size
 - call to pdc_suspend_usb() in inventory.c crashes c3k with kernel 2.5
 - fix harmony buffer-overflows
 - fix HIL problem: ksoftirqd eats 100% cpu (kernel 2.4; kernel 2.5?)
 - write floppy driver for lasi
 - write floppy driver for suckyio
 - CONFIG_INTERMEZZO_FS   doesn't build (or link) (missing intermezzo includes, arch-indep)
 - CONFIG_REISERFS_FS builds (and links), works built-in
 - CONFIG_XFS_FS builds (and links), infinite loop when mounting volume.
 - spifi driver (rbrad)
 - write optimized versions of lcopy_{to,from}_user. Can we port the
   hpux versions?
 - changes in arch/parisc/kernel/signal.c regarding HACK needs testing
 - signal.c #if CACHE_FLUSHING_IS_NOT_BROKEN needs to be solved
 - proc files are b0rken (interrupts), possible irqi funcs related pb.
 - the irq needs to go from doubly-indexed to singly-indexed scheme, or else fs/proc/proc_misc.c needs changes.
 - kernel module loader support
 - IRQ cpu-affinity support
 - NPTL kernel support (CLONE_*TID flags need to be correctly handled by
   sys_clone() and friends)

 Started and in progress:
 ------------------------
 - port sym53c8xx hppa changes forward (helge)
 - push STI changes upstream (helge)
 - Look at Config.help too. (tbone, HIL -> helge?)
 - send tulip changes to jgarzik (grant)
 - switching Harmony to ALSA (laurent)
 - remove all references to sti(), cli(), save_flags() and restore_flags() (willy, tbone, ...)
 - send pci-serial patches to rmk (tausq)
 - port hil_kbd.c to new input layer
 - port hil_ptr.c to new input layer
 - oprofile support (tausq)


 Done:
 -----
 - stifb & sticon compiles and works (helge)
 - port ns87415 hppa changes forward (grant)
 - implemented synchronize_irq(). (grant)
 - port hp_keyb.c to input layer (laurent, tbone)


 CONFIG options without help:
 -----------------------------
 _USB_OHCI_HCD (add parisc info?)
 _HP_SDC_RTC
 _HIL_MLC
 _HIL_KBD (to improve)
 _HIL_PTR (to improve)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
