Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA14050
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Nov 2000 10:57:54 -0700
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel2.hp.com (Postfix) with ESMTP id 928861FBF
	for <parisc-linux@thepuffingroup.com>; Wed,  1 Nov 2000 12:59:35 -0500 (EST)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id KAA11208
	for <parisc-linux@thepuffingroup.com>; Wed, 1 Nov 2000 10:59:34 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=noam.fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 13r2Ag-0000Xp-00
	for <parisc-linux@thepuffingroup.com>; Wed, 01 Nov 2000 10:59:34 -0700
To: parisc-linux@thepuffingroup.com
Date: Wed, 01 Nov 2000 10:59:34 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13r2Ag-0000Xp-00@noam.fc.hp.com>
Subject: [parisc-linux] new method for 64-bit parisc tree
List-ID: <linux-parisc.vger.kernel.org>


I want to propose/discuss a new method for maintaining our 64-bit parisc
tree in relation to the 32-bit tree.  I have prototyped this and so
far it seems pretty useful.

Most of the files in the current parisc64 tree only contain one 
line, a #include of the same file from the parisc tree.  This confuses
'make dep', causes some compile errors to have nonsense line numbers,
and doesn't allow direct editing of the source files in the parisc64 tree.

The method I'm proposing works like this:

The future parisc64 tree ONLY contains files which are different from,
or in addition to, those in the parisc tree.  When you 'make config'
or 'make oldconfig', each file in the parsic tree is symbolically
linked as the same file in the parisc64 tree.  This enables all
the rest of the tools/build to work normally.  'make distclean' includes
a step to remove all the symlinks.

The ugliest "feature" is that even though you can edit source files
in the parisc64 tree, 'cvs commit' will fail on those which are
symbolic links.  To reduce this problem, I'm dropping a symbolic link
called '...' in each parisc64 directory which is a pointer to the
corresponding parisc directory, so 'cd ...; cvs commit foo.c' will
work and not be too onerous.

We should additionally consider a naming convention or something so
that maintainers in the parisc tree know whether files are shared with
parisc64 or not.

I prototyped this as a fictional new "architecture" called "p64".  To
try it out, grab the tarball (only about 30 files -- can be fewer)
ftp://puffin.external.hp.com/pub/parisc/
and unpack in your top-level linux source tree directory.  Then in
your top-level Makefile, change ARCH := parisc64 to ARCH := p64, then
make oldconfig or whatever you usually do.  Let me know of any problems.

Is this something we should adopt for the real parisc64 tree?

	-Paul Bame
