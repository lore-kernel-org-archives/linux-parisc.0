Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C5814846
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Oct 2001 15:22:38 -0600 (MDT)
Sender: marteaut@esiee.fr
Message-ID: <3BC36920.A41682BD@esiee.fr>
Date: Tue, 09 Oct 2001 23:16:16 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Markus =?iso-8859-1?Q?D=F6hr?= <doehrm@aubi.de>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Newbie on PA: Trying to compile kernel
References: <7B1EED0C5D58D411B73200508BDE77B2C53CA8@EXCHANGEB>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Markus,
 
> I just installed 0.9.2 on a 712/60 and I'm happy linux'ing ;-)
Good to hear that! I hope you enjoy :)

> However, when trying to compile a cvs checked-out kernel I'm always getting
> ramdisk.bin not found. I searched the archives, found some notes on where to
> find one but on the site specified there are no.

First of all, a reminder about the CVS. You have all the infos about it
at 
 http://www.parisc-linux.org/tools/index.html#anoncvs

After, for the cross-compiling, you need to download the xc here
ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-latest.tgz

You untar the archive from the / and add the path in your $PATH
Something like that:
export PATH=/opt/palinux/bin:$PATH #for bash, of course

then you go in linux directory, you do make menuconfig with the good
choice.

then make dep vmlinux and you upload your kernel on the 712 via ftp.

Till you are not sure of your compiling talents, the good idea is to
copy the vmlinux file in /boot with a name
slightly different of the old one. like that you have in /boot
vmlinux-2.4.0 and vmlinux.2.4.0-new, for example.

At the boot time, you press escape to enter in BOOT_ADMIN and type boot
pri ipl and you modify the 0 entry to point
the good file! That's all.

If you want to know more, try 
http://mkhppa1.esiee.fr/parisc-linux-boot/parisc-linux-boot/index.html

Good luck, Thomas.
ESIEE Team
