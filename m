Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0EA13482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Aug 2002 10:29:36 -0600 (MDT)
To: "Alex Green" <alexdgreen@hotmail.com>
Cc: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo issues 
In-Reply-To: Your message of "Wed, 07 Aug 2002 18:05:54 +0200."
             <OE66fNykoS1Nz19qG9600002f67@hotmail.com>
References: <OE22Aztxc1o8yfogkJX00009958@hotmail.com> <20020807123807.GB9966@systemhalted> <OE50nwpGR881Np7vXee0000cb29@hotmail.com> <E17cSWK-0000pp-00@paul.bame> <OE62f84mtceYvUAA3qj0000304b@hotmail.com> <E17cSja-0000tS-00@paul.bame> <OE59QOuE3chAHrey7dl000009a1@hotmail.com> <E17cSwB-0000wS-00@paul.bame>  <OE66fNykoS1Nz19qG9600002f67@hotmail.com> 
Date: Wed, 07 Aug 2002 10:29:32 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E17cTgj-00012Z-00@paul.bame>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

	**** BOTH THE F0 PARTITION AND THE EXT2 PARTITION	****
	**** WHERE PALO IS TOLD TO FIND THE KERNEL _MUST_ BE	****
	**** CONTAINED WITHIN THE FIRST 2G OF THE DISK		****
	http://parisc-linux.org/software/install.html

> >     The partition where palo expects to find 'vmlinux' _ends_ within the
> >     first 2G of the disk?

In your case (thanks for all the info!) palo is being asked to load the
kernel from partition 4.

> --commandline=4/boot/vmlinux-64 root=/dev/sda4 HOME=/

Partition 4 is _NOT_ contained within the first 2G.

> /dev/sda4          1049     17366  16709632   83  Linux

Sorry my question wasn't clearer.  Perhaps you can turn sda2 or 3 into
a /boot partition, or something more drastic...

> Yep, the f0 partition is the first 75mb of the disk:
> 
> 
> Disk /dev/sda: 64 heads, 32 sectors, 17366 cylinders
> Units = cylinders of 2048 * 512 bytes
> 
>    Device Boot    Start       End    Blocks   Id  System
> /dev/sda1   *         1        72     73712   f0  Linux/PA-RISC boot
> /dev/sda2            73       560    499712   82  Linux swap
> /dev/sda3           561      1048    499712   82  Linux swap
> /dev/sda4          1049     17366  16709632   83  Linux
> 
> 
> mount
> /dev/sda4 on / type ext3 (rw,errors=remount-ro)
> proc on /proc type proc (rw)
> devpts on /dev/pts type devpts (rw,gid=5,mode=620)
> /proc/bus/usb on /proc/bus/usb type usbdevfs (rw)
> 
> 
> cat /etc/palo.conf
> --commandline=4/boot/vmlinux-64 root=/dev/sda4 HOME=/
> --recoverykernel=/boot/vmlinux
> --init-partitioned=/dev/sda
> 
> 
> ls -l
> total 11912
> -rw-r--r--    1 root     root       881069 Aug  7 10:23 System.map-2.4.18-64
> -rw-r--r--    1 root     root       900165 Aug  7 18:04 System.map-64
> -rw-r--r--    1 root     root         4711 Aug  7 10:23 config-2.4.18-64
> lrwxrwxrwx    1 root     root           17 Aug  7 10:26 vmlinux ->
> vmlinux-2.4.18-64
> -rw-r--r--    1 root     root      5139673 Aug  7 10:23 vmlinux-2.4.18-64
> -rwxr-xr-x    1 root     root      5227388 Aug  7 18:04 vmlinux-64
> 
> 
> palo
> palo version 1.1 bame@c3k Tue Aug  6 09:40:01 MDT 2002
> ELF64 executable
> Partition Start(MB) End(MB) Id Type
> 1               1      72   f0 Palo
> 2              73     560   82 swap
> 3             561    1048   82 swap
> 4            1049   17366   83 ext2
> ipl: addr 16384 size 30720 entry 0x0
>  ko 0x0 ksz 0 k64o 0x0 k64sz 0 rdo 0 rdsz 0
> <4/boot/vmlinux-64 root=/dev/sda4 HOME=/>
> ipl: addr 16384 size 30720 entry 0x0
>  ko 0x0 ksz 0 k64o 0x44000 k64sz 5139673 rdo 0 rdsz 0
> <4/boot/vmlinux-64 root=/dev/sda4 HOME=/>
> 
> 
> file vmlinux-64
> vmlinux-64: ELF 64-bit MSB executable, PA-RISC 2.0 (LP64) version 1
> (GNU/Linux), dynamically linked (uses shared libs), not stripped
> mohawk:/boot# file vmlinux-2.4.18-64
> vmlinux-2.4.18-64: ELF 64-bit MSB executable, PA-RISC 2.0 (LP64) version 1
> (GNU/Linux), dynamically linked (uses shared libs), not stripped
> mohawk:/boot#
> 
> 
> Does this shed any light ??
> 
> Thanks
> AG
> 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
