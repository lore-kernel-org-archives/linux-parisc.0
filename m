Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA10480
	for <parisc-linux@puffin.external.hp.com>; Tue, 7 Nov 2000 11:14:03 -0700
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel1.hp.com (Postfix) with ESMTP id A87761A1
	for <parisc-linux@thepuffingroup.com>; Tue,  7 Nov 2000 13:15:51 -0500 (EST)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id LAA29231
	for <parisc-linux@thepuffingroup.com>; Tue, 7 Nov 2000 11:15:50 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=noam.fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 13tDHi-000743-00
	for <parisc-linux@thepuffingroup.com>; Tue, 07 Nov 2000 11:15:50 -0700
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: Your message of "Wed, 01 Nov 2000 10:59:34 MST."
             <E13r2Ag-0000Xp-00@noam.fc.hp.com>
References: <E13r2Ag-0000Xp-00@noam.fc.hp.com> 
Date: Tue, 07 Nov 2000 11:15:50 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13tDHi-000743-00@noam.fc.hp.com>
Subject: [parisc-linux] 64-bit BUILD CHANGES
List-ID: <linux-parisc.vger.kernel.org>


The described changes have just been committed to CVS.  If you have
an existing configured/built 64-bit parisc tree right now I think these
are the steps to update:

	Save your .config file
	do 'make distclean'
	do your cvs update
	restore your .config
	make oldconfig dep
	and then proceed as normal

	The symlinks come when you do a make {old}config and
	go with a 'make distclean' FYI

>>> You may want to start hand-editing .hdepend (following each make dep)
to remove the dependency of atomic.h on spinlock.h (just remove the first
line containing the string spinlock.h) -- it can cause massive
unnecessary rebuilds.  It's due to a parisc-specific circular dependency  :-(

		-P

= I want to propose/discuss a new method for maintaining our 64-bit parisc
= tree in relation to the 32-bit tree.  I have prototyped this and so
= far it seems pretty useful.
= 
= Most of the files in the current parisc64 tree only contain one 
= line, a #include of the same file from the parisc tree.  This confuses
= 'make dep', causes some compile errors to have nonsense line numbers,
= and doesn't allow direct editing of the source files in the parisc64 tree.
= 
= The method I'm proposing works like this:
= 
= The future parisc64 tree ONLY contains files which are different from,
= or in addition to, those in the parisc tree.  When you 'make config'
= or 'make oldconfig', each file in the parsic tree is symbolically
= linked as the same file in the parisc64 tree.  This enables all
= the rest of the tools/build to work normally.  'make distclean' includes
= a step to remove all the symlinks.
= 
= The ugliest "feature" is that even though you can edit source files
= in the parisc64 tree, 'cvs commit' will fail on those which are
= symbolic links.  To reduce this problem, I'm dropping a symbolic link
= called '...' in each parisc64 directory which is a pointer to the
= corresponding parisc directory, so 'cd ...; cvs commit foo.c' will
= work and not be too onerous.
= 
= We should additionally consider a naming convention or something so
= that maintainers in the parisc tree know whether files are shared with
= parisc64 or not.
= 
= I prototyped this as a fictional new "architecture" called "p64".  To
= try it out, grab the tarball (only about 30 files -- can be fewer)
= ftp://puffin.external.hp.com/pub/parisc/
= and unpack in your top-level linux source tree directory.  Then in
= your top-level Makefile, change ARCH := parisc64 to ARCH := p64, then
= make oldconfig or whatever you usually do.  Let me know of any problems.
= 
= Is this something we should adopt for the real parisc64 tree?
= 
= 	-Paul Bame
= 
= ---------------------------------------------------------------------------
= To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
= `unsubscribe' as the subject.
= 
= 
= 
