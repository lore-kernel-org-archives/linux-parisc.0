Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA16662
	for <parisc-linux@puffin.external.hp.com>; Sat, 20 Jan 2001 13:57:41 -0700
To: "Phillip D. Beal" <pdbeal@louisville.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Question for the Faq 
In-Reply-To: Message from "Phillip D. Beal" <pdbeal@louisville.edu>
   of "Sat, 20 Jan 2001 08:26:48 EST." <20010120082648.A18988@athena.louisville.edu>
References: <20010120082648.A18988@athena.louisville.edu> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 20 Jan 2001 14:03:23 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010120210323.408B737C8D@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


"Phillip D. Beal" writes...

> Hey,
> 
> I thought I'd post this to be added to the faq, as I was stumped on this
> problem for a while, and I think some people might hit the same problem.
> 
> Q: The system boots up on the sTI Console but no "login:" prompt appears,
> what do I do?
> 
> A: Uncomment the tty0 in /etc/inittab.
> 
> Just a thought....I spent a couple of days trying to figure out why the
> console didn't completely work and I found that the tty's were commented
> out under /etc/inittab.  

Yes this was mentioned on the list before but failed to make it into the FAQ.

Added.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
