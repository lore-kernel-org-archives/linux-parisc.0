Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87482482B
	for <parisc-linux@parisc-linux.org>; Tue, 10 Jul 2001 09:08:30 -0600 (MDT)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel1.hp.com (Postfix) with ESMTP id F2397142
	for <parisc-linux@parisc-linux.org>; Tue, 10 Jul 2001 11:08:28 -0400 (EDT)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.3 (PHNE_22672)/8.9.3 SMKit7.01) with ESMTP id JAA29206
	for <parisc-linux@parisc-linux.org>; Tue, 10 Jul 2001 09:08:27 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.22 #1 (Debian))
	id 15Jz7i-00028D-00
	for <parisc-linux@parisc-linux.org>; Tue, 10 Jul 2001 09:08:26 -0600
To: parisc-linux@parisc-linux.org
Date: Tue, 10 Jul 2001 09:08:26 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15Jz7i-00028D-00@noam.fc.hp.com>
Subject: [parisc-linux] CVS rumors
List-ID: <linux-parisc.vger.kernel.org>

I've seen/heard some rumors which I'd like to clarify so we can make
good decisions rather than automatically assuming we need to drop to
assembly language because CVS is totally broken.

Rumors:
    1) date-based CVS checkout is hosed
    2) vendor branches are broken
    3) safe-cvsimport posts all changes to the trunk/head immediately

		date-based CVS checkout is hosed
		--------------------------------

Date-based CVS checkout *of the main branch* is indeed broken in one
(frequent) case and I filed it upstream and have heard nothing.  The test
case I filed has nothing to do with branches, vendor branches, safe-cvsimport,
client/server, nor even 'cvs import'.

This is a problem for us because we should be able to go back
to an older linux tree with this command:

	cvs up -D"some-date" -rHEAD

Currently this causes all the files which came from the initial linux
source import and which have never been changed.... to DISAPPEAR!  How
handy!  One work around is to add a gratuitous 1.2 revision to all those
files whose date is the same as the 1.1 revision -- most easily done by
hacking the RCS files.

BTW the following is ambiguous and probably shouldn't be allowed by CVS
if you have any branches:

	cvs up -D"some-date"

That grabs the files as of "some-date" from whatever arbitrary branch
they happen to be on -- thus you get some mixture of all the branches!

		    vendor branches are broken
		    --------------------------

Vendor branches are a special use of normal branches, and
*according to the CVS design* neither are "broken".  However the way
they are managed, mostly with 'cvs import', causes horrid problems
with certain use models.  The use model which works is that every time
you import from upstream, you immediately merge the upstream changes.
This is because the trunk/head is frequently BROKEN after 'cvs import'
so you *must* merge :-)  Here's why:

If you haven't changed a file on the trunk, and it changes upstream,
cvs import makes that change visible on the trunk immediately.  So for
example let's say you've modified a C file which implements an interface
defined in a header file.  You haven't modified the header file.  The
upstream folks modified the header file (and probably the C file too).
After cvs import your *trunk* has the new header file.  Your compile
will now probably fail.  Worse, this extends to files which were added
or removed upstream -- so the header could *disappear* after the import.
You can make up your own scenarios.

This problem is caused by 'cvs import' and has nothing to do with
CVS branches per se.

The way to cause REALLY BIG problems with vendor branches is to use them
for some upstream updates, but merge others by hand on to the trunk.  This
cuts the CVS design off at the knees!  We did this in our linux tree way
back and the number of problems is going down but isn't gone yet.

    safe-cvsimport posts all changes to the trunk/head immediately
    --------------------------------------------------------------
