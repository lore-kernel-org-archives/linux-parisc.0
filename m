Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA25880
	for <parisc-linux@puffin.external.hp.com>; Thu, 3 Aug 2000 18:57:35 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by cosrel2.hp.com (Postfix) with ESMTP id 16A76208
	for <parisc-linux@thepuffingroup.com>; Thu,  3 Aug 2000 18:59:28 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Cc: taggart@carmen.fc.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 03 Aug 2000 19:01:15 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000804010116.10DB1381A0@carmen.fc.hp.com>
Subject: [parisc-linux] New toolchain, userspace apps, nfsroots, ramdisk, and lifimage
List-ID: <linux-parisc.vger.kernel.org>

Hi palinux'ers,

In building the PA/Linux Developer's Release CD for Linux World Expo, Paul 
Bame and I have packaged up some new bits.

New x86linux -> palinux cross toolchain,
ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20000802.tgz

Apps built using the new toolchain in,
ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/

A small nfsroot containing some basic commands to play with,
ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/
	nfsroot-small-20000803.tgz

A big nfsroot containing everything we've built so far. This is what the
root filesystem will be on this release of the PA/Linux Developer's CD(or
close to it)
ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/
	nfsroot-20000803.tgz

A small ramdisk containing a limited set the newly compiled apps,
ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks/ramdisk.bin-20000803

A lifimage using the current CVS kernel bits and the above ramdisk,
ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/Image-20000803

You can also use the above lifimage to boot from other sources(like an 
nfsroot) by,

- Interrupt the boot
- boot from your bootp server adding the "ipl" option
- edit the boot command line (example: nfsroot=192.168.1.10:/tftpboot/nfsroot)

We will be posting the final snapshot of this version(0.1) of the PA/Linux 
Developer's Release CD sometime tommorrow.

Feedback would be greatly apprecicated.

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com
