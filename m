Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA00701
	for <parisc-linux@puffin.external.hp.com>; Sun, 1 Aug 1999 22:27:39 -0600
To: Philipp Rumpf <prumpf@suse.de>
cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX syscall ABI? 
Reply-To: law@cygnus.com
In-reply-to: Your message of Mon, 02 Aug 1999 06:21:41 +0200.
             <19990802062141.A23880@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 01 Aug 1999 22:27:14 -0600
Message-ID: <31393.933568034@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <19990802062141.A23880@suse.de>you write:
  > Is this gcc-specific ?
It's a well known concept.  I would be amazed at any compiler that doesn't
do something similar.


  > I can imagine cases for which the PA1.1 ABI is better but of course I am
  > not sure how frequent they are.
Not if you write your compiler in a reasonable way (assuming we're just
discussing how many registers are used).  There are certainly ways the PA32
ABI is more efficient than the PA64 ABI, particularly when calling functions
without prototypes.

FWIW there is another PA32 ABI which appeared on hp's osf system which used
%r21-%r26 for passing parameters.  If you look deep into some of the mach+osf
code you'll find thunks to deal with that gem since we (Utah) used the standard
hpux ABI on our mach+osf port.

jeff
