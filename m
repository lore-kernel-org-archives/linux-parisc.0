Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA00466
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 15:35:28 -0700
Received: from dualcel400 ([141.140.106.33])
 by macalester.edu (PMDF V5.2-32 #38670)
 with SMTP id <01JZ94UWQUC2002CBK@macalester.edu> for
 parisc-linux@thepuffingroup.com; Tue, 23 Jan 2001 16:39:13 CDT
Date: Tue, 23 Jan 2001 16:37:40 -0600
From: Josiah Carlson <jcarlson@macalester.edu>
To: parisc-linux@thepuffingroup.com
Message-id: <3A6E07B41A5.2E2CJCARLSON@smtp.macalester.edu>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Subject: [parisc-linux] crt1.o
List-ID: <linux-parisc.vger.kernel.org>

To summarize my current installation:
.5 image copied onto hard drive
base.tgz installed
nfsroot from 10-05-2000
ftp.deb (works great BTW)

>From here I've tried to configure MPICH for compilation...though I keep
getting a crt1.o not found error, even though it exists in /usr/lib.
I tried re-extracting the glibc tarball in /install/debian-hppa, but I
keep getting the same error.
Remembering the problems with caching I tried sync, but that didn't
work.

Just to try something out...I 'm curious as to which file contains the
listing of paths that are searched for libraries by gcc or g++ (or in
general all paths searched by the shell for execution), does anyone know
which file that is?
Or has anyone else had this problem, even after getting crt1.o into
/usr/lib?
Thank you,
 - Josiah
