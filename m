Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id AAA13196
	for <parisc-linux@sod.res.cmu.edu>; Thu, 22 Apr 1999 00:59:56 -0400
Received: from localhost (adevries@localhost)
	by devserv.devel.redhat.com (8.8.7/8.8.7) with SMTP id AAA20628
	for <parisc-linux@thepuffingroup.com>; Thu, 22 Apr 1999 00:59:36 -0400
Date: Thu, 22 Apr 1999 00:59:36 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.3.96.990422005352.5593k-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] binutils and targetting.
List-ID: <linux-parisc.vger.kernel.org>


*sigh* finally.  After hacking binutils' configure files, 
./configure --target=parisc-linux --with-gas
actually works.

So, what are the larger problems with binutils?  I know there was talk of
completely redoing the parisc stuff.  

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
PA RISC Linux Porting Team
