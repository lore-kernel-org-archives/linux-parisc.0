Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA16123
	for <parisc-linux@puffin.external.hp.com>; Fri, 30 Apr 1999 16:29:01 -0600
Received: from localhost (adevries@localhost)
	by devserv.devel.redhat.com (8.8.7/8.8.7) with SMTP id SAA20591
	for <parisc-linux@thepuffingroup.com>; Fri, 30 Apr 1999 18:28:54 -0400
Date: Fri, 30 Apr 1999 18:28:54 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.3.96.990430181811.10592J-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] New crosscompiler RPM set.
List-ID: <linux-parisc.vger.kernel.org>


I've uploaded a cross compiling binutils and egcs that now specifies our
target properly as parisc-linux.  They're built on a redhat 5.2 system.
You can upgrade or install them with:

rpm -Uvh \
ftp://puffin.external.hp.com/pub/parisc/binaries/RPMS/binutils-x-parisc-linux-2.9.1-10.i386.rpm
rpm -Uvh \
ftp://puffin.external.hp.com/pub/parisc/binaries/RPMS/egcs-x-parisc-linux-1.1.1-9.i386.rpm

I've also uploaded .tar.gz for those who'd prefer it.

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
PA RISC Linux Porting Team
