Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72E184829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 10:39:12 -0700 (MST)
Date: Sat, 9 Nov 2002 16:31:46 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel build: make palo
In-Reply-To: <20021109145939.U12011@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.BSF.4.44.0211091614510.32930-100000@e0-0.zab2.int.zabbadoz.net>
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

On Sat, 9 Nov 2002, Matthew Wilcox wrote:

> > > Then one could do
> > > 	make dep && make bzImage && make modules
> > > as user, the switch to su and do a
> > > 	make modules_install && make palo
> > > or even run palo by hand...
>
> Nothing stops you from doing:
>
> make vmlinux
> sudo make palo
>
> as two separate steps.

yeah, but that's not the default (==documented) way of building a
linux kernel ;-)

linux/README:
" - Do a "make bzImage" to create a compressed kernel image."

it does not say "and update the config etc of your bootloader"


Also one does not need to run palo if one only substitutes a kernel
image in an ext2 fs I think. So this run does not seem to be
neccessary by default.



I suggest s.th. like the following (untested):

--- linux/arch/parisc/Makefile.orig	2002-11-09 14:43:40.000000000 +0000
+++ linux/arch/parisc/Makefile	2002-11-09 16:19:46.000000000 +0000
@@ -82,7 +82,7 @@
 libs-y					+= arch/parisc/lib/ \
 					   `$(CC) -print-libgcc-file-name`

-palo: vmlinux
+palo:
 	@if [ $$(palo -f /dev/null >/dev/null 2>&1 ; echo $$?) != 2 ]; then \
 		echo 'ERROR: Please install palo first (apt-get install palo)';\
 		echo 'or build it from source and install it somewhere in your $$PATH';\
@@ -101,19 +101,19 @@
 	export TOPDIR=`pwd`; \
 	unset STRIP LDFLAGS CPP CPPFLAGS AFLAGS CFLAGS CC LD; cd ../palo && make lifimage

-Image: palo
+Image: vmlinux

 Image-clean:

 ramdisk.o:

-zImage: palo
+zImage: vmlinux

-bzImage: palo
+bzImage: vmlinux

 compressed: zImage

-install:
+install: palo

 archmrproper:


-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
