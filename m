Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA04052
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Nov 2000 18:14:36 -0700
Message-Id: <200011060121.RAA02002@milano.cup.hp.com>
To: "xam@deathsdoor.com" <xam@sgate.charlysworld.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP9000/730 boot problems 
In-reply-to: Your message of "Mon, 06 Nov 2000 01:14:41 PST."
             <Pine.LNX.4.10.10011060038490.12435-100000@sgate.charlysworld.de>
Date: Sun, 05 Nov 2000 17:21:12 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"xam@deathsdoor.com" wrote:
> Hi all,
> 
> i have an HP9000/730 (66.6MHz, 32MB RAM, 10MBit Network, CRX graphics,
> HIL keyboard & mouse, HP 535MBM SCSI HD).
> 
> I got the latest nfsroot, the latest xc and the palo sources from
> puffin.external.hp.com.
> 
> the parition scheme for the HD (id 6) is
> 
> /dev/sdb1   swap   128MB
> /dev/sdb2   f0     10MB
> /dev/sdb3   ext2   rest
> 
> i untarred nfsroot on /dev/sdb3 and changed /etc/fstab accordingly
> i installed palo with the following command
> 
> /opt/palinux/palo-src/palo/palo -I -k /hydra/hppa/boot/vmlinux -b
> /opt/palinux/palo-src/iplboot  -c '3/boot/vmlinux TERM=linux HOME=/
> root=/dev/sdb3' /dev/sdb
> 
> 
> well, i used /dev/sdb since there is also the scsi fd (id 0)
> that is /dev/sda IMHO (i tested alos to use root=/dev/sda3 btw).

using /dev/sdb is ok - your palo command looks "right" to me.

> [...]
> now it prints the palo configuration as i installed it
> and the hd partition scheme (but /dev/idaXYZ instead of /dev/sdbXYZ
> [...]
> ext2 block size 1024
> ext2_open(/boot/vmlinux) = 3
> ext2_mount(partition 3) returns 0
> ELF32 executable

This looks like palo loading the vmlinux.

> [...]
> 
> now all recognized devices (SGC craphics, BA, HIL, LAN, 2x RS232, SCSI,
> EISA, Core Centronics, HP model 'king Cobra' ...)
> 
> the kernel boots actually, but i dumps the stack register and the
> processor registers (not included in this mail) after
> 
> ASP version 1 at ..... found

Sounds like ASP support may be broken.
The way to find out where IOAQ and GR2 registers are pointing.
They should point to functions in System.map.
Who is maintaining ASP support?

> PS: i tried to use a IBM0664 2.0GB scsi hd before (works fine on
> linux/ia32), but i couldn't get it work on hp (i reported this
> in a former mail).

Right. I'm pretty sure older PDC/IODC doesn't send START_UNIT command
to the disk drive. The boot drive is expected to spin up on it's own.
I don't know if newer PDC does send START_UNIT either...

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
