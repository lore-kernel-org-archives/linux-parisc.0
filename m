Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA19990
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Oct 1999 15:57:30 -0600
Message-Id: <199910032157.OAA14770@milano.cup.hp.com>
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PCI bus walking! 
In-reply-to: Your message of "Sun, 03 Oct 1999 02:54:47 PDT."
             <37F6FDB7.54FEEE9F@thepuffingroup.com>
Date: Sun, 03 Oct 1999 14:57:02 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> The kernel tree in CVS now has PCI code sort of working, so it can scan
> the PCI bus on a Dino and find devices.  It's still broken in several
> ways: it doesn't support multiple dino's, it can't handle interrupts yet,
> and is basically doing things in the wrong order, but does work.

Alex,
This is awesome! Kudos!

I can fix all of those things. Can you tell me:
o what's broken about multi-Dino support
o What you think is wrong with interrupts?
  (I assume registration isn't working as dino_interrupt() is simple)
o What's the order you are seeing and what order shoulds it be.

Kudos again!
grant

ps. Kudos to Philipp too for yesterdays code drop!
