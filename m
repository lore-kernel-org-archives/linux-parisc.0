Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA16080
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Oct 1999 16:35:46 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ld: Unsatisfied symbols: csum_partial (code)
Date: Mon, 18 Oct 1999 00:34:58 +0200
Content-Type: text/plain
References: <199910170156.SAA25411@milano.cup.hp.com>
MIME-Version: 1.0
Message-Id: <99101800363200.14826@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Sun, 17 Oct 1999 schrieb Grant Grundler:
> I have a "vanilla" CVS tree and am getting the following
> linker error:
> ld -R 0xc0010000 -N -e stext arch/parisc/kernel/head.o arch/parisc/kernel/init_task.o init/main.o init/version.o \
>         arch/parisc/boot/ramdisk.o arch/parisc/kernel/kernel.o arch/parisc/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
>         fs/filesystems.a \
>         net/network.a \
>         drivers/block/block.a drivers/char/char.a drivers/gecko/gecko.a  drivers/net/net.a drivers/scsi/scsi.a drivers/pci/pci.a \
>         /linux/linux/arch/parisc/lib/lib.a /linux/linux/lib/lib.a /linux/linux/arch/parisc/lib/lib.a \
>         -o vmlinux
> ld: Unsatisfied symbols:
>    csum_partial (code)
>    serial_console_init (code)
> make[1]: *** [vmlinux-real] Error 1
> 
> Any clue what's broken?
> Someone submit code recently which touched these functions?
> 
> thanks,
> grant



Hi Grant,

serial_console_init was my fault.
This should now be corrected in the CVS, but I can´t verify the csum_partial
error here .....

Helge.
