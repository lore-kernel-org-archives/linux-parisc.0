Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from imhotep.aubi.de (mail.aubi-online.de [62.159.82.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4BABA4846
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Oct 2001 14:15:21 -0600 (MDT)
Received: from exchangeb.aubi.de ([170.56.121.7])
	by imhotep.aubi.de (8.11.5/SUN/AUBI/8.9.3) with ESMTP id f99KFFn17312
	for <parisc-linux@lists.parisc-linux.org>; Tue, 9 Oct 2001 21:15:15 +0100 (WET DST)
Message-ID: <7B1EED0C5D58D411B73200508BDE77B2C53CA8@EXCHANGEB>
From: =?iso-8859-1?Q?Markus_D=F6hr?= <doehrm@aubi.de>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Tue, 9 Oct 2001 22:15:09 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Newbie on PA: Trying to compile kernel
List-ID: <linux-parisc.vger.kernel.org>

I just installed 0.9.2 on a 712/60 and I'm happy linux'ing ;-)

However, when trying to compile a cvs checked-out kernel I'm always getting
ramdisk.bin not found. I searched the archives, found some notes on where to
find one but on the site specified there are no.

Here's my disk setup:

sda1  Boot   Primary   Linux/PA-RISC boot       24.68
sda2         Primary   Linux ext2             4096.19
sda3         Primary   Linux swap              172.74

I'm not sure if I even need one.

hppaubi:~# cat /etc/palo.conf
# obsolete with palo-0.94 # --bootloader=/boot/iplboot
--commandline=2/boot/vmlinux-2.4.0 root=/dev/sda2 HOME=/
--recoverykernel=/boot/vmlinux-2.4.0
--init-partitioned=/dev/sda

Can anyone please point me to the right direction?

Thanx a lot!


-- 
Markus Doehr            AUBI Baubschlaege GmbH
IT Admin/SAP R/3 Basis  Zum Grafenwald
fon: +49 6503 917 152   54411 Hermeskeil
fax: +49 6503 917 190   http://www.aubi.de 
