Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA11006
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 19:22:54 -0700
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: bame@debian.fc.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Today's boot experience on a 735 
Reply-To: law@cygnus.com
In-reply-to: Your message of Tue, 16 Nov 1999 21:04:08 EST.
             <199911170204.VAA11108@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 16 Nov 1999 19:22:50 -0700
Message-ID: <832.942805370@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <199911170204.VAA11108@hiauly1.hia.nrc.ca>you write:
  > experimentaion, I found that there isn't a sort key that will put the
  > $AFTERDLT$ section after the $DLT$ section.  However, I think the following
  > solution will do the job.  Try it out.  It might depend on linker version
  > or who knows what else.
There's always a way.

Create a .o file which contains a DLT & AFTERDLT section.  Make sure the
DLT section appears first in the object file (I'm assuming they have the
same sort keys).  Referece that .o first on the link line.

jeff
