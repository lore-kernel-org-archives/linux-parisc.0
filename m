Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0428482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Oct 2001 06:56:55 -0600 (MDT)
Received: (from ra@localhost)
	by xo.hp.is (8.11.6/RA-8.11.6) id f9ICusJ20021
	for parisc-linux@lists.parisc-linux.org; Thu, 18 Oct 2001 12:56:54 GMT
Date: Thu, 18 Oct 2001 12:56:54 +0000
From: Richard Allen <ra@hp.is>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011018125654.Q8089@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Debian package automake broken ?
List-ID: <linux-parisc.vger.kernel.org>

After upgrading lots of packages on my C360 (including automake) I 
get the following errors when compiling things:

config.status: creating xa_ext.h
config.status: creating db_config.h
+ make
cd . && aclocal
cd . && automake --foreign --include-deps Makefile
automake: configure.in: required file `./depcomp' not found
make: *** [Makefile.in] Error 1


This particular package always made it through configure but had
runtime issues I was hoping to blame the gcc toolchain og glibc 
for.   Now that we have new versions of both, this happens :)

-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
