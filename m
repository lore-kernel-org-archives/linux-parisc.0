Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6001C4830
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Oct 2001 03:22:59 -0600 (MDT)
Received: (from grundler@localhost)
	by puffin.external.hp.com (8.9.3/8.9.3) id DAA06756
	for parisc-linux@lists.parisc-linux.org; Sat, 6 Oct 2001 03:19:58 -0600
Date: Sat, 6 Oct 2001 03:19:58 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Message-Id: <200110060919.DAA06756@puffin.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] review of Documentation/parisc/unwritten
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
In summary, it looks like unwritten file can be deleted.
Notes from reviewing Documentation/parisc/unwritten are appended.

I'll delete things marked delete unless someone tells me otherwise
by early next week.

Please give feedback on items marked "review?".
It means I didn't know what to do but status quo didn't seem right either.

thanks,
grant


sys_idle	./include/asm-parisc/unistd.h
		obsolete - delete usage.

reboot_setup()	arch/parisc/kernel/process.c
		not used. delete function.

machine_halt		BUG. NOP.  Should update LEDs/ChassisCode.
machine_power_on	obsolete - delete it
		arch/parisc/kernel/process.c

exit_thread		NOP is ok.
flush_thread		review?
		arch/parisc/kernel/process.c.
		Only needs to handle fpu stuff or perf monitors.
		(several arches implement a "lazy fpu state"...interesting)

strlen_user	include/asm-parisc/uaccess.h
		#define strlen_user(str) lstrnlen_user(str, 0x7fffffffL)
		review?

do_check_pgt_cache	arch/parisc/mm/init.c
		NOP. this seems wrong.
		all the other arches have (about) the same thing here.
		sparc64 has some CONFIG_SMP in it.

set_pte_phys	arch/parisc/mm/init.c
		orphaned. delete it.

check_bugs	include/asm-parisc/bugs.h
		NOP. Check for CPU bugs or misconfigured kernel.
		review?

csum_partial_copy
csum_partial_copy_from_user
		arch/parisc/lib/checksum.c
		We want optimized asm for both of those.
		Willy reminded me to pester someone in HP about this.

sigaddset
sigdelset	include/linux/signal.h
		Only i386 and m68k define __HAVE_ARCH_SIG_BITOPS.
		parisc ends up using "generic" code like most other arches.
		Is this an issue?

get_cycles	include/asm-parisc/timex.h
		Defined as "mfctl(16)". Is this ok?
		Only used in drivers/drm/ and kernel/sched.c.
