Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E3A1482A
	for <parisc-linux@parisc-linux.org>; Tue, 22 May 2001 18:05:19 -0600 (MDT)
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 22 May 2001 18:07:59 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010523000759.C759937DCE@carmen.fc.hp.com>
Subject: [parisc-linux] Major hppa binutils problem
List-ID: <linux-parisc.vger.kernel.org>

As was reported here before binutils versions 2.11.90.0.7 and 2.11.90.0.8 have 
a bug on hppa that causes binutils to generates broken executables. The bug is 
also viral in nature in that if you build with shared libraries built with the 
broken binutils, even if the broken binutils is not installed, the resulting 
executables will still be broken.

Unforturately the Debian autobuilder built and uploaded binutils 2.11.90.0.7-1 
so you may have "infected" your system if you did an apt-get upgrade. Also 
several Debian developers had done so and then uploaded packages built with 
the bad binutils.

Right now we are recommending that people revert to 2.11.90.0.1 available at,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/
newcompilers-20010326/binutils_2.11.90.0.1-1_hppa.deb

Paul Bame has written a script you can run to check and see if your system has 
any bad debs installed. Its available at,

ftp://puffin.external.hp.com/pub/parisc/tools/plt-checker

Lamont Jones is working on scanning all the hppa packages in the Debian 
archive to come up with a list of what packages are broken. Once he has the 
list we will work on getting them all rebuilt cleanly and uploaded.

Until they have all been rebuilt/uploaded, DO NOT APT-GET UPGRADE, you will 
infect your system. When everything is done and we've confirmed that the 
archive is clean, someone will announce it's ok to proceed.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
