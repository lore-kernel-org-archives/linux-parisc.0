Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA00846
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 15:46:02 -0700
Message-Id: <200101232249.RAA04914@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] crt1.o
To: jcarlson@macalester.edu (Josiah Carlson)
Date: Tue, 23 Jan 2001 17:49:52 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <3A6E07B41A5.2E2CJCARLSON@smtp.macalester.edu> from "Josiah Carlson" at Jan 23, 2001 04:37:40 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Just to try something out...I 'm curious as to which file contains the
> listing of paths that are searched for libraries by gcc or g++ (or in
> general all paths searched by the shell for execution), does anyone know
> which file that is?

Try running gcc with `-print-search-dirs'.  You can get complete list of gcc
options with `-v --help'.  `-v' may help to see how linker is being run.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
