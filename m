Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA01279
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 16:00:44 -0700
Received: from dualcel400 ([141.140.106.33])
 by macalester.edu (PMDF V5.2-32 #38670)
 with SMTP id <01JZ95QFJ2NC002748@macalester.edu> for
 parisc-linux@thepuffingroup.com; Tue, 23 Jan 2001 17:04:38 CDT
Date: Tue, 23 Jan 2001 17:03:05 -0600
From: Josiah Carlson <jcarlson@macalester.edu>
Subject: Re: [parisc-linux] crt1.o
In-reply-to: <200101232249.RAA04914@hiauly1.hia.nrc.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
Message-id: <3A6E0DA9DA.2E2DJCARLSON@smtp.macalester.edu>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
References: <3A6E07B41A5.2E2CJCARLSON@smtp.macalester.edu>
 <200101232249.RAA04914@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> > Just to try something out...I 'm curious as to which file contains the
> > listing of paths that are searched for libraries by gcc or g++ (or in
> > general all paths searched by the shell for execution), does anyone know
> > which file that is?
> 
> Try running gcc with `-print-search-dirs'.  You can get complete list of gcc
> options with `-v --help'.  `-v' may help to see how linker is being run.

I suppose I should have said so...but the actual command being used to
find the libraries is ld.  I've tried to figure that command out...but
it's not liking me at all.
I have not tried the -print-search-dirs on my HP machine, but will
tomorrow.
Though in general, how do I add paths to be searched by the OS?
Thank you,
 - Josiah
