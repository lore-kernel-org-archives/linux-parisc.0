Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA03628
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 17:16:21 -0700
Sender: subc@mailserv2.iuinc.com
Message-ID: <38D01A06.DB498CE5@subcarrier.org>
Date: Wed, 15 Mar 2000 18:17:26 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] merge strategy - file owners needed
List-ID: <linux-parisc.vger.kernel.org>

Here's the proposed plan for Friday:

The tree closes at 11am EST (8am PST, 4pm UTC, 5pm CET) - no one checks
in.
I lay down LINUS_2399_PRE1_PREMERGE before starting the merge.
I merge all the files that have been changed by Linus only

I lay down LINUS_2399_PRE1_FIXUP.
The tree is still "closed", but now people can do checkins related to
merging.
The files requiring manual attention are dealt with (by their "owners")
and checked in.
Co-ordination via IRC.

I lay down LINUS_2399_PRE1_DEVEL to mark the end of the merge.
The tree opens for general development (probably mid afternoon).


These are the files that will need some special lovin' on Friday. 
Please step up and agree to "own" some files and do the merging for
those files.  To view the diff between the current tip version and
Linus' version try "cvs di -r1. -rlinus foo.c".

Files modified both by us and Linus:
Makefile,v
drivers/block/rd.c,v
drivers/char/serial.c,v
drivers/net/Makefile,v
drivers/net/Space.c,v
drivers/net/eepro100.c,v
drivers/net/pcnet32.c,v
drivers/pci/pci.c,v
drivers/scsi/Makefile,v
drivers/scsi/hosts.c,v
init/main.c,v
kernel/sched.c,v

Files we touched since last merge and rm'ed in Linus' 2.3.99 pre1
drivers/net/tulip.c,v
(There's a reworked tulip driver in /drivers/net/tulip/ - someone needs
to figure out the Right Thing to do here.)


Please let me know if you have any questions or suggestions.  The last
merge went as smoothly as such things go, and if everyone helps out,
this one should be no different.

	- Mike.
