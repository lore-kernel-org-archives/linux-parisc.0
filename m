Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from leo.uni-sw.gwdg.de (leo.uni-sw.gwdg.de [134.76.205.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id 05A16482A
	for <parisc-linux@parisc-linux.org>; Mon,  2 Jul 2001 10:48:31 -0600 (MDT)
Date: Mon, 2 Jul 2001 18:43:18 +0200 (CEST)
From: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] New i386->hppa cross-compiler
In-Reply-To: <20010629213425.BF03237F86@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.33.0107021836410.15161-100000@leo.uni-sw.gwdg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 29 Jun 2001, Matt Taggart wrote:

> Hi hppa-linux'ers,
>
> I have built a new i386 ->hppa/hppa64 cross-compiler. The tarball is available
> at,
>
> ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20010628-2.tar.gz
>
> Untar it from / it lives in /opt/palinux, so you'll want to add
> /opt/palinux/bin to your $PATH. It was built against potato's glibc 2.1.3 so
> it should work on systems using that and newer.

Hi Matt!

I tried compiling the kernel 20010629 on my x86-SuSE-6.4-Linux
machine using the new cross-compiler and I got a segfault during
final linking (see below). Reverting to xc-20010530 cured that
problem. The rest of the kernel compilation (the part before the
final linking) worked OK though.

	Peter.


hppa-linux-ld -T /home/hplinux/PA-RISC_Linux/linux/arch/parisc/vmlinux.lds  arch/parisc/kernel/head.o  init/main.o init/version.o \
--start-group \
arch/parisc/kernel/pdc_cons.o arch/parisc/kernel/process.o arch/parisc/lib/lib.a arch/parisc/mm/mm.o arch/parisc/kernel/kernel.o arch/parisc/hpux/hpux.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o arch/parisc/kernel/init_task.o \
drivers/block/block.o drivers/char/char.o drivers/misc/misc.o drivers/net/net.o drivers/media/media.o  drivers/parport/driver.o drivers/scsi/scsidrv.o drivers/cdrom/driver.o drivers/sound/sounddrivers.o drivers/pci/driver.o drivers/video/video.o drivers/md/mddev.o drivers/gsc/gscbus.o arch/parisc/math-emu/math.o \
net/network.o \
`hppa-linux-gcc -print-libgcc-file-name` /home/hplinux/PA-RISC_Linux/linux/arch/parisc/lib/lib.a /home/hplinux/PA-RISC_Linux/linux/lib/lib.a  \
	--end-group \
	-o vmlinux
Segmentation fault
