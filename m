Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8BAE482A
	for <parisc-linux@parisc-linux.org>; Wed,  4 Apr 2001 17:18:22 -0600 (MDT)
To: parisc-linux@parisc-linux.org, debian-hppa@list.debian.org
Cc: taggart@carmen.fc.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Apr 2001 17:20:14 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010404232014.574B837E74@carmen.fc.hp.com>
Subject: [parisc-linux] New hppa base tarball
List-ID: <linux-parisc.vger.kernel.org>

Hi hppa-unknown-linux-gnu hackers,

I have built a new "base" Debian tarball for hppa and posted it at,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/
basetars/base-20010404.tar.gz

It's ~30MB in size and only includes the base stuff(no compilers, etc), plus 
ssh and it's dependencies (libssl0.9.6, libcap1, zlib1g). The contents are 
listed at,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/
basetars/baselist.20010404

The debs included are available at,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/base/

The logins/passwds are,

demo:demo
root:root

There are additional instructions on how to set it up in the tarball at 
/home/demo/README. Instructions on using it to install a system are available 
at,

http://parisc-linux.org/software/install.html

Now that Bdale has the autobuilder running you can grab debs from any mirror. 
If something isn't there yet you can wait for it to show up, build it 
yourself, or check,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/debs/

to see if someone else has built it by hand.

I will also try and do a base + reasonable build environment tarball soon.

Please pay attention to the web site and mailing list for errata and report 
any problems you have.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
