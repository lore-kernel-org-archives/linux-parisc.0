Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA11259
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 19:48:34 -0700
Message-Id: <199911170248.VAA15412@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Today's boot experience on a 735
To: law@cygnus.com
Date: Tue, 16 Nov 1999 21:48:51 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bame@debian.fc.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <832.942805370@upchuck> from "Jeffrey A Law" at Nov 16, 99 07:22:50 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   In message <199911170204.VAA11108@hiauly1.hia.nrc.ca>you write:
>   > experimentaion, I found that there isn't a sort key that will put the
>   > $AFTERDLT$ section after the $DLT$ section.  However, I think the following
>   > solution will do the job.  Try it out.  It might depend on linker version
>   > or who knows what else.
> There's always a way.
> 
> Create a .o file which contains a DLT & AFTERDLT section.  Make sure the
> DLT section appears first in the object file (I'm assuming they have the
> same sort keys).  Referece that .o first on the link line.

As I noted, it appears to work as is.  Do you know why the DLT section
disappeared when I used the sort key of 255 for AFTERDLT?  Although
I haven't tried it, it may not be possible to create an object file with
both DLT and AFTERDLT sections.

Dave
