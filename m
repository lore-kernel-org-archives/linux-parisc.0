Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id C42B84879
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 21 Dec 2003 09:18:17 -0700 (MST)
Message-ID: <3FE5C7F7.1000204@tiscali.be>
Date: Sun, 21 Dec 2003 16:19:03 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] audit for copyright/license
References: <20031221041802.GB12969@colo.lackof.org>
In-Reply-To: <20031221041802.GB12969@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

is that:
find drivers/parisc arch/parisc include/asm-parisc | xargs grep -l -v "GNU General Public License" | grep -v "\.o"

following list would help in first instance:
drivers/parisc/README.dino
drivers/parisc/Kconfig
drivers/parisc/Makefile
drivers/parisc/ccio-dma.c
drivers/parisc/asp.c
drivers/parisc/eisa_enumerator.c
drivers/parisc/ccio-rm-dma.c
drivers/parisc/dino.c
drivers/parisc/eisa.c
drivers/parisc/eisa_eeprom.c
drivers/parisc/iosapic.c
drivers/parisc/gsc.c
drivers/parisc/gsc.h
drivers/parisc/hppb.c
drivers/parisc/iosapic_private.h
drivers/parisc/lasi.c
drivers/parisc/lba_pci.c
drivers/parisc/led.c
drivers/parisc/power.c
drivers/parisc/sba_iommu.c
drivers/parisc/superio.c
drivers/parisc/wax.c
arch/parisc/configs/712_defconfig
arch/parisc/hpux/entry_hpux.S
arch/parisc/hpux/Makefile
arch/parisc/hpux/gate.S
arch/parisc/hpux/fs.c
arch/parisc/hpux/sys_hpux.c
arch/parisc/hpux/ioctl.c
arch/parisc/hpux/wrappers.S
arch/parisc/kernel/asm-offsets.c
arch/parisc/kernel/Makefile
arch/parisc/kernel/asm-offsets.s
arch/parisc/kernel/binfmt_elf32.c
arch/parisc/kernel/cache.c
arch/parisc/kernel/drivers.c
arch/parisc/kernel/entry.S
arch/parisc/kernel/firmware.c
arch/parisc/kernel/hardware.c
arch/parisc/kernel/head.S
arch/parisc/kernel/head64.S
arch/parisc/kernel/hpmc.S
arch/parisc/kernel/init_task.c
arch/parisc/kernel/inventory.c
arch/parisc/kernel/ioctl32.c
arch/parisc/kernel/irq.c
arch/parisc/kernel/module.c
arch/parisc/kernel/pa7300lc.c
arch/parisc/kernel/pacache.S
arch/parisc/kernel/parisc_ksyms.c
arch/parisc/kernel/pci-dma.c
arch/parisc/kernel/pci.c
arch/parisc/kernel/pdc_chassis.c
arch/parisc/kernel/pdc_cons.c
arch/parisc/kernel/perf.c
arch/parisc/kernel/perf_asm.S
arch/parisc/kernel/perf_images.h
arch/parisc/kernel/process.c
arch/parisc/kernel/processor.c
arch/parisc/kernel/ptrace.c
arch/parisc/kernel/real2.S
arch/parisc/kernel/semaphore.c
arch/parisc/kernel/setup.c
arch/parisc/kernel/signal.c
arch/parisc/kernel/signal32.c
arch/parisc/kernel/signal32.h
arch/parisc/kernel/smp.c
arch/parisc/kernel/sys32.h
arch/parisc/kernel/sys_parisc.c
arch/parisc/kernel/sys_parisc32.c
arch/parisc/kernel/syscall.S
arch/parisc/kernel/syscall_table.S
arch/parisc/kernel/time.c
arch/parisc/kernel/traps.c
arch/parisc/kernel/unaligned.c
arch/parisc/kernel/vmlinux.lds.S
arch/parisc/kernel/vmlinux.lds.s
arch/parisc/lib/checksum.c
arch/parisc/lib/Makefile
arch/parisc/lib/bitops.c
arch/parisc/lib/lusercopy.S
arch/parisc/lib/io.c
arch/parisc/lib/memset.c
arch/parisc/lib/lib.a
arch/parisc/lib/.lib.a.cmd
arch/parisc/math-emu/cnv_float.h
arch/parisc/math-emu/Makefile
arch/parisc/math-emu/README
arch/parisc/math-emu/fpudispatch.c
arch/parisc/math-emu/dbl_float.h
arch/parisc/math-emu/decode_exc.c
arch/parisc/math-emu/denormal.c
arch/parisc/math-emu/dfadd.c
arch/parisc/math-emu/dfcmp.c
arch/parisc/math-emu/dfdiv.c
arch/parisc/math-emu/dfmpy.c
arch/parisc/math-emu/dfrem.c
arch/parisc/math-emu/dfsqrt.c
arch/parisc/math-emu/dfsub.c
arch/parisc/math-emu/driver.c
arch/parisc/math-emu/fcnvff.c
arch/parisc/math-emu/fcnvfu.c
arch/parisc/math-emu/fcnvfut.c
arch/parisc/math-emu/fcnvfx.c
arch/parisc/math-emu/fcnvfxt.c
arch/parisc/math-emu/fcnvuf.c
arch/parisc/math-emu/fcnvxf.c
arch/parisc/math-emu/float.h
arch/parisc/math-emu/fmpyfadd.c
arch/parisc/math-emu/fpbits.h
arch/parisc/math-emu/fpu.h
arch/parisc/math-emu/math-emu.h
arch/parisc/math-emu/frnd.c
arch/parisc/math-emu/hppa.h
arch/parisc/math-emu/sgl_float.h
arch/parisc/math-emu/sfadd.c
arch/parisc/math-emu/sfcmp.c
arch/parisc/math-emu/sfdiv.c
arch/parisc/math-emu/sfmpy.c
arch/parisc/math-emu/sfrem.c
arch/parisc/math-emu/sfsqrt.c
arch/parisc/math-emu/sfsub.c
arch/parisc/mm/extable.c
arch/parisc/mm/Makefile
arch/parisc/mm/ioremap.c
arch/parisc/mm/fault.c
arch/parisc/mm/init.c
arch/parisc/mm/kmap.c
arch/parisc/oprofile/Kconfig
arch/parisc/oprofile/Makefile
arch/parisc/oprofile/init.c
arch/parisc/defconfig
arch/parisc/Kconfig
arch/parisc/Makefile
arch/parisc/defpalo.conf
arch/parisc/nm
include/asm-parisc/compat_rt_sigframe.h
include/asm-parisc/asmregs.h
include/asm-parisc/assembly.h
include/asm-parisc/atomic.h
include/asm-parisc/bitops.h
include/asm-parisc/bootdata.h
include/asm-parisc/bug.h
include/asm-parisc/bugs.h
include/asm-parisc/byteorder.h
include/asm-parisc/cache.h
include/asm-parisc/cacheflush.h
include/asm-parisc/checksum.h
include/asm-parisc/compat.h
include/asm-parisc/compat_ucontext.h
include/asm-parisc/compat_siginfo.h
include/asm-parisc/compat_signal.h
include/asm-parisc/dma-mapping.h
include/asm-parisc/current.h
include/asm-parisc/delay.h
include/asm-parisc/div64.h
include/asm-parisc/eisa_bus.h
include/asm-parisc/dma.h
include/asm-parisc/ioctl.h
include/asm-parisc/io.h
include/asm-parisc/eisa_eeprom.h
include/asm-parisc/elf.h
include/asm-parisc/errno.h
include/asm-parisc/fcntl.h
include/asm-parisc/fixmap.h
include/asm-parisc/floppy.h
include/asm-parisc/grfioctl.h
include/asm-parisc/hardirq.h
include/asm-parisc/hardware.h
include/asm-parisc/hdreg.h
include/asm-parisc/hw_irq.h
include/asm-parisc/ide.h
include/asm-parisc/iosapic.h
include/asm-parisc/ioctls.h
include/asm-parisc/keyboard.h
include/asm-parisc/ipcbuf.h
include/asm-parisc/irq.h
include/asm-parisc/mc146818rtc.h
include/asm-parisc/kmap_types.h
include/asm-parisc/led.h
include/asm-parisc/linkage.h
include/asm-parisc/local.h
include/asm-parisc/machdep.h
include/asm-parisc/mman.h
include/asm-parisc/md.h
include/asm-parisc/mmu_context.h
include/asm-parisc/mmu.h
include/asm-parisc/parisc-device.h
include/asm-parisc/mmzone.h
include/asm-parisc/module.h
include/asm-parisc/msgbuf.h
include/asm-parisc/namei.h
include/asm-parisc/page.h
include/asm-parisc/param.h
include/asm-parisc/parport_gsc.h
include/asm-parisc/parport.h
include/asm-parisc/pdc_chassis.h
include/asm-parisc/pci.h
include/asm-parisc/pdc.h
include/asm-parisc/pgalloc.h
include/asm-parisc/pdcpat.h
include/asm-parisc/percpu.h
include/asm-parisc/perf.h
include/asm-parisc/posix_types.h
include/asm-parisc/pgtable.h
include/asm-parisc/poll.h
include/asm-parisc/rt_sigframe.h
include/asm-parisc/processor.h
include/asm-parisc/psw.h
include/asm-parisc/ptrace.h
include/asm-parisc/real.h
include/asm-parisc/resource.h
include/asm-parisc/rmap.h
include/asm-parisc/scatterlist.h
include/asm-parisc/rtc.h
include/asm-parisc/runway.h
include/asm-parisc/semaphore-helper.h
include/asm-parisc/sections.h
include/asm-parisc/segment.h
include/asm-parisc/thread_info.h
include/asm-parisc/semaphore.h
include/asm-parisc/sembuf.h
include/asm-parisc/serial.h
include/asm-parisc/setup.h
include/asm-parisc/shmbuf.h
include/asm-parisc/shmparam.h
include/asm-parisc/sigcontext.h
include/asm-parisc/siginfo.h
include/asm-parisc/signal.h
include/asm-parisc/smp.h
include/asm-parisc/socket.h
include/asm-parisc/sockios.h
include/asm-parisc/som.h
include/asm-parisc/spinlock.h
include/asm-parisc/stat.h
include/asm-parisc/statfs.h
include/asm-parisc/string.h
include/asm-parisc/superio.h
include/asm-parisc/system.h
include/asm-parisc/termbits.h
include/asm-parisc/termios.h
include/asm-parisc/tlbflush.h
include/asm-parisc/timex.h
include/asm-parisc/tlb.h
include/asm-parisc/topology.h
include/asm-parisc/traps.h
include/asm-parisc/types.h
include/asm-parisc/uaccess.h
include/asm-parisc/ucontext.h
include/asm-parisc/unaligned.h
include/asm-parisc/unistd.h
include/asm-parisc/user.h
include/asm-parisc/xor.h
include/asm-parisc/offsets.h

hth,
J.

Grant Grundler wrote:
> Hi all,
> I noticed linux-2.6:arch/parisc/kernel/firmware.c didn't
> have a license (eg GPL) to stipulate terms of distribution.
> I'll add a GPL to it in my next patch.
> 
> Could someone review drivers/parisc, arch/parisc, and include/asm-parisc
> for both copyright and redistribution license?
> 
> A first step is to post a list of file missing either item.
> If there is a "standard format" for either item, it would be
> good to know what it is and whether or not parisc specific
> files are "close enough" (or not).
> 
> Willy,
> I noticed Documentation/SubmittingDrivers makes no mention of copyright.
> Perhaps the following should be added after "License:"?
> 
> Copyright:      The copyright owner must agree to use of the GPL.
>                 It's best if the submitter and copyright owner are the
> 		same person. If not, the entity whichs authorizes the
> 		use of GPL should list a contact in case it's necessary
> 		to verify the will of the copyright owner.
> 
> thanks,
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
