Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA23181
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 19:19:46 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by cosrel1.hp.com (Postfix) with ESMTP id AD274874
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Sep 2000 19:20:35 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Cc: taggart@carmen.fc.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 22 Sep 2000 19:22:13 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000923012213.79114381CD@carmen.fc.hp.com>
Subject: [parisc-linux] New cross-toolchain and nfsroots
List-ID: <linux-parisc.vger.kernel.org>

I have posted a new X86/linux->parisc/linux cross toolchain at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20000921.tar.gz

I have also posted two new nfsroots. The first contains everything from Debian 
"base" that we have built so far(debs and tgz's). This is an attempt to 
generate something as close as possible to the base.tgz file that the Debian 
install uses. All the debs were installed natively so the package database is 
correct as well. It will serve as a good starting point for building a system 
and can be updated using dpkg/apt/etc. It's 33MB. It lives at,

ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/base-20000922.tar.gz

The second nfsroot is the above "base" root plus all the other non-"base" 
Debian packages that we've done plus gcc/binutils. Think kitchen sink. It's 
43MB. It lives at,

ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/nfsroot-20000922.tar.g
z

In case you're curious I placed notes on how I generated the above at,

ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/recipe-20000922

-- 
Matt Taggart
taggart@fc.hp.com
