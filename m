From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Status of 2.6.22-rc3 ?
Date: Sun, 27 May 2007 14:38:57 +0200
Message-ID: <200705271438.57394.deller__25806.687543127$1416624366$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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

Hi everyone,

I just wanted to ask if someone of you managed to boot a parisc 2.6.22-rc3 kernel yet ?
I'm using Linus' current tree and merged into this one Kyles' latest patches and built the kernel.

I was able to build a kernel after I patched lasi_82596.c (see my patch I sent out just before).
I see quite some warnings though:

WARNING: arch/parisc/kernel/built-in.o(.data.read_mostly+0xd8): Section mismatch: reference to .init.text:processor_probe (between 'cpu_driver' and 'boot_cpu_data')
WARNING: arch/parisc/kernel/built-in.o(.text.alloc_pa_dev+0x140): Section mismatch: reference to .init.text:parisc_hardware_description (after 'alloc_pa_dev')
WARNING: kernel/built-in.o(.text.kthreadd+0x14): Section mismatch: reference to .init.text:kthreadd_setup (after 'kthreadd')
WARNING: drivers/built-in.o(.text.ccio_probe+0xdc): Section mismatch: reference to .init.text:ccio_init_resources (after 'ccio_probe')
WARNING: drivers/built-in.o(.text.eisa_probe+0x220): Section mismatch: reference to .init.text:eisa_root_register (after 'eisa_probe')
WARNING: drivers/built-in.o(.text.superio_serial_init+0x78): Section mismatch: reference to .init.text:early_serial_setup (after 'superio_serial_init')
WARNING: drivers/built-in.o(.text.superio_serial_init+0xa4): Section mismatch: reference to .init.text:early_serial_setup (after 'superio_serial_init')
WARNING: drivers/built-in.o(.text.sticore_pci_init+0xac): Section mismatch: reference to .init.text:sti_try_rom_generic (after 'sticore_pci_init')
WARNING: drivers/built-in.o(.text.sticore_pci_init+0xe4): Section mismatch: reference to .init.text:sticore_check_for_default_sti (after 'sticore_pci_init')
WARNING: drivers/built-in.o(.text.sti_get_rom+0x18): Section mismatch: reference to .init.text:sti_init_roms (after 'sti_get_rom')
WARNING: drivers/built-in.o(.text.parport_init_chip+0xbc): Section mismatch: reference to .init.data:parport_count (after 'parport_init_chip')
WARNING: drivers/built-in.o(.text.parport_init_chip+0xc0): Section mismatch: reference to .init.data:parport_count (after 'parport_init_chip')
WARNING: drivers/built-in.o(.text.parport_init_chip+0xc8): Section mismatch: reference to .init.data:parport_count (after 'parport_init_chip')

I just disabled then the freeing of inital-memory (just in case!), and as such booting to init process went OK.
But then init started udev and it just crashes reproduceably:
->
Synthesizing the initial hotplug events...done.
Waiting for /dev to be fully populated...<2>Backtrace:
 [<1011326c>] unwind_frame_regs+0x48/0x220
 [<10113578>] unwind_once+0x10/0x48
 [<1011284c>] get_wchan+0x2c/0x68
 [<101b9308>] do_task_stat+0x24c/0x500
 [<101b4f34>] proc_info_read+0x88/0x108
 [<10179db0>] vfs_read+0x8c/0x138
 [<1017a10c>] sys_read+0x5c/0xa4
 [<1010c080>] syscall_exit+0x0/0x28
BUG: spinlock recursion on CPU#0, udevd/560
 lock: 1056e08c, .magic: dead4ead, .owner: udevd/560, .owner_cpu: 0
Backtrace:
 [<1026c5d0>] _raw_spin_lock+0x50/0xa4
 [<101076cc>] parisc_terminate+0x58/0xe8
 [<10107cbc>] handle_interruption+0x560/0x58c
 [<1010b080>] intr_check_sig+0x0/0x34
BUG: spinlock lockup on CPU#0, udevd/560, 1056e08c                                                                                           

Anyone sees this as well ?
Is anyone testing head development kernels (e.g. 2.6.22-rc3) at all ?

Best regards,
Helge


PS: I'm not really happy with our current development model. IMHO it's too complicated to get to a building tree and thus too few people (anyone?) test the latest kernels...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
