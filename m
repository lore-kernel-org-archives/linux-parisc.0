Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA01552
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Mar 2000 18:18:48 -0700
Received: from localhost (mang@localhost) by cuzea.pair.com (8.9.1/8.6.12) with ESMTP id TAA17561 for <parisc-linux@thepuffingroup.com>; Sat, 4 Mar 2000 19:19:52 -0500 (EST)
Date: Sat, 4 Mar 2000 19:19:52 -0500 (EST)
From: Michael Ang <mang@subcarrier.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.BSF.4.10.10003041826220.15053-100000@cuzea.pair.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] latest glibc checked in
List-ID: <linux-parisc.vger.kernel.org>

I checked out a copy of glibc from the Cygnus repository (using the
datestamp 2000-03-03), and checked it into our repository in the "glibc"
directory.  You can check it out by doing "cvs co glibc".

All our development on glibc should take place in "glibc" on the trunk.  
The Cygnus sources will be tracked on the GLIBC_CVS_DIST branch, similarly
to how we are tracking Linus' sources in /linux-2.3 on the "linus" branch.  
Instead of using a discrete release number to tag, I propose that we pull
from the Cygnus CVS using a specific date tag, and create a matching
static tag in our repository (e.g. GLIBC_CVS_2000_03_03).

We should push our changes back to the Cygnus tree as often as possible.
Ideally we would just work directly on the Cygnus tree, and people who
wanted to pick our changes would pull from Cygnus.  By having our own
local copy, we risk paying the "stupid tax" by forking glibc and having to
constantly deal with merge problems and support.

(We did a bad, bad thing, and renamed the old "glibc" directory to
"glibc-old" in the repository.  This shouldn't affect you unless you have
an old "glibc" tree around, and willy and I determined this should be a
set of one person.  In this case, you need to blow away your old tree.
Please talk to me if you have local changes.)

Happy hacking,
	- Mike.
