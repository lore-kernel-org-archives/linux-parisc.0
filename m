Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA26345
	for <parisc-linux@puffin.external.hp.com>; Fri, 30 Jun 2000 13:39:01 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by cosrel1.hp.com (Postfix) with ESMTP id 8390D70C
	for <parisc-linux@thepuffingroup.com>; Fri, 30 Jun 2000 13:40:11 -0600 (MDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id EE49F37E33
	for <parisc-linux@thepuffingroup.com>; Fri, 30 Jun 2000 13:41:48 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_-6386702340"
Date: Fri, 30 Jun 2000 13:41:48 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000630194149.EE49F37E33@carmen.fc.hp.com>
Subject: [parisc-linux] e2fsprogs available
List-ID: <linux-parisc.vger.kernel.org>

This is a multipart MIME message.

--==_Exmh_-6386702340
Content-Type: text/plain; charset=us-ascii

A cross-compiled e2fsprogs is now available at,

ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/e2fsprogs-20000630.t
gz

This is the 1.19-WIP-0527a version of e2fsprogs from sourceforge. Attached is 
the build recipe.

I also placed a pseudoroot tarball of Paul Bame's fdisk is at,

ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/fdisk-20000630.tgz

I updated the /dev tarball(in the same directory) to add the scsi device 
families.  I have placed a version of the nfsroot tarball that includes all of 
these updates at,

ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/nfsroot-latest.tar.gz

Using the above I was able to natively partition, mke2fs, mount, create files, 
execute files, umount, and fsck using the scsi disk in my 712.

Please give it a try.

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com


--==_Exmh_-6386702340
Content-Type: text/plain ; name="e2fs.recipe"; charset=us-ascii
Content-Description: e2fs.recipe
Content-Disposition: attachment; filename="e2fs.recipe"


export CROSSPREFIX=hppa1.1-linux-
export CC=${CROSSPREFIX}gcc
export GCC=${CROSSPREFIX}gcc
export LD=${CROSSPREFIX}gcc
export AS=${CROSSPREFIX}as
export AR=${CROSSPREFIX}ar
export RANLIB=${CROSSPREFIX}ranlib
export STRIP=${CROSSPREFIX}strip
export IMAKECPP=${CROSSPREFIX}cpp
./configure --build=i386-linux \
		--host=hppa1.1-linux \
		--with-cc=hppa1.1-linux-gcc \
		--with-linker=hppa1.1-linux-ld \
		--disable-dynamic-e2fsck

make
make install DESTDIR=/home/taggart/puffin/userspace/e2fsprogs/tmp

--==_Exmh_-6386702340--
