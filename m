Return-Path: <ica2_ts@csv.ica.uni-stuttgart.de>
Received: from iris1.csv.ica.uni-stuttgart.de (iris1.csv.ica.uni-stuttgart.de
	[129.69.118.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 004CF49B8
	for <parisc-linux@parisc-linux.org>;
	Mon, 12 Apr 2004 12:13:20 -0600 (MDT)
Date: Mon, 12 Apr 2004 20:13:15 +0200
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] Re: if something is not done,
	hppa will not have an installer for sarge
Message-ID: <20040412181315.GA27939@rembrandt.csv.ica.uni-stuttgart.de>
References: <20040411165459.GB11699@kitenet.net>
	<20040411171831.GA15032@mcmartin.ca>
	<20040411174629.GA12562@kitenet.net>
	<20040412111257.GS20209@linuxcare.com>
	<1081779569.1804.11.camel@mulgrave>
	<20040412150556.GT20209@linuxcare.com>
	<1081782948.2234.26.camel@mulgrave>
	<20040412171529.GU20209@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040412171529.GU20209@linuxcare.com>
From: Thiemo Seufer <ica2_ts@csv.ica.uni-stuttgart.de>
Cc: debian-boot@lists.debian.org, parisc-linux@parisc-linux.org,
	debian-hppa@lists.debian.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Richard Hirst wrote:
[snip]
> > I think just reducing the command line would be the best option.  Why's
> > it so long?
> 
> This is the cmdline when booting from the aforementioned ISO:
> 
> Command line for kernel: 'ramdisk_size=8192 root=/dev/ram      devfs=mount,dall 
> init=/linuxrc DEBCONF_PRIORITY=high console=tty0 sti=8/24 sti_font=VGA8x16 TERM=
> linux palo_kernel=0/vmlinux'

> Note palo has added at least
> "console=tty0 sti=8/24 sti_font=VGA8x16 TERM=linux palo_kernel=0/vmlinux"
> 
> which looks like 71 of our 127 chars - hence my comment about
> whether or not the 127 char limit is supposed to include the
> bits added by palo.
> 
> If we just take the part that is passed to palo when the ISO is
> mastered, I guess that is
> 
> "ramdisk_size=8192 root=/dev/ram      initrd=0/ramdisk devfs=mount,dall init=/linuxrc DEBCONF_PRIORITY=high"

I doubt all of these are needed. At least root= and devfs= aren't
in use any more on other d-i arches, same for linuxrc.

The TERM=linux mentioned above looks a bit weird to me, shouldn't
it be default anyway?


Thiemo
