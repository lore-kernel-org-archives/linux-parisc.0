Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C893482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 08:53:31 -0600 (MDT)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id IAA02311
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 08:53:30 -0600
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m15uEY6-000OzAC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 08:53:30 -0600 (MDT)
Resent-Message-Id: <m15uEY6-000OzAC@bame.riverrock.org>
Date: Mon, 15 Oct 2001 22:20:38 +0200 (CEST)
From: Tamas TEVESZ <ice@extreme.hu>
To: <bame@debian.org>
Message-ID: <Pine.LNX.4.33.0110152216430.1428-100000@dawn.royalcomp.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] palo and archs

hi,

silence:~# apt-cache show palo
Package: palo
Priority: important
Section: base
Installed-Size: 536
Maintainer: Paul Bame <bame@debian.org>
Architecture: i386
              ^^^^
Version: 0.94
Filename: pool/main/p/palo/palo_0.94_i386.deb
                                     ^^^^
Size: 202904
MD5sum: 10b68aacf76ec6d2c54b36d17be45418
Description: Linux boot loader for parisc/hppa
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 This package contains the parisc boot loader itself, plus palo which
 is the boot media management tool as lilo is for i386.
silence:~# dpkg --print-architecture
i386


hm ?

thanks,

-- 
[-]
