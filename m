Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30971482A
	for <parisc-linux@parisc-linux.org>; Thu, 12 Jul 2001 15:58:54 -0600 (MDT)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel7.hp.com (Postfix) with ESMTP id 6B89B1F7D3
	for <parisc-linux@parisc-linux.org>; Thu, 12 Jul 2001 17:58:21 -0400 (EDT)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.3 (PHNE_22672)/8.9.3 SMKit7.01) with ESMTP id PAA27216
	for <parisc-linux@parisc-linux.org>; Thu, 12 Jul 2001 15:58:52 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.22 #1 (Debian))
	id 15KoTz-00060v-00
	for <parisc-linux@parisc-linux.org>; Thu, 12 Jul 2001 15:58:51 -0600
To: parisc-linux@parisc-linux.org
Date: Thu, 12 Jul 2001 15:58:51 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15KoTz-00060v-00@noam.fc.hp.com>
Subject: [parisc-linux] CVS palinux 2.4/2.5/workarounds proposal
List-ID: <linux-parisc.vger.kernel.org>

Due to CVS bugs and the upcoming extra demands as we cope with both
2.4 and 2.5 linux, I propose the following architecture including
a sketch for how to transition.

In futureworld, we will have 4 branches:

What				Branch Name

upstream 2.4 sources		linus23 (also called linus24)
2.4 parisc development		devel23 (also called devel24)

upstream 2.5/2.6 sources	linus25 (also called linus26 later)
2.5/2.6 parisc development	devel25 (also called devel26 later)

The default branch which comes from CVS if you merely do a 'cvs co linux'
will be the devel23 branch.  Revision numbers in the devel23 branch
will be 2.3.X.X and in the devel25 branch, 2.5.X.X.  The HEAD/trunk
will contain no files and never be used again.  Note that the CVS features
for making this as convenient as today's development model are simple
and will not in general incur extra work.

Transition sketch:

    Populate the linus23 upstream branch:
	# The current Linus upstream branch is called 'linus', or 1.1.1,
	# which we'll just re-use under a new name(s)
	cvs co -rlinus linux
	# Add the alias 'linus23'
	cvs admin -nlinus23:linus
	# Add the alias 'linus24'
	cvs admin -nlinus24:linus

    Populate the devel23 branch:
        cvs up -RAPd
	cvs commit -r2.3
	cvs rtag -r2.3 -b devel23 linux
	cvs admin -ndevel24:devel23
	cvs up -rdevel23 -RPd
	# do not use commit -Rf -- doesn't work
	cvs commit -f -m'moved from HEAD' -R

    Make devel23 the default:
    	cvs admin -b2.3.2 (or cvs admin -bdevel23 if that works)

    Nuke the current trunk:
	cvs up -RAPd
        find . | fgrep -v CVS | xargs cvs rm -f
	cvs commit -m'moved everything to the devel23 branch'
	cvs up -RAPd # should be empty directory now

    Fix:
    	the /cvs CGI
	cvsview?
	bonsai
	others?

    Populate linus25 when 2.5 is released (trickery):
	cvs rtag -r1.1 -b linus25 linux
	cvs up -r1.1		# yes, this is required :-(
        cvs up -rlinus25
	Turn these files into linux 2.5 bits (cvs rm, cvs add, etc...)
	cvs commit -f -m 'import 2.5' -R

    Populate devel25 (more trickery):
	cvs up -RPd -r2.5	# should be EMPTY
	# bring in 2.3 devel
	cvs up -jdevel23 -RPd
	# Merge 2.4->2.5 changes
	cvs up -jlinus23 -jlinus25 -RPd
	cvs commit -f -R -m 'populate devel25 step 1'
	cvs rtag -r2.5 -b devel25 linux
	cvs up -rdevel25 -RPd
	cvs admin -ndevel26:devel25
