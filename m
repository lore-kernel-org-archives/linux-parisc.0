Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA01555
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Oct 1999 01:33:09 -0600
Message-ID: <19991020073501.11967.rocketmail@web507.yahoomail.com>
Date: Wed, 20 Oct 1999 00:35:01 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] What's in a 715?
To: Alex deVries <adevries@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Alex,

I asked nearly the same question some months ago,
because I needed to understand which CONFIG options
should be set for my 715/33. 

Bill Katz from HP answered:

The 715/33 does NOT have either LASI or DINO. It uses
an older I/O chip known as ASP. ASP connects the
processor bus to several external chips, including the
NCR 53c710, Intel LAN and WD 16C552 (? I'm doing this
from memory) 2-serial/parallel chip. It uses the
PA7100 CPU which does not have GSC. 

And Mike Hibler answered:

We never had a 715/33 so I don't know anything about
them. But someone else said they had the ASP which is
the "original snakes" IO subsystem
(705/710/720/730/750). The ASP is quite similar to the
LASI, and there is plenty of code in the Mach sources.


Hit your HP sources up for: 
Corba/Coral I/O Subsystem External Reference
Specification 

Don't have a part or drawing number unfortunately. We
have version 1.43 from November 1990. Looks like it
came out of Cupertino. 

Hope that helps.
Ulrich 
 

--- Alex deVries <adevries@thepuffingroup.com> wrote:
> 
> I have two 715s now, one's a 715/75, the other a
> 715/50.
> 
> Exactly how's the IO connected on these boxes?  Does
> it actually have a
> Lasi on board?  I had a look inside, and couldn't
> find anything with the
> usual markings of a Lasi, although it might not be
> integrated.
> 
> - Alex
> 
> -- 
> Alex deVries <adevries@thepuffingroup.com>
> Vice President Engineering
> The Puffin Group
> 
>
---------------------------------------------------------------------------
> To unsubscribe: send e-mail to
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 

__________________________________________________
Do You Yahoo!?
Bid and sell for free at http://auctions.yahoo.com
