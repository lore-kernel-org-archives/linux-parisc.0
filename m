Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14D1E482A
	for <parisc-linux@parisc-linux.org>; Wed, 13 Jun 2001 11:31:41 -0600 (MDT)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel1.hp.com (Postfix) with ESMTP id 190171206
	for <parisc-linux@parisc-linux.org>; Wed, 13 Jun 2001 13:31:40 -0400 (EDT)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.3 (PHNE_22672)/8.9.3 SMKit7.01) with ESMTP id LAA20997
	for <parisc-linux@parisc-linux.org>; Wed, 13 Jun 2001 11:31:38 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 15AEUU-0004qi-00
	for <parisc-linux@parisc-linux.org>; Wed, 13 Jun 2001 11:31:38 -0600
To: parisc-linux@parisc-linux.org
Date: Wed, 13 Jun 2001 11:31:38 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15AEUU-0004qi-00@noam.fc.hp.com>
Subject: [parisc-linux] PALO/kernel-build change proposal
List-ID: <linux-parisc.vger.kernel.org>

Many of us are accustomed to the way 'make palo' works in our kernel
source tree (it goes over to the palo source tree, builds palo, and
then utilizes the palo Makefile to produce a bootable image).  I want
to convert to a model based on palo being a separate stable piece
of software for which you may not even have sources.  Many of us are
probably also not using 'palo.conf' files, which are the norm for self-
hosted operation.

When self hosted, there's usually no need to run palo after every
kernel build since palo boots out of the file system by file name.
So I propose that the common self-hosted use model be to use simple 'make'
in the kernel tree [and make modules or whatever].  The resulting 'vmlinux'
file can then be copied to the desired location.

I propose that 'make palo' be changed to simply run 'palo -f ./palo.conf'
after vmlinux is built.  This means palo would have to be in the $PATH
and that the top-level linux source directory would contain a
suitable palo.conf file.  I've been using this model for cross-compiling
for several months and like it.  I would document how xc-ers can best
compile and "install" palo as well as supply a palo.conf file with
our typical configurations.

What is 'make palo' today would be changed to 'make buildrunpalo'.  The
longer name is more truthful and less convenient on purpose.

Feedback?

	-P
