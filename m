Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA08543
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Apr 2000 10:27:01 -0600
To: BOSCHINI@ICIL64.CILEA.IT
Cc: PARISC-LINUX@thepuffingroup.com, QUATTRONE@cilea.it
Subject: Re: [parisc-linux] Building bin-utils and gcc on HP735... 
In-reply-to: Your message of "Fri, 31 Mar 2000 10:51:34 GMT."
             <01JNOHLGY86Q000XJ1@ICIL64.CILEA.IT>
Date: Tue, 04 Apr 2000 10:25:04 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12cW8W-0006p3-00@endor.fc.hp.com>


My guess is your build problems are still based on using some of the
HP tools instead of the GNU ones.  Some things to check:

    when your build asks for 'sh' it should get 'bash'

    when your build asks for 'make' it should get gnu make

    flex and bison you already know about.

Aliases aren't passed through makefiles and often not through shell
scripts either, so you'll have to do this with $PATH magic and/or
symbolic links.  I built/installed bash, make, flex, bison, binutils,
gcc, and a bunch of other GNU tools (ls, find, tar, gzip, patch) into
/opt/puffin and put /opt/puffin/bin first in my $PATH.

Your difficulties building palo strongly indicate that HP make is
sometimes being used.  palo/palo/Makefile and palo/ipl/Makefile
will work with either HP make or GNU make, but palo/Makefile will
only work with GNU make.  When you do 'make palo' from linux-2.3,
the master make eventually does 'cd ../palo; make lifimage', and
it appears that perhaps this invocation of make is getting the HP one.

Sooner or later it is probably a good idea to start using GNU versions
of all the tools referenced in the makefiles and scripts if you have
the space to do so.

Happy building!

	-Paul Bame
