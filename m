Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id CAA14936
	for <parisc-linux@sod.res.cmu.edu>; Sun, 18 Apr 1999 02:10:25 -0400
Received: from localhost (adevries@localhost)
	by devserv.devel.redhat.com (8.8.7/8.8.7) with SMTP id CAA10287
	for <parisc-linux@thepuffingroup.com>; Sun, 18 Apr 1999 02:10:23 -0400
Date: Sun, 18 Apr 1999 02:10:22 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.3.96.990418020814.1235C-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] kernel updates.
List-ID: <linux-parisc.vger.kernel.org>


So, I spent some time this rainy Saturday on the kernel, and brought the
kernel a little closer to building.  There's now about 8 to 12 undefined
symbols still to fix, but make dep and make vmlinux now do two different
things.

There's a lot of stuff still to do in this, please, take the kernel tree
and try compiling it.  More importantly, help me fix it.

And ld.  We need ld help.

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
PA RISC Linux Porting Team
