Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA15293
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 22:08:49 -0700
Message-Id: <200012030511.VAA02450@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] merge activity 
In-reply-to: Your message of "Sat, 02 Dec 2000 21:08:03 PST."
             <20001202210803.D8288@parcelfarce.linux.theplanet.co.uk>
Date: Sat, 02 Dec 2000 21:11:48 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> those on the CVS list will have noticed a lot of activity just recently.
> Alan Cox & myself are geting the tree into a state where it can be dropped
> on Linus.

Excellent you guys!

> A number of changes have been made:
> 
> s/STATIC/static/

It's ok that's it dropped but since I added I think you should know
why o put it in, in the first place.

Prumpf criticized this in my first dino code drop claiming one
could just compile with "-Dstatic=" to get the same effect
as "-DSTATIC=". That's not true. data declared static inside
a function will behave differently without "static" storage class.
STATIC serves to differentiate function declarations from local
static data declarations.

Why differentiate? Debuggers. I want to make sure all the symbols
I care about are visible - I'm told under ELF they are. Under SOM
binary format I know they weren't.

> u_long becomes unsigned long

I've been using "ulong" as well. Is less than desirable as well?
Feel free to change if it is.

> old code has mostly been cleaned out
> a lot of #ifdefs have been removed.

Some of the "ifdef 0" I have in "my" code are there for future stuff.
An examples is code related to DELAYED_RESOURCE_CNT in sba_iommu.c.
Fortunately, this wasn't removed.
Haw should I mark this to make sure people understand it's work-in-progress?

thanks,
grant
