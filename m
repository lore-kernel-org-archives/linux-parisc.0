Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id UAA22021
	for <parisc-linux@sod.res.cmu.edu>; Wed, 7 Apr 1999 20:28:28 -0400
Message-ID: <19990407192743.A25057@debian.org>
Date: Wed, 7 Apr 1999 19:27:43 -0500
From: Justin Maurer <justin@master.debian.org>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] binutils from cvs broke
List-ID: <linux-parisc.vger.kernel.org>

i'm running configure on the binutils from cvs, and it seems to bomb out with
the following error:

creating libtool
configure: error: GAS does not support target CPU i386
Configure in /home/parisc/cvs/binutils/gas failed, exiting.

the command i used to run configure with was:
$ ./configure --prefix=/home/parisc/hppa-test/

sorry to post a compile error here, but it's the only place i can think of,
after asking for help on irc.

(for those of you who don't know, i'm acf on linuxnet, and am debianizing the
binutils+egcs that are in cvs)

-- 
-------------------------------------------------------------
# Justin Maurer                                GNOME Hacker #
# justin@debian.org                         Slashdot Author #
# http://slashdot.org/           Debian GNU/Linux Developer #
#     09 84 FC 03 13 AA 4A AF  F6 A4 85 9D 8C 96 B6 A4      #
-------------------------------------------------------------
