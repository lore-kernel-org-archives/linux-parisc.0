Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA29222
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 09:32:59 -0700
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id JAA04972
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 09:35:01 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=noam.fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 13vj2z-00035b-00
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 09:35:01 -0700
To: parisc-linux@puffin.external.hp.com
Date: Tue, 14 Nov 2000 09:35:01 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13vj2z-00035b-00@noam.fc.hp.com>
Subject: [parisc-linux] CVS linux Vs. -test10
List-ID: <linux-parisc.vger.kernel.org>


I've attached an overview of differences between our CVS linux sources
following the -test10 merge and the upstream -test10 sources.  This
document is also at http://puffin.external.hp.com/~bame/diff.html
The raw 'diff' output (now a bit out of date) is at
http://puffin.external.hp.com/~bame/diff.out

If anyone gets bored, this list is full of small (and not so small)
tasks which range from very simple (drivers/block/rd.c) to fairly
complex (scripts/*).

	-P


                        palinux Vs. linux 2.4.0-test10
                                       
   Here's a brief summary of the differences in common code between
   palinux (tag: LINUS_240_TEST10_MERGED) and the upstream -test10
   sources. The full diff output is in diff.out. NOTE this does not
   include machine-depend differences
     * Minor changes in several locations to support GSC
     * Minor top-level Makefile hacks, though the CFLAGS one is quite
       important.
     * Lots of RCS $Revision$ differences in ACPI (a different 'cvs
       import' would've eliminated these differences).
     * drivers/block/rd.c: obsolete debug code for parisc64. Changed a
       constant from 0xffffffffL to 0xffffffffUL because of a parisc64
       gcc bug initializing longs. The repaired code is probably "more
       correct" anyway.
     * drivers/char/Config.in: changes to support LASI, parisc real-time
       clock (CONFIG_GENRTC)
     * drivers/char/Makefile: Config-related changes to support HP
       keyboards and RTC
     * drivers/char/console.c: looks like dead or dying experimental
       parisc code -- probably should be removed. Also some
       parisc-specific comments and format changes which should
       disappear.
     * drivers/char/serial.c: support for GSC and A500 serial
     * drivers/net/Makefile,Space.c: mostly LASI LAN support
     * drivers/net/eepro100.c: no clue about this one
     * drivers/net/tulip/interrupt.c: workaround for a B180+busy-lan boot
       problem -- probably should be sent upstream.
     * drivers/net/tulip/tulip_core.c: required #ifdef for hppa, also
       printk() changes which appear valid
     * drivers/parport/Makefile: GSC
     * drivers/parport/parport_gsc.c: New file for palinux -- GSC
       parallel ports -- required
     * drivers/pci/pci.c: eh? Grant?
     * drivers/pci/setup-bus.c: function definition tweek -- Grant?
     * drivers/scsi: Lots of changes here -- rhirst? See for yourself.
       Basics: support LASI and Zalon scsi, changes to 53c8xx drivers,
       rename sim7x0 to sim710
     * drivers/sound: support for HP "Harmony" sound
     * drivers/video: STI and HP FB video drivers (iodccon is probably
       worthless)
     * fs: add support for SOM executables
     * fs/binfmt_elf.c,exec.c: changes for stack-grows-up?
     * fs/nfs/read.c: probably unnecessary hack for broken parisc64 gcc
     * fs/proc/array.c: ?? something with signals ??
     * fs/stat.c: added __hppa__ to several #ifdefs
     * include/linux/binfmts.h,fs.h,kernel.h,tty.h,udf_fs_sb.h:
       unnecessary differences?
     * include/linux/init.h: we use different section names -- why????,
       probably some unnecessary other differences too
     * include/linux/mm.h: VM_STACK_FLAGS difference -- jsm?
     * include/linux/wait.h: parisc debugging -- should be removed
     * init/main.c: KWDB and GSC support plus a bunch of stuff which
       should probably go away.
     * kernel/Makefile,dma.c,fork.c,printk.c: eh?
     * kernel/module.c: possible parisc-needed changes
     * kernel/signal.c: unknown signal-related differences
     * lib/inflate.c: changed some constants to work around parisc64 gcc
       bug
     * mm/mprotect.c: ?
     * scripts/*: MANY differences here. Looks like a combination of
       things we hacked to fix configuration problems plus MAYBE not
       updating these files from new Linux versions in the past. 'make
       menuconfig' is significantly different from upstream. Even the
       mkdep.c program is different.
