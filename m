Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailhost.cacr.caltech.edu (mailhost.cacr.caltech.edu [131.215.145.180])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B78F482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Jun 2001 13:29:12 -0600 (MDT)
Received: from lugh.cacr.caltech.edu (lugh.cacr.caltech.edu [131.215.145.183])
	by mailhost.cacr.caltech.edu (8.9.3/8.9.1) with ESMTP id MAA01204
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Jun 2001 12:29:11 -0700 (PDT)
Date: Wed, 27 Jun 2001 12:29:11 -0700 (PDT)
From: Al Budriunas <budriuna@cacr.caltech.edu>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.SOL.4.10.10106271206040.1484-100000@lugh.cacr.caltech.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] dselect fails phase 2 of version 0.9 installation
List-ID: <linux-parisc.vger.kernel.org>

I am experiencing the same failure reported by E. Frank Ball to this group
on June 6:

=================
I then tried to run "dpkg-reconfigure base-config".  It got to where it
is supposed to install the packages and died with a message:  failed
running script /usr/sbin/dpkg-preconfigure --apt || true
apt-utils is not installed.
==================

My install source is CDROM created from the June iso image. Has anyone
sorted this out yet?

Thanks,

Al  

------------------------------------------------------------------
Al Budriunas                            email: budriuna@rsn.hp.com  
Hewlett Packard Co.                     voice: 310-535-2884
Los Angeles, Ca.                        
------------------------------------------------------------------
