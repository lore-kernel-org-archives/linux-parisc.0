Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id VAA09286
	for <parisc-linux@sod.res.cmu.edu>; Wed, 21 Apr 1999 21:47:07 -0400
Date: Wed, 21 Apr 1999 20:46:52 -0500
From: Justin Maurer <justin@master.debian.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990421204652.A12635@master.debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] binutils build problems
List-ID: <linux-parisc.vger.kernel.org>

i've been trying to build binutils packages last night and tonight, and it
seems to not want to configure properly.

when i use ./configure --prefix=/usr --with-gas --target=parisc-linux, i get
the following error: 

Invalid configuration `parisc-linux': machine `parisc' not recognized
Unrecognized target system name parisc-linux.

running perl -pi~ -e 's/hppa/parisc/' * takes care of that, but the configure
fails again when it reaches the gas/ directory:

configure: error: GAS does not know what format to use for target
parisc-unknown-linux-gnu
Configure in /home/parisc/cvs/binutils/gas failed, exiting.

i still get the error after playing with the configure/configure.in/Makefiles,
etc. puffin said i should report this here. is anyone else having this
problem?

-- 
-------------------------------------------------------------
# Justin Maurer                                GNOME Hacker #
# justin@debian.org                         Slashdot Author #
# http://slashdot.org/           Debian GNU/Linux Developer #
#     09 84 FC 03 13 AA 4A AF  F6 A4 85 9D 8C 96 B6 A4      #
-------------------------------------------------------------
