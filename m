Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.nateng.com (user-vc8fdp3.biz.mindspring.com [216.135.183.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95DDE4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Jan 2003 18:31:23 -0700 (MST)
Received: from jordan.eng.nateng.com (jordan.eng.nateng.com [172.16.100.200])
	by mail.nateng.com (8.11.2/8.11.2) with ESMTP id h0N1iDT27435
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Jan 2003 17:44:13 -0800
Received: from localhost (chandler@localhost)
	by jordan.eng.nateng.com (8.11.4/8.11.4) with ESMTP id h0N1Ya723842
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Jan 2003 17:34:36 -0800
Date: Wed, 22 Jan 2003 17:34:35 -0800 (PST)
From: Sir Ace <chandler@nateng.com>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0301221734281.21999-100000@jordan.eng.nateng.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] ldconfig problems
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I am having issues with the libraries from the 'out-of-box' debian 3.0 for
parisc...

-------------------------------------------------------------------------
/tmp/ccywfbmB.o(.eh_frame+0x11): undefined reference to
`__gxx_personality_v0'
collect2: ld returned 1 exit status

-------------------------------------------------------------------------

make[1]: Entering directory `/usr/src/linux-2.4.20/scripts/lxdialog'
/usr/bin/ld: cannot find -lncurses
collect2: ld returned 1 exit status

>> Unable to find the Ncurses libraries.
>>
>> You must have Ncurses installed in order
>> to use 'make menuconfig'

make[1]: *** [ncurses] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.20/scripts/lxdialog'
make: *** [menuconfig] Error 2

-------------------------------------------------------------------------

HPTux:/usr/src/linux-2.4.20# cat /etc/ld.so.conf
/usr/X11R6/lib
/usr/lib
/lib
/var/lib

-------------------------------------------------------------------------

HPTux:/usr/src/linux-2.4.20# locate libstdc++
/usr/doc/libstdc++3
/usr/doc/libstdc++3-dev
/usr/lib/gcc-lib/hppa-linux/3.0.4/libstdc++.a
/usr/lib/gcc-lib/hppa-linux/3.0.4/libstdc++.so
/usr/lib/libstdc++.so
/usr/lib/libstdc++.so.3
/usr/lib/libstdc++.so.3.0.4
/usr/share/doc/libstdc++3
/usr/share/doc/libstdc++3-dev
/usr/share/doc/libstdc++3/changelog.Debian.gz
/usr/share/doc/libstdc++3/changelog.gz
/usr/share/doc/libstdc++3/copyright
/usr/share/doc/libstdc++3/README.Debian
/var/lib/dpkg/info/libstdc++3-dev.list
/var/lib/dpkg/info/libstdc++3-dev.md5sums
/var/lib/dpkg/info/libstdc++3-dev.postinst
/var/lib/dpkg/info/libstdc++3-dev.prerm
/var/lib/dpkg/info/libstdc++3.list
/var/lib/dpkg/info/libstdc++3.md5sums
/var/lib/dpkg/info/libstdc++3.postinst
/var/lib/dpkg/info/libstdc++3.postrm
/var/lib/dpkg/info/libstdc++3.prerm
/var/lib/dpkg/info/libstdc++3.shlibs

-------------------------------------------------------------------------

HPTux:/usr/src/linux-2.4.20# locate libncur
/lib/libncurses.so.5
/lib/libncurses.so.5.2
/usr/doc/libncurses5
/usr/share/doc/libncurses5
/usr/share/doc/libncurses5/changelog.Debian.gz
/usr/share/doc/libncurses5/changelog.gz
/usr/share/doc/libncurses5/copyright
/usr/share/doc/libncurses5/FAQ
/usr/share/doc/libncurses5/README.Debian
/var/lib/dpkg/info/libncurses5.list
/var/lib/dpkg/info/libncurses5.postinst
/var/lib/dpkg/info/libncurses5.postrm
/var/lib/dpkg/info/libncurses5.prerm
/var/lib/dpkg/info/libncurses5.shlibs

-------------------------------------------------------------------------

Ok, so I blew away /etc/ld.so.cache
ran ldconfig
and have the same problems

What gives?
