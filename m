Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD8034829
	for <parisc-linux@parisc-linux.org>; Mon, 21 Oct 2002 13:50:03 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 183iYq-0003uP-00
	for parisc-linux@parisc-linux.org; Mon, 21 Oct 2002 20:50:00 +0100
Date: Mon, 21 Oct 2002 20:50:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20021021205000.E1356@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.5 status 2002-10-21
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

Here's the latest todo list, currently being maintained in CVS.  I'd like
to thank everyone who's jumped in to help over the last week; it's been
truly amazing.  Linus is currently away so we can't send anything to him,
but we're in good shape as far as the feature freeze is concerned.

Status:
-------
 - Merged to 2.5.44
 - 2.5.41 booted on an A500; neither 2.5.43 nor 2.5.44 have booted yet.
 - Don't know what other patches need to be brought forward from 2.4
 - SMP doesn't work yet
 - No preemptible support
 - No CPU hotplug support

Todo:
-----
 - review makefiles for safe parallel builds
 - review diff vs 2.4 for additional changes
 - Serial code not working for c3000 (helge)
 - the fix for do_fork needs checking
 - mux driver needs to be forward ported from 2.4 (rbrad)
 - need to get an official number for PDC_CONS or MUX (any problem with using
        the same number for both?) (rbrad)
 - Some options still need Config.help entries
 - figure out whether arch/parisc/kernel/keyboard.c can be deleted.
 - drivers/char/keyboard.c:987:2: warning: #warning "Cannot generate rawmode
        keyboard for your architecture yet."
 - implement synchronize_irq().

 - show_trace()/show_stack() etc need to be implemented for parisc. right
   now they are just empty stubs. i have some initial versions of these
   that are probably not quite correct. will look into it some more.
 - our PDC early debug console hacks need to be cleaned up somehow
 - pci serial is broken still in 2.5.41, may be fixed in 2.5.42
 - drivers/pci/setup-bus.c has a hppa-specific #ifdef right now to
   prevent pci reinit from hpmc'ing the machine. this probably needs to
   go upstream

 - on 64-bit kernel (at least) jiffies/wall_jiffies may get out of sync
   leading to very long loops in kernel/timer.c:update_times
 - arch/parisc/kernel/time.c:gettimeoffset sometimes returns a negative
   offset, which leads to a very long loop in do_gettimeofday
 - random userspace segfaults (UP) - stack pointer seems to be corrupted
   on return from some kernel paths

 - ad1889 driver - stress, debug, ALSA and commit to 2.5 (ggg, tausq, tbone)
 - ns87415 dma doesn't work reliably on suckyio-systems

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

 - call to pdc_suspend_usb() in inventory.c crashes c3k with kernel 2.5
 - fix harmony buffer-overflows
 - fix HIL problem: ksoftirqd eats 100% cpu (kernel 2.4; kernel 2.5?)
 - CONFIG_INTERMEZZO_FS=m doesn't build (or link)
 - CONFIG_REISERFS_FS=m   doesn't build (or link)
 - CONFIG_XFS_FS=m        doesn't build (or link)


 Started and in progress:
 ------------------------
 - port sym53c8xx hppa changes forward (helge)
 - What's going on with CONFIG_HIL? (tbone, for review -> helge?)
 - Look at Config.help too. (tbone, HIL -> helge?)
 - send UTS_MACHINE diff to Linus (willy)
 - send shmem flush to akpm (willy)
 - send personality diff to Linus (willy)
 - send another ARCH_STACK_GROWS_UP diff to Linus (willy)
 - send generic prefetch xor checksums to Linus (willy)
 - send tulip changes to jgarzik (grant)
 - switching Harmony to ALSA (laurent)
 - remove all references to sti(), cli(), save_flags() and restore_flags() (will
y, tbone, ...)


 Done:
 -----
 - stifb & sticon compiles and works (helge)
 - fixed genrtc merge error (willy)
 - sent .text.init -> .init.text change to Linus (willy)
 - port ns87415 hppa changes forward (grant)
 - remove obsolete tcpdiag_cookie patch from our tree (willy)
 - serial console works for 712 (willy)
 - merged 2.5.43 (bame)
 - migrated to asm-offsets.c (willy)
 - forward-ported the loff_t argument fixes from 2.4 (willy)
 - do a better job of vmlinux{32,64}.lds (tausq)
 - merged 2.5.44 (bame)


 CONFIG options without help:
 -----------------------------
 _PDC_CONSOLE
 _USB_OHCI_HCD (add parisc info?)
 _HP_SDC_RTC
 _HIL_MLC
 _HIL_KBD (to improve)
 _HIL_PTR (to improve)

-- 
Revolutions do not require corporate support.
