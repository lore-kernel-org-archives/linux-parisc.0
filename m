Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp9.xs4all.nl (smtp9.xs4all.nl [194.109.127.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50E61482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Sep 2001 06:54:05 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp9.xs4all.nl (8.9.3/8.9.3) with ESMTP id OAA16896
	for <parisc-linux@lists.parisc-linux.org>; Sun, 9 Sep 2001 14:54:03 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sun, 9 Sep 2001 14:26:52 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010909142652.A26291@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010906073538.A12771@middle.of.nowhere> <200109060608.AAA09806@puffin.external.hp.com> <20010906135327.C316@parcelfarce.linux.theplanet.co.uk> <20010906211409.A26423@middle.of.nowhere> <20010907150709.B843@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010907150709.B843@neep.com.au>
Subject: [parisc-linux] 'Getting a parisc-linux cvs kernel without stress'
List-ID: <linux-parisc.vger.kernel.org>

This is a small update/addition to the 'kernel-building recipe'.

============================================================
If you want to test the latest kernel and don't want to download the
enormous linux-latest.tar.gz file every time, use the cvs system to
get just the changed files. This is a very short manual how to do this
in 3 steps.  Obviously, step 1 and 2 are only needed once. Step 3 can be
repeated as you like.

Step 1 - create the right environment.

Make sure you have a variable 'CVSROOT' with value
CVSROOT=:pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc

To make it available on every boot, put it in ~/.bashrc like this:

CVSROOT=:pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc
export CVSROOT

Also create a .cvsrc file in your home directory with this content:

cvs -z3 -q
diff -uNp
update -Pd
remove -f

Also make sure you have cvs installed ('apt-get install cvs' if you have
not). Before going on to step 2, make sure the CVSROOT variable is
actually set - by logging out and logging in again.

Step 2 - prepare a linux source tree

Get linux-latest.tar.gz from the ftp-site, and untar. In this manual,
I'll user ~/source/ as directory untar in, but any directory will do.
Now you'll have to change some files in the source tree. Make sure your
CVSROOT variable is set correctly and type:

for i in `find linux -name Root`; do echo $CVSROOT > $i; done

Step 3 - get the latest source code

Change directory to ~/source/ and type

cvs update -APd linux

You should see a list of files looking something like this:

P linux/Makefile
P linux/Documentation/parisc/registers
P linux/arch/parisc/vmlinux.lds
P linux/arch/parisc/vmlinux64.lds
P linux/arch/parisc/hpux/fs.c

etc.

To make sure something has changed you can always do:

grep -i version linux/Makefile | head -2

which will answer 

VERSION = 2
EXTRAVERSION = -pa17

Now compile your new kernel as usual.
============================================================

This is by way of thanks to everyone who helped me to get it working,
and to possibly prevent other people from endless trying.

Good luck,
Jurriaan
-- 
Satan: "Welcome to hell - Here's your DoubleSpaced 386SX and windows"
GNU/Linux 2.4.9-ac10 SMP/ReiserFS 2x1402 bogomips load av: 0.31 0.08 0.02
