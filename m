Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA24152
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Jun 1999 07:56:28 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id KAA01701
	for <parisc-linux@thepuffingroup.com>; Fri, 18 Jun 1999 10:04:37 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <376A51F5.D38ECFFC@thepuffingroup.com>
Date: Fri, 18 Jun 1999 10:04:37 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] A quick update
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


John David Anglin wrote:
> You probably want to use the same link options as Jason used for the IPL:
> -N -R address.

Ah, okay.

> After the kernel is built, take a look at where the sections start
> in SOM executable.  Each section must be copied to its corresponding
> starting address in the LIF image.  Space must be reserved for the bss
> data if there is a section after it that contains necessary data.

Should I be using objcopy to cut these sections out of my SOM executable
and into the LIF image?

Two other problems I have:

1. The kernel doesn't build yet, it fails to link and dies with:


ld -e stext arch/parisc/kernel/head.o arch/parisc/kernel/init_task.o
init/main.o init/version.o \
        arch/parisc/kernel/kernel.o arch/parisc/mm/mm.o kernel/kernel.o
mm/mm.o fs/fs.o ipc/ipc.o \
        fs/filesystems.a \
        net/network.a \
        drivers/block/block.a drivers/char/char.a  drivers/net/net.a \
        /usr/src/linux/arch/parisc/lib/lib.a /usr/src/linux/lib/lib.a
/usr/src/linux/arch/parisc/lib/lib.a \
        -o vmlinux
ld: Unsatisfied symbols:
   swapper_pg_dir (data)
   _stext (data)

I haven't yet figured out how to solve this.

2. The bootloader within the kernel tries to load the vmlinux into
memory, but dies by returning -6 at the P0_BOOTDEV_iodc_io() call within
bootdev_sread() in rom _interface.c.  I should be able to figure out
what's going on here...


- A
-- 
Alex deVries
Vice President of Engineering
The Puffin Group
