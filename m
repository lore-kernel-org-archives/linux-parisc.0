Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA07177
	for <parisc-linux@puffin.external.hp.com>; Mon, 31 May 1999 21:16:44 -0600
Received: from localhost (adevries@localhost)
	by devserv.devel.redhat.com (8.8.7/8.8.7) with SMTP id XAA17073
	for <parisc-linux@thepuffingroup.com>; Mon, 31 May 1999 23:16:36 -0400
Date: Mon, 31 May 1999 23:16:34 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.3.96.990531230648.8814C-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] The plan for SOM, ELF32 and ELF64.
List-ID: <linux-parisc.vger.kernel.org>


At LinuxExpo a week and a half ago, the parisc developers that were there
got together and resolved some of the SOM/ELF32 issues.  I'm going to
document them here for everyone who couldn't be in North Carolina that
week.

The bad news is that we have a challenge no matter what we do.  The
problems are that:

- we don't have a version of ld for SOM in binutils, which means we can't
  really cross compile properly

- we don't have any ELF32 or ELF64 to work from to start with.

The route we've planned to take is:

- focus on SOM only for kernel and userland, but not the linker.  When we
need to link SOM userland, we'll have to do it on HPUX.

- at some point Cygnus will deliver on their HP sponsored gcc support for
PARISC 2.0, which should have some ELF64 code we can borrow. It's
understood that the ELF32 and 64 specs have a lot in common.

No reasonable distribution will be SOM based, so we're going to have to
get ELF done before we get to that point.

Let me know if I'm mistaken on any of this.

- Alex


-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
PA RISC Linux Porting Team
