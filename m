Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA30807
	for <parisc-linux@puffin.external.hp.com>; Fri, 19 Jan 2001 11:02:15 -0700
From: jcarlson@macalester.edu
Received: from chem42.chem.macalester.edu ([141.140.46.42])
 by macalester.edu (PMDF V5.2-32 #38670)
 with ESMTP id <01JZ3A5SKAMQ0023HL@macalester.edu> for
 parisc-linux@thepuffingroup.com; Fri, 19 Jan 2001 12:06:00 CDT
Date: Fri, 19 Jan 2001 12:27:32 -0600
To: parisc-linux@thepuffingroup.com
Message-id: <14688115.3188896052@chem42.chem.macalester.edu>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] ftp, gcc, etc...
List-ID: <linux-parisc.vger.kernel.org>

Sorry for darn near spamming the list with all my problems...

I was going to get some packages and such...but it seems that the base .5
image lacks ftp...
I was curious as to which package includes ftp as one of it's binaries.  It
is a little strange to be on a linux machine and not have ftp.  I've
started to install packages that I thought would do it...but I haven't
found it yet.

On a side note, I'm setting up 6 hp machines to be turned into a parallel
processing cluster using MPICH, and am going to need to compile the
sources.  (or if someonee else wants to compile them and make a debian
package out of them...would be really nice *smile*).  Along those lines,
which packages do I need to install on the hp machine to allow configure,
make, gcc, etc... to work together?
After installing gcc and glibc (as well as all the required libraries for
gcc), I tested it with a hello world program, and everything went peachy,
but I do not know if the MPICH configure and make will work yet as I am not
able to download it (I want my ftp! *5 points if you know what this refers
to*).

Any help at all would be greatly appreciated,
Thank you,
 - Josiah
