Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA01722
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 16:04:59 -0700
Message-Id: <200101232308.SAA05005@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] crt1.o
To: jcarlson@macalester.edu (Josiah Carlson)
Date: Tue, 23 Jan 2001 18:08:49 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <3A6E0DA9DA.2E2DJCARLSON@smtp.macalester.edu> from "Josiah Carlson" at Jan 23, 2001 05:03:05 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > > Just to try something out...I 'm curious as to which file contains the
> > > listing of paths that are searched for libraries by gcc or g++ (or in
> > > general all paths searched by the shell for execution), does anyone know
> > > which file that is?
> > 
> > Try running gcc with `-print-search-dirs'.  You can get complete list of gcc
> > options with `-v --help'.  `-v' may help to see how linker is being run.
> 
> I suppose I should have said so...but the actual command being used to
> find the libraries is ld.  I've tried to figure that command out...but
> it's not liking me at all.
> I have not tried the -print-search-dirs on my HP machine, but will
> tomorrow.
> Though in general, how do I add paths to be searched by the OS?
> Thank you,

Gcc has builtin defaults.  You shouldn't need to specify a search patch
for crt0.o.  Including `-v' on the gcc command will show the stuff that
is being passed to ld.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
