Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46078482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 05:54:17 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C36DDB007; Fri,  8 Jun 2001 12:50:30 +0100 (BST)
Date: Fri, 8 Jun 2001 12:50:30 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "KIMHI,YEHOSHUA (HP-Israel,ex1)" <yehoshua_kimhi@hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Installation of palinux-0.9-32serial.iso
Message-ID: <20010608125030.M16532@linuxcare.com>
References: <733CA39D4982D411AD080090278CBE390CD8D2@shalom.israel.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <733CA39D4982D411AD080090278CBE390CD8D2@shalom.israel.hp.com>; from yehoshua_kimhi@hp.com on Fri, Jun 08, 2001 at 01:14:43AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 08, 2001 at 01:14:43AM +0200, KIMHI,YEHOSHUA (HP-Israel,ex1) wrote:
> I am trying to install the palinux-0.9-32serial.iso 715/G machine with
> serial console.
> The machine boot from the CD but at the stage of the packages installation
> it fail 
> It claim that the packages are corrupted.
> I tried to use the shell and mount the file system /dev/sda3. Then I copied
> the whole CDROM to this file system.
> Then I tried to install the base from this mountable file system.
> It fail on the first package claiming that it can't download 'adduser'
> package.
> I don't have any other linux machine around so I can't use the NFSROOT
> option (I mean follows the NFS-root-howto and compilation of new kernel with
> the IP of NFS server etc..)
> I do have around hp-ux machines, Is there a way to compile kernels on hp-ux?
> Is there a way to continue from this stage??
> Maybe install in some way the NFS and then mount file system which contain a
> tarball of nfsroot??
> Any other suggestion workarounds etc.. will be most helpful.

Don't know what your problem is, it seems you have installed the
kernel and modules from CD (or local disk) without problems, but
have trouble with the base system files.  Failing on adduser can
often mean a problem with the Packages file.

Have you rechecked your CD to make sure the md5sum is right?

You might also scroll down the installer menu to 'Execute a shell',
and then do md5sum on some files to check they are being read
properly.  Files worth checking are:

105fbd1a274528ca2b5cc93fd3b9dd08  debian/dists/sid/Release
1ab866241b09154589453958ebab8673  debian/dists/sid/main/binary-hppa/Release
f37073f9eb41413815e44285bcbb02a6  debian/dists/sid/main/binary-hppa/Packages
51235d20debb1ffce01732b3bff129ee  debian/dists/sid/main/binary-hppa/Packages.gz
340a87e3412321b4ac2c0522b23c7a70  debian/dists/sid/main/binary-hppa/base/adduser_3.36_all.deb
