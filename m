Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA25190
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Oct 1999 13:43:09 -0600
Sender: adevries@thepuffingroup.com
Message-ID: <37F906A1.6D6CB753@thepuffingroup.com>
Date: Mon, 04 Oct 1999 15:57:21 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: parisc-linux@thepuffingroup.com, grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] Dino developments...
References: <199910040530.WAA15020@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> First cut review notes on the v1.17 dino.c:
> 
> o card-mode is only supported by dino 3.x.
>   Only need to look for card-mode which is 3.0 or better.
>   Look for DINO_MEM_DATA in the Dino ERS.
>   I know for a fact none were shipped and no HP-UX drivers
>   were shipped to support it either.

Ah, okay.  This is info that's not in the docs. 

> o "struct hp_driver" is not named very well. Needed more beer? :^)
>   I'd like to suggest "struct pa_iodc_driver" or something like that.

I agree.

> o I'm not sure any systems were shipped with 2.0 built-in dino.
>   Anybody know? What about 2.1's?
>   I don't expect numbers to be posted here - just the existence.

I'd say just leave those config lines in for now.

> o I see my long-ass comment about broken dino versions has been removed.
>   Was it intentionally removed?
>   (It's ok...I wrote it because I thought it was either useful or
>   interesting depending on why anyone bothers reading the code).

That's now been moved to README.dino

> 
> o "struct dino_version_mapping" doesn't appear to be used.
>   Can this go?

Yes!

> o FYI: "ifdef USE_PCI_INTR_OPS" stuff is mine.
>   I want to save it for some experiments on interrupt path latency.
>   May be able to run those by the end of this month at this pace.

Sounds good.

> o I'd like to move the card-mode initialization into a seperate
>   routine. Makes the common initialization easier to read.
>   I can already see some stuff is missing too.

That's a good plan.  I simply stole the config stuff out of the Dino
docs' example, and it worked, I never actually figured out what it
should be. I'm still stunned that it worked.

> o Before generic PCI  bus walk occurs card-mode dino support must
>   program PCI_INTERRUPT_LINE of each PCI device below it.
>   Firmware does this for PCI devices below built-in Dino.
>   For now, this can be a simple none-recursive bus walk since
>   very few people will have the card-mode expansion chassis (which
>   uses PCI-PCI bridges).
>   I'll take care of it this week but just wanted it noted in case
>   anyone wonders why card-mode interrupts don't work now.

Sounds good.

> o is_buildtin_dino(). Typo and it's not needed right now.

That should probably be removed then.

> o 0x05d. Need the workaround to eventually support J2240 firmware bug.
>   This was included in the macros I had posted previously.
>   Can just add another HPHW_BRIDGE entry instead.

That's a good idea.

Grant, I'll leave it to you to commit these changes.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
