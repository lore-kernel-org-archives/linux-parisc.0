Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF6B4482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 08:40:08 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 06BC1B00C; Wed, 11 Jul 2001 15:38:49 +0100 (BST)
Date: Wed, 11 Jul 2001 15:38:49 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Pedot, Wolfgang" <wpedot@harris.com>
Cc: 'Parisc Linux Mailinglist' <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Install on a 715/75 (wont boot)
Message-ID: <20010711153849.N18375@linuxcare.com>
References: <8D4C69676E66D511A1CB00508BBBB192162685@ranmx1.ran.harris.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <8D4C69676E66D511A1CB00508BBBB192162685@ranmx1.ran.harris.com>; from wpedot@harris.com on Wed, Jul 11, 2001 at 08:29:54AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 11, 2001 at 08:29:54AM -0400, Pedot, Wolfgang wrote:
> 	For 0.9.1 it sounds like you picked up one of the broken versions
> 	of the ISO.  A new image was posted yesterday, so if you downloaded
> 	before that, please try again.
> 
> Ok, i downloaded the new one and it works better but still no installer because
> my machine freezes at "branching to kernel at <addr>". Heres the output:
> 
> Trying scsi.4.0
> Boot path initialized.
> Attemption to load IPL.
> 
> 
> Hard bootet.
> palo ipl 0.92 root@spqr Mon Jun 25 23:03:13 CEST 2001
> 0/vmlinux32 2853588 bytes @ 0x6ad6800
> 0/vmlinux64 3585851 bytes @ 0x6d8f800
> 0/ramdisk 1991209 bytes @ 0x70fb000
> 
> Command line: 'root=/dev/ram console=tty0 sti=0 sti_font=VGA8x16 TERM=linux'

STI console doesn't work on 715/75, you must use a serial console.

> Kernel: partition 0 file /vmlinux
> Ramdisk: partition 0 file /ramdisk
> Warning: kernel name doesn´t end with 32 or 64... Guessing Annoyance: Firmware
> does not support PDC_MODEL_CAPABILITIES call
> 32
> ELF32 executable
> Entry 00100000 first 00100000 n 4
> Segment 0 load 00100000 size 1606948 mediaptr 0x1000
> Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
> Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
> Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8
> Loading ramdisk 1991209 bytes @ 03e09000...
> branching to kernel entry point 0x00100000
> 
> 	0.9 didn't work on 715/75 anyway, but I would not have expected your
> 	particular error.
> 
> 	I have never booted my 715/75 from CD; I've always booted it from
> 	the network.  The README on the CD should explain (briefly) how to
> 	do that.
> 
> 	 
> Well I tried to boot using bootp but it seems the 715 and my bootp-Server don´t
> understand each other. I have a running bootpd but it wont get anything from the
> 715 because it doesnt send UDP-Pakets but LLC-Pakets directly to the given MAC.
> Since I´m new to Parisc-Machine I´m maybe doing something wrong, I press ESC at
> bootup and enter "a" to get to the Boot-Admin-Menu, then I say "boot
> lan.<mac_of_bootp_server>" and I see that there are some LLC-Pakets coming to
> the Bootp-Server but there are no responses....

715/75 uses rbootd, not bootp.  There is a copy in
ftp://puffin.external.hp.com/pub/parisc/binaries/tgz/

Richard
