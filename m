Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id WAA14713
	for <parisc-linux@sod.res.cmu.edu>; Tue, 20 Apr 1999 22:49:34 -0400
Received: from localhost (adevries@localhost)
	by devserv.devel.redhat.com (8.8.7/8.8.7) with SMTP id WAA03507
	for <parisc-linux@thepuffingroup.com>; Tue, 20 Apr 1999 22:49:07 -0400
Date: Tue, 20 Apr 1999 22:49:07 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.3.96.990420224734.5593R-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] binutils change in CVS...
List-ID: <linux-parisc.vger.kernel.org>


I've committed my patch to CVS for binutils that should let you commit
with a target of parisc-linux instead of hppa-linux.  I think there's at
least one problem with building it now because of this, so I'd appreciate
it if others could:

a) try rebuilding

and optionally:
b) fixing it.

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
PA RISC Linux Porting Team
