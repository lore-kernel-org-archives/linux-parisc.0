Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA07763
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Sep 1999 15:00:11 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id RAA11264
	for <parisc-linux@thepuffingroup.com>; Fri, 17 Sep 1999 17:01:30 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id OAA23369 for <parisc-linux@thepuffingroup.com>; Fri, 17 Sep 1999 14:00:17 -0700 (PDT)
Message-Id: <199909172100.OAA23369@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Fri, 17 Sep 1999 14:00:17 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] cvs [server aborted]: "commit" requires write access...
List-ID: <linux-parisc.vger.kernel.org>


Alex/et al,
I'm trying to submit the changes to build "som" format binaries
and I'm getting the error:

cvs [server aborted]: "commit" requires write access to the repository
cvs commit: saving log message in /tmp/cvsBAAa18719

Is the entire /home/cvs/parisc repository locked right now?
I checked rw permissions on the files and I have them.

I recall Alex sent a message about merging to 2.2.12. I don't
remember (but may have missed) mention that the repository
would be locked down and binutils was part of that.

I'm interested in committing:
CVS: Modified Files:
CVS:    binutils/gas/configure binutils/bfd/config.bfd
CVS:    binutils/ld/Makefile.in
CVS: ----------------------------------------------------------------------
Problem: tools use som support for as long as HP-UX linker is required.
Solution:
o gas/configure: for "hppa-*-linux" in "case ${generic_target}",
                 replace "fmt=elf" with "fmt=som"
o bfd/config.bfd: move parisc-linux target to "targ_defvec=som_vec" case
o ld/Makefile.in: disable "install" target for ld. Print msg instead.

thanks,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
