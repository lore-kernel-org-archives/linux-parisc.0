Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA20871
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 02:00:22 -0700
Message-ID: <001501c04fac$2d2f07c0$a832d793@esiee.fr>
From: "Thomas Marteau" <marteaut@esiee.fr>
To: <parisc-linux@thepuffingroup.com>, "Jack Perdue" <j-perdue@tamu.edu>
References: <4.3.0.20001115132700.00cc91b0@clavin.cs.tamu.edu>
Subject: Re: [parisc-linux] nfsroot - 712/60 - RPC - help
Date: Thu, 16 Nov 2000 10:04:07 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi Jack,

> (c) Copyright 1990-1993, Hewlett-Packard Company.
> All rights reserved
>
> Press <ESCAPE> to stop boot sequence.
> Selecting a system to boot.
>
> Booting
> palo ipl jkp2866@redtower Wed Nov 15 12:44:21 CST 2000
> 0/vmlinux 1606438 bytes @ 0x6800
> 0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs
nfsroot=192.68.1.11:/tftpboot/pancho '

Are you sure that the command line is rigth? Is your Server address is
192.-68-.1.11
Here is probably your mistake!

Bye,

ESIEE Team
Visit http://www.esiee.fr/puffin

> Kernel: partition 0 file /vmlinux
> ELF32 executable
>
> Entry 00100000 first 00100000 n 4
> Segment 0 load 00100000 size 1097900 mediaptr 0x1000
> Segment 1 load 0020e000 size 150520 mediaptr 0x10e000
> Segment 2 load 00234000 size 55900 mediaptr 0x133000
> Segment 3 load 00244000 size 8192 mediaptr 0x141000
> branching to kernel entry point 0x00100000
> Set default PSW W bit to 0
> PDC Console Initialized
> The 32-bit Kernel has started...
> Enabled FP coprocessor
> Free memory starts at: 0xc026e000
> start_parisc(0x504d6c,0x504d6c,0x0,0x0)
> PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs
nfsroot=192.68.1.11:/tftpboot/pancho '
> PALO initrd 0-0
> model   00006000 00000481 00000000 00000000 77564139 00000000 00000004
00000072 00000072
> vers    0000000a
> CPUID vers 0 rev 0
> Searching for devices in PDC firmware... processor hpa 0xfffbe000
>   an older box...
> Found devices
