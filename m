Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA11505
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 20:36:44 -0700
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: bame@debian.fc.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Today's boot experience on a 735 
Reply-To: law@cygnus.com
In-reply-to: Your message of Tue, 16 Nov 1999 21:48:51 EST.
             <199911170248.VAA15412@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 16 Nov 1999 20:35:56 -0700
Message-ID: <1129.942809756@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <199911170248.VAA15412@hiauly1.hia.nrc.ca>you write:
  > > 
  > > Create a .o file which contains a DLT & AFTERDLT section.  Make sure the
  > > DLT section appears first in the object file (I'm assuming they have the
  > > same sort keys).  Referece that .o first on the link line.
  > 
  > As I noted, it appears to work as is.
Yea, but you appear to be depending on highly suspicious behavior.    The
trick of ordering subspaces in the first .o on the link line to provide an
ordering for the subspaces in the final executable relies on documented
behavior of the HP linker.


  > you know why the DLT section
  > disappeared when I used the sort key of 255 for AFTERDLT?  Although
  > I haven't tried it, it may not be possible to create an object file with
  > both DLT and AFTERDLT sections.
Not really.  I do know that we had major problems with pxdb (post-link 
processor
on HPs) mysteriously removing subspaces with sort keys of 255 in the past.

jeff
