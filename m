Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA29295
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Jul 2000 15:21:24 -0600
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by cosrel2.hp.com (Postfix) with ESMTP id CFE215C1
	for <parisc-linux@thepuffingroup.com>; Wed, 12 Jul 2000 15:22:53 -0600 (MDT)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id PAA01635
	for <parisc-linux@thepuffingroup.com>; Wed, 12 Jul 2000 15:22:55 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=noam.fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 13CTz3-0003r4-00
	for <parisc-linux@thepuffingroup.com>; Wed, 12 Jul 2000 15:23:57 -0600
To: parisc-linux@thepuffingroup.com
Date: Wed, 12 Jul 2000 15:23:57 -0600
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13CTz3-0003r4-00@noam.fc.hp.com>
Subject: [parisc-linux] PALO changes
List-ID: <linux-parisc.vger.kernel.org>


I've just commited a bunch of PALO changes I have been making on a
branch.  ACTION REQUIRED: none if you're happy with PALO right now.
WARNING: if you don't have or want a tool chain which can produce
user-space executables yet, DON'T get the latest PALO bits.

Changes:
    PALO can make bootable ISO CD images

    A new step was introduced with the program palo/mkbootable.  Look
    at the Makefile or documentation if you need to figure that out.
    Most folks will be able to continue using 'make palo' in their
    linux tree and the mkbootable change will be transparent.

    Many changes to the build process.  PALO no longer uses header files
    from either /usr/src/linux nor the palinux kernel tree, so the
    build, especially for first-time users, should be easier (SEE NEXT
    PARAGRAPH and WARNING above however).  NOTE
    that you must have a real /usr/include/asm and /usr/include/linux
    to build palo -- some Linux distributions don't have this, or have
    it as an optional component.

    PALO ***DEPENDS UPON*** a tool chain which can produce user-space
    executables.  The "how to build a kernel" recipe does not say how
    to produce such a tool chain, so if the recipe's tool chain is
    all you have DON'T UPDATE PALO.
    Note the kernel will soon depend on this too (when we get rid of
    our kernel private copy of libmilli.a).

	If your system is relatively close to Debian 'potato', you
	can grab a suitable cross compiler tarball from
	ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86
	by grabbing xc-20000705.tgz and xc-patch-20000706.tgz

	Until the 0705 cross compiler is superceeded, you'll need
	to change your kernel build to 'make CROSS_COMPILE=hppa1.1-linux- palo'
	if you're using recent kernel sources.


		-Paul Bame
