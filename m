Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id ACA6E482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Jul 2002 10:07:32 -0600 (MDT)
Date: Tue, 23 Jul 2002 17:59:59 +0200 (CEST)
From: Peter Mottram <peter@petescaff.com>
To: phi <phi@hpfrcu81.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C180 FWSCSI e2fs coruption
In-Reply-To: <3D3D7B3D.650C1855@hpfrcu81.france.hp.com>
Message-ID: <Pine.LNX.4.44.0207231758280.18468-100000@r6.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

A well known problem - almost certainly due to an old kernel rev + the NCR
SCSI controller on the C180 - see:

http://parisc-linux.org/release-0.9/errata-093.html

....look for the 'Filesystem Corruption' section

R.
PeteM

On Tue, 23 Jul 2002, phi wrote:

> Hi,
>
> I try to setup a C180. I have no CD and 'may be' my problems come from there.
>
> I have a bootable external drive (that use to run on a 712) I boot this
> external drive from the C180, it boot narrow ilp32, from there I partionion
> the internal FWSCSI drive, 3 partition, it look like this
>
> iws1pb02:/# fdisk /dev/sda
>
> Command (m for help): p
>
> Disk /dev/sda: 133 heads, 62 sectors, 1017 cylinders
> Units = cylinders of 8246 * 512 bytes
>
>    Device Boot    Start       End    Blocks   Id  System
> /dev/sda1   *         1         8     32953   f0  Linux/PA-RISC boot
> /dev/sda2             9        50    173166   82  Linux swap
> /dev/sda3            51      1017   3986941   83  Linux
>
> Then I made mkswap, mke2fs, then I cpio -p the external disc onto the internal
> disc (after a mount of the external disc).
>
> I rm /etc/mtab and reboot the internal disc, I boot isl to tune the kernel
> runstring, then I got something that works....
>
> The idea then is to refresh the 'old' booted distro with a mega apt-get
> upgrade, all went fine until apt-get start displaying things like this
>
> ..............
>
> Err http://ftp.fr.debian.org unstable/main libgnorba27 1.4.1.7-2
>   Could not open file
> /var/cache/apt/archives/partial/libgnorba27_1.4.1.7-2_hppa.deb - open (30
> Read-only file system)
>
> ............
>
> Apparently the / wne RO because of coruption detected.
>
> And a quick look of file showing
>
> phi@iws1pb02:/usr$ find .
> find: ./share/doc/xserver-common: Input/output error
> find: ./share/doc/liblcms: Input/output error
> find: ./share/perl/5.6.1/bigfloat.pl: Input/output error
> find: ./share/perl/5.6.1/bigint.pl: Input/output error
> find: ./share/perl/5.6.1/bigrat.pl: Input/output error
>
>
> At this stage the FS is real corupted, and fsck -y can correct, but many files
> are lost.
>
> I am doing something wrong? does e2fs survive that big FS partition? Does the
> FWSCSI reliable? May be my disc is shaky?
>
>
> Thanx in advance for any sugestions
> Phi
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
