Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA23439
	for <parisc-linux@puffin.external.hp.com>; Wed, 2 Aug 2000 09:01:42 -0600
Message-Id: <200008021503.KAA26727@opus.cirr.com>
From: eric@cirr.com (Eric Schnoebelen)
To: Richard Massa <int19@hydra.acs.uci.edu>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] A question... 
In-reply-to: Your message of "Tue, 01 Aug 2000 13:14:54 PDT."
             <200008012014.NAA08622@miami.acs.uci.edu>
Date: Wed, 02 Aug 2000 10:03:44 -0500
Sender: eric@cirr.com
List-ID: <linux-parisc.vger.kernel.org>


Richard Massa writes:
- I've got this exemplar in my office, it has 16 233 megahertz
- processors.  I was wondering if its possible to run parisc-linux
- on the machine...

	I suspect it will _never_ be possible to run
parisc-linux (or any Open Source OS) on the Exemplar Series
systems (especialy the SPP1x00 systems) as they are entirely
different than the HP PARISC workstation/server systems.

	A bit of background:  The Exemplar systems were
designed/built by CONVEX before the purchase of CONVEX by HP.
They have an entirely different memory architecture and IO
system.  The memory architecture is based on an SCI ring, if I
remember correctly.. Designed to allow multiple nodes to be
connected together to form a larger system (up to eight nodes in
a complex, as I remember..)  The IO system on an 1x00 system is
SBus based, while the IO system on the 2x00 (now generally
available as the V-class) are PCI based. (oh, and the firmware
is all OBP based.)

	As for an OS, the 1x00 systems run MACH, with a HP-UX
emulating server layer. (originally 9.0x, and later 10.01)

	All in all, you'll probably have more luck running
parisc-linux on the 712 test station.. :-) (and have the add in
ethernet/serial card to play with as well.)

--
Eric Schnoebelen		eric@cirr.com		http://www.cirr.com
	"We are interested in artificial intelligence because there
	  is so much less of the natural kind around these days."
