Return-Path: <richard@sleepie.demon.co.uk>
Received: from sleepie.demon.co.uk (cpc1-hem11-4-0-cust109.lutn.cable.ntl.com
	[80.2.252.109])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C0614925
	for <parisc-linux@parisc-linux.org>;
	Mon, 12 Apr 2004 11:16:40 -0600 (MDT)
Date: Mon, 12 Apr 2004 18:15:29 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Re: if something is not done,
	hppa will not have an installer for sarge
Message-ID: <20040412171529.GU20209@linuxcare.com>
References: <20040411165459.GB11699@kitenet.net>
	<20040411171831.GA15032@mcmartin.ca>
	<20040411174629.GA12562@kitenet.net>
	<20040412111257.GS20209@linuxcare.com>
	<1081779569.1804.11.camel@mulgrave>
	<20040412150556.GT20209@linuxcare.com>
	<1081782948.2234.26.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1081782948.2234.26.camel@mulgrave>
Cc: Kyle McMartin <kyle@mcmartin.ca>, debian-boot@lists.debian.org,
	parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Apr 12, 2004 at 10:15:46AM -0500, James Bottomley wrote:
> On Mon, 2004-04-12 at 10:05, Richard Hirst wrote:
> > Unbootable, or unbootable on 64 bit h/w?
> 
> It seems to be unbootable entirely, but for 32 bit kernels that's random
> (sometimes it will, sometimes it won't).
> 
> > > Unfortunately, palo is rather poor about checking this limit when
> > > installing the image or modifying the command line...
> > 
> > and last time I tried building palo on a sid system to investigate
> > these hangs on boot, the result didn't work at all :(
> 
> I think just reducing the command line would be the best option.  Why's
> it so long?

This is the cmdline when booting from the aforementioned ISO:

Command line for kernel: 'ramdisk_size=8192 root=/dev/ram      devfs=mount,dall 
init=/linuxrc DEBCONF_PRIORITY=high console=tty0 sti=8/24 sti_font=VGA8x16 TERM=
linux palo_kernel=0/vmlinux'

Looks like 162 chars to me.

You can deduce how much of that comes from the d-i build process and how
much is manufactured by palo on boot from the start of the ISO:

0000000: 8000 5041 4c4f 0003 00c8 e000 003d fddd  ..PALO.......=..
0000010: 0053 5000 001b e9de 302f 766d 6c69 6e75  .SP.....0/vmlinu
0000020: 7820 7261 6d64 6973 6b5f 7369 7a65 3d38  x ramdisk_size=8
0000030: 3139 3220 726f 6f74 3d2f 6465 762f 7261  192 root=/dev/ra
0000040: 6d20 2020 2020 2069 6e69 7472 643d 302f  m      initrd=0/
0000050: 7261 6d64 6973 6b20 6465 7666 733d 6d6f  ramdisk devfs=mo
0000060: 756e 742c 6461 6c6c 2069 6e69 743d 2f6c  unt,dall init=/l
0000070: 696e 7578 7263 2044 4542 434f 4e46 5f50  inuxrc DEBCONF_P
0000080: 5249 4f52 4954 593d 6869 6768 0000 0000  RIORITY=high....

I don't know what default ramdisk size we build the kernel for, but
it needs to be over 6MB (initrd is 6449152 bytes this time).

Note palo has added at least
"console=tty0 sti=8/24 sti_font=VGA8x16 TERM=linux palo_kernel=0/vmlinux"

which looks like 71 of our 127 chars - hence my comment about
whether or not the 127 char limit is supposed to include the
bits added by palo.

If we just take the part that is passed to palo when the ISO is
mastered, I guess that is

"ramdisk_size=8192 root=/dev/ram      initrd=0/ramdisk devfs=mount,dall init=/linuxrc DEBCONF_PRIORITY=high"

which is well under 127.

Richard
