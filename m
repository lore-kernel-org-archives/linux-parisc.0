Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA04597
	for <parisc-linux@puffin.external.hp.com>; Mon, 24 Jan 2000 03:03:57 -0700
Received: (from phil@localhost)
	by moiraine.off.net (8.9.3/8.9.3) id BAA02527
	for parisc-linux@thepuffingroup.com; Mon, 24 Jan 2000 01:01:53 -0800
Date: Mon, 24 Jan 2000 01:01:53 -0800
From: Phil Schwan <phil@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000124010153.D8024@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] egcs 2.9-hppa release
List-ID: <linux-parisc.vger.kernel.org>

Hewlett-Packard and Linuxcare are pleased to announce the release of egcs
2.9 for the PA-RISC processor.  The released source contains enhanced
support for 32-bit PA 1.1 processors and additional support for 64-bit
PA 2.0 processors.  The compiler and tools have been tested on multiple
releases of HP/UX, and have been shown to interoperate with Hewlett-Packard's
existing 64-bit toolchain.  Furthermore, the toolchain has been shown to
support cross-compilation of packages hosted on Linux/i386 with a 64-bit
PA-RISC target.  The release of this product will allow the PA-RISC
Linux porting effort to complete support for 32-bit and 64-bit ELF
binaries, as well as begin to compile 64-bit versions of the PA-RISC Linux
kernel; we anticipate that this support will be completed soon.

Though there are very few known bugs, there are almost certainly bugs
that are yet to be found.  Please direct bug reports and concerns to
gcc-info@thepuffingroup.com.  As bugs are fixed and features are added,
new snapshots will be posted to puffin.external.hp.com and
http://www.thepuffingroup.com/parisc/gcc.html

For now, the source is available only via ftp, from
ftp://puffin.external.hp.com/pub/parisc/src/egcs-2.9-hppa-991112.tar.gz
The source will soon be placed in the PA-RISC Linux cvs repository;
I'll notify the list when this takes place.

Go to it, hackers--

-Phil

-- 
Phil Schwan, Senior Linux Consultant, Linuxcare, Inc.
415.354.4878 x271 tel, 415.701.7457 fax
pschwan@linuxcare.com http://www.linuxcare.com/
Linuxcare.  At the centre of Linux.
