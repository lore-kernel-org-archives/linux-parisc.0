Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA03381
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Nov 2000 17:13:03 -0700
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.9.3/8.8.7) with ESMTP id BAA30678
	for <parisc-linux@thepuffingroup.com>; Mon, 6 Nov 2000 01:14:42 +0100
Date: Mon, 6 Nov 2000 01:14:41 +0100 (CET)
From: "xam@deathsdoor.com" <xam@sgate.charlysworld.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.10011060038490.12435-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] HP9000/730 boot problems
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

i have an HP9000/730 (66.6MHz, 32MB RAM, 10MBit Network, CRX graphics,
HIL keyboard & mouse, HP 535MBM SCSI HD).

I got the latest nfsroot, the latest xc and the palo sources from
puffin.external.hp.com.

the parition scheme for the HD (id 6) is

/dev/sdb1   swap   128MB
/dev/sdb2   f0     10MB
/dev/sdb3   ext2   rest

i untarred nfsroot on /dev/sdb3 and changed /etc/fstab accordingly
i installed palo with the following command

/opt/palinux/palo-src/palo/palo -I -k /hydra/hppa/boot/vmlinux -b
/opt/palinux/palo-src/iplboot  -c '3/boot/vmlinux TERM=linux HOME=/
root=/dev/sdb3' /dev/sdb


well, i used /dev/sdb since there is also the scsi fd (id 0)
that is /dev/sda IMHO (i tested alos to use root=/dev/sda3 btw).

some of the boot messages

PDC ROM rev. 2.1
IODC ROM rev. 2.1
32 MB of memory configured and tested.



Selecting a system to boot.

Hard booted.

[...]
now it prints the palo configuration as i installed it
and the hd partition scheme (but /dev/idaXYZ instead of /dev/sdbXYZ
[...]
ext2 block size 1024
ext2_open(/boot/vmlinux) = 3
ext2_mount(partition 3) returns 0
ELF32 executable
[...]

now all recognized devices (SGC craphics, BA, HIL, LAN, 2x RS232, SCSI,
EISA, Core Centronics, HP model 'king Cobra' ...)

the kernel boots actually, but i dumps the stack register and the
processor registers (not included in this mail) after

ASP version 1 at ..... found


thats all.
no message like 'unable to boot root fs' or something ...

any help ?

PS: i tried to use a IBM0664 2.0GB scsi hd before (works fine on
linux/ia32), but i couldn't get it work on hp (i reported this
in a former mail).

PPS: just FYI: the same configuration worked with HP/UX 10.10
