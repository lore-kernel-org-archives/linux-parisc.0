Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33080482A
	for <parisc-linux@parisc-linux.org>; Sun,  3 Jun 2001 11:20:51 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1BAB3B007; Sun,  3 Jun 2001 18:17:34 +0100 (BST)
Date: Sun, 3 Jun 2001 18:17:34 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: diab <diab@diab.rulez.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] dead keyboard after booting 0.61 STI32 iso on a  715/100
Message-ID: <20010603181734.K25745@linuxcare.com>
References: <1A8904C3797ED411AC2E0008C7E6F88117C8D0@nlntmail2b.ats.nld.alcatel.nl> <Pine.LNX.4.21.0106031715530.11894-100000@droid3.webreklam.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0106031715530.11894-100000@droid3.webreklam.hu>; from diab@diab.rulez.org on Sun, Jun 03, 2001 at 05:25:48PM +0200
List-ID: <linux-parisc.vger.kernel.org>

The 0.9 release CD does allow you to boot over the network and then
install to a local disk via nfs or http, at least.  The file you
boot is a 'lifimage', and in this case contains a kernel and
ramdisk.  To quote the README on the 0.9 CD:

> The contents of this CD can be used to do network installs on any
> supported system.  To do that, you need to make the CD contents
> available over the network.  Acces via http and nfs have been tested.
> In addition, you need to boot the relevant lifimage file over the
> network to start the install proceedure.  The lifimages are
> 
> debian/dists/sid/main/disks-hppa/current/wide/serial/lifimage
> debian/dists/sid/main/disks-hppa/current/narrow/serial/lifimage
> debian/dists/sid/main/disks-hppa/current/sti/lifimage
> 
> Choose the appropriate one for your needs.  Most machines do a network
> boot via bootp, but some older machines use rbootd.  If you cannot
> find rbootd please visit our web site.
> 
> Installing from the network is a little more involved than from CD, as
> you have to specify more details regarding the archive location.  The
> path you specify for loading kernel and modules should be one of
> ..../current/narrow, ..../current/wide, or ..../current/sti.  The path
> you specify for installing the base system should be ..../debian.

Hope that helps.

Richard.


On Sun, Jun 03, 2001 at 05:25:48PM +0200, diab wrote:
> % Just for the record,
> % Have identical behaviour with c110, with ps/2 keyboard&mouse.
> % Tried 0.6 and 0.6.1, both freezes after the login prompt.....
> found the solution :) its pretty dunb though
> 
> the problem is that 0.6 and 0.61 gives "console=tty" to the kernel on
> boot, instead of "console=tty0" (as in 0.9)
> 
> tried to boot 0.61 (used palo to modify console=tty to tty0) and it works
> flawlessly. ok lets say i was able to bring up eth0 and nfsmount the 0.9
> iso remotely on my linux box. aint got a cd burner here at home so i
> should use nfs somehow. 
> 
> anyways i found no up2date NFS howtos on the
> web, but an old one (2000.02) and somehow the nfsroot=mynfsserverip 
> approach seemed to be not working.. gave me stupid read and seek error codes. 
> 
> anyways can i use the same lif images/kernels to boot from nfs? i dont
> feel like building a cross compiler environment just for this.
> if not - if would be nice to provide nfsboot capable kernel images for the
> cdless people.
> 
> the sti console works fine and everything seems to be ok. this is a
> 715/100. see if i can copy the 0.9 over and make it working
> 
> regards,
> 
> --
> diab
> 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
