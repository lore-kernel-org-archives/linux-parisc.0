Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E568482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Jul 2002 09:49:38 -0600 (MDT)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 77F27129A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Jul 2002 17:49:36 +0200 (METDST)
Message-ID: <3D3D7B3D.650C1855@hpfrcu81.france.hp.com>
Date: Tue, 23 Jul 2002 17:50:21 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
References: <20020723065037.4D5D2482C@dsl2.external.hp.com> <1027414345.3d3d19494be24@webmail.tiscalinet.be> <3D3D2383.7070708@itp.bg> <1027435942.3d3d6da6ab4c6@webmail.tiscalinet.be>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] C180 FWSCSI e2fs coruption
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

I try to setup a C180. I have no CD and 'may be' my problems come from there.

I have a bootable external drive (that use to run on a 712) I boot this
external drive from the C180, it boot narrow ilp32, from there I partionion
the internal FWSCSI drive, 3 partition, it look like this

iws1pb02:/# fdisk /dev/sda 

Command (m for help): p

Disk /dev/sda: 133 heads, 62 sectors, 1017 cylinders
Units = cylinders of 8246 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1         8     32953   f0  Linux/PA-RISC boot
/dev/sda2             9        50    173166   82  Linux swap
/dev/sda3            51      1017   3986941   83  Linux

Then I made mkswap, mke2fs, then I cpio -p the external disc onto the internal
disc (after a mount of the external disc).

I rm /etc/mtab and reboot the internal disc, I boot isl to tune the kernel
runstring, then I got something that works....

The idea then is to refresh the 'old' booted distro with a mega apt-get
upgrade, all went fine until apt-get start displaying things like this

..............

Err http://ftp.fr.debian.org unstable/main libgnorba27 1.4.1.7-2
  Could not open file
/var/cache/apt/archives/partial/libgnorba27_1.4.1.7-2_hppa.deb - open (30
Read-only file system)

............

Apparently the / wne RO because of coruption detected.

And a quick look of file showing

phi@iws1pb02:/usr$ find . 
find: ./share/doc/xserver-common: Input/output error
find: ./share/doc/liblcms: Input/output error
find: ./share/perl/5.6.1/bigfloat.pl: Input/output error
find: ./share/perl/5.6.1/bigint.pl: Input/output error
find: ./share/perl/5.6.1/bigrat.pl: Input/output error


At this stage the FS is real corupted, and fsck -y can correct, but many files
are lost.

I am doing something wrong? does e2fs survive that big FS partition? Does the
FWSCSI reliable? May be my disc is shaky?


Thanx in advance for any sugestions
Phi
