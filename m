Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57EAD482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 13:53:25 -0600 (MDT)
Message-Id: <m15L906-000OU0C@bame.riverrock.org>
To: "Yan Han" <yhan@uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Palo not running -- "Installing Pa-risc linux problem" 
In-Reply-To: Your message of "Fri, 13 Jul 2001 14:50:35 EDT."
             <001101c10bcc$b3559990$d10c6481@HCI009>
References: <20010630122236.A6437@megatonmonkey.net> <Pine.SOL.4.21.0107041427510.19435-100000@panther.uwo.ca> <20010704155338.E11831@megatonmonkey.net>  <001101c10bcc$b3559990$d10c6481@HCI009> 
Date: Fri, 13 Jul 2001 13:53:22 -0600
From: Paul Bame <bame@riverrock.org>
List-ID: <linux-parisc.vger.kernel.org>

> We came across a question of following the instrustuion in "INstalling
> pa-risc linux" (www.parisc-linux.org/software/install.html". in
> Step 8  "Initialize the boot loader (roughly equivalent to lilo): *** NOTE
> *** change both '3's in the following command to use your partition number
> 		$ palo -k /boot/vmlinux -b /boot/iplboot \
> 			-c '3/boot/vmlinux TERM=linux HOME=/ root=/dev/sda3' \
> 			-I /dev/sda
> "

Palo should have been run as part of the Debian install process and you
should have an /etc/palo.conf.  If you are installing by hand you have more
work to do...

> Question 1 : After booting up from network, we logged in serial console and
> palo is not in HP box.
> so we copied palo from the NFS server into the NFS directory so that the HP
> box can "see it" . However, it cannot run "palo". ( we think that palo is
> compiled under intel chip, and don't like the HP's Risc CPU).

The Debian package for palo is on the CD and in the Debian mirror system.

> 2. We tried to compile "palo" again in HP box, but we cannot compile it?
> any idea about this,

Please use the Debian package.  You can install the Debian package from
the CD with 'dpkg --install palo_<version>.deb'.

If you want help compiling palo please send the output from 'make'.

	-Paul
