Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ksmail.netcologne.de (ksmail.netcologne.de [194.8.194.97])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3A31482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Apr 2001 11:36:02 -0600 (MDT)
Received: from gandalf.sigtrap.de (dial-194-8-209-49.netcologne.de [194.8.209.49])
	by ksmail.netcologne.de (8.9.3/8.9.3) with ESMTP id TAA21831
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Apr 2001 19:35:53 +0200 (MET DST)
Received: (from flimm@localhost)
	by gandalf.sigtrap.de (8.9.3/8.9.3/Debian 8.9.3-21) id TAA02911
	for parisc-linux@lists.parisc-linux.org; Wed, 18 Apr 2001 19:35:53 +0200
From: Oliver Flimm <flimm@sigtrap.de>
Date: Wed, 18 Apr 2001 19:35:53 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] dumb question of the day
Message-ID: <20010418193553.D772@sigtrap.de>
Reply-To: flimm@sigtrap.de
References: <3ADE00FC.9679.982D3D@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ADE00FC.9679.982D3D@localhost>; from plaven@ozemail.com.au on Wed, Apr 18, 2001 at 09:02:52PM +1000
List-ID: <linux-parisc.vger.kernel.org>

Hi,

On Wed, Apr 18, 2001 at 09:02:52PM +1000, Pete wrote:
> I grabbed rboot and set it up and didn't work, so I have set bootps 
> and tftp according to the howto at http://www.oswg.org/oswg-
> nightly/oswg/en_US.ISO_8859-1/articles/parisc-linux/parisc-linux-
> boot.html  (very helpful too I might add)

hmm, very nice indeed.

> from boot_admin I boot lan, I have tcpdump listening on eth1 where 

Did you do a 'search' to get the correct lan boot path and then add it with
eg. path lan 192.168.2.1.3?

> the hppa box is connected via aui/TP and UTP cross over.  I can 
> see the broadcast and /var/log/messages shows that tftp is looking 
> for iplboot, as copied from the tar ball boot dir.

iplboot is only the file with the information about the bootsignature - the
bootloader (see below, its much too small for a Linux kernel), not the
kernel. palo needs this file and your out of the box (read: eg. compiled)
vmlinux to build a lifimage. That's the file you'll need as the bootable
kernel.

> The hp box fails with an error on the console (I have a vga screen 
> on the box):
> 
> "ERROR: Cannot load IPL, error detected."

I don't use the base tarball for netbooting just afterwards for the actual
installation on harddisk. Instead of this tarball I use the tarball
distributed via http://mkhppa1.esiee.fr/en/download.html
(fs_hd_20010320.tar.gz_global) for netbooting. But that's a historical
issue, everything should also work with the base tarball ;-)

So I don't know anything about the kernel in the base tarball. I use a
crosscompiler built from cvs to build a proper kernel capable of netbooting.
IIRC you have to compile the following options into the kernel:

root-nfs support
bootp support

and of course the other appropriate network drivers and options.

After compiling you'll get a vmlinux. This file isn't bootable because a
special bootsignature - the bootloader - is still lacking. To make the
kernel net-bootable you have to use palo with the following option set in
its Makefile:

NFSROOT = 192.168.2.1

(when 192.168.2.1 is the IP of the server that's providing the root-FS for
your HP9000).

With your crosscompiler environment correctly setup its just a matter of
'make xconfig;make dep;make clean;make palo'

As a result I get a lifimage, rename it to vmlinux and then use this file
for netbooting from /usr/tftpboot.

> Since this is my first time with nfsbooting it's likely I'm not doing 
> something right there, ie, I don't have /etc/exports setup.. should I 
> od this?

Yes, unless you want a nfsroot-boot without nfsroot ;-) And don't forget to
modify the following files in the nfs-root tree on your nfs-server (apart
from starting your nfs-server ;-):

/etc/inittab (as the files below its something like /usr/thisismyrootfs/etc/inittab) 

make sure you really have a getty waiting for you. I had a problem with this
once (possibly my own fault) but now I make sure each time.

/etc/fstab:

Insert the appropriate entry for your remote root-FS apart from a proc-entry, eg.

gandalf:/usr/tftpboot/boromir          /               nfs     defaults 0 0

Here gandalf is my nfs-root server and /usr/tftpboot/boromir is the toplevel
directory for the nfsroot tree of my 715/80 called boromir.

/etc/securetty:

Add 

ttyp0
ttyp1
ttyp2
ttyp3
ttyp4
ttyp5
ttyp6
ttyp7
ttyp8

when you want to do a telnet to your HP9000 (and your nfs-root provides a
telnet ;-). Some might consider this a security hole, but my machine is
secured from the internet, so I don't care ;-)

/etc/hosts:

Enter the IP and name of your HP9000 and your nfs-root server, eg:

127.0.0.1       localhost
192.168.2.8     boromir.sigtrap.de boromir
192.168.2.1     gandalf.sigtrap.de gandalf

/etc/hostname:

Insert your hostname in this file.

/etc/resolv.conf:

Insert your nameserver in this file, eg:

domain sigtrap.de
search sigtrap.de
nameserver 192.168.2.1

And now for the most important file:

/etc/network/interfaces:

Her you have to configure eth0, eg:

iface eth0 inet static
 address 192.168.2.8
 network 192.168.2.0
 netmask 255.255.255.0
 broadcast 192.168.1.255
 gateway 192.168.2.1
     
 iface lo inet loopback

Without our eth0 correctly set up and running you'll have problems to mount
your nfs-root via /etc/fstab.

On the bootp-server (which is also my nfsroot-server) you have to configure
/etc/bootptab, eg:

.global.prof:\
        :sm=255.255.255.0:\
	:ds=192.168.2.1:\
	:gw=192.168.2.1:\
	:sa=192.168.2.1:\
	:ht=ethernet:\
	:bf=vmlinux:
						

boromir:hd=/usr/tftpboot:rp=/usr/tftpboot/boromir:tc=.global.prof:hn:ha=ffffffffffff:ip=192.16
8.2.8:vm=rfc1048:

Insert your MAC-adress instead of ffffffffffff.

I hope that was all and I didn't mix up everything said ;-)

Perhaps the snippets of information can help you to get your machine up and
running.

Regards,

Oliver

-- 
!- Oliver Flimm - Cologne/Germany | flimm@sigtrap.de | http://www.sigtrap.de/ -!
!    Die Zehn Gebote haben 279 Woerter, die amerikanische Unabhaengigkeits-    !
! erklaerung hat 300 Woerter. Die EU-Verordnung zur Einfuhr von Karamelbonbons !
!-----------------------------  hat 25911 Woerter  ----------------------------!
