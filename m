Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA19485
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Nov 1999 00:51:55 -0700
Date: Wed, 10 Nov 1999 04:03:39 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HIL status
In-Reply-To: <19991110004745.T25252@mencheca.ch.genedata.com>
Message-ID: <Pine.LNX.4.10.9911100345000.11043-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Wed, 10 Nov 1999, Matthew Wilcox wrote:
> I've taken the hp300 HIL driver written by Phil Blundell and it `works'
> on my 715/33.  It's producing the wrong keycodes, it's doing work that an
> ASP driver ought to be doing and it's producing a fair bit of extraneous
> crap on the screen.  But I'm getting interrupts and keycodes so I'm
> happy for tonight :-)

Yay!

Having ASP interrupts working will enable a lot of different boxes to be
supported, mostly 715s.  I have a /50, /75 and probably /100 to test on.

The closest things we have to ASP docs are:
- take the portions of the Lasi docs that describe how Lasi is not like
ASP, and read backwards
- openbsd
- mklinux 

> The next obvious step is to have an ASP manager, like LASI.  In fact, so
> much like LASI, it probably ought to be in the same driver.  

My best guess is that Lasi is really ASP but integrated onto one cell with
a couple of bug fixes.  So yes, it really should be the same driver if at
all possible.  I had actually started on this but hadn't had time to get
it working. :)

> This seems to
> be how Mach does it, and there's a rumour this is also how HPUX does it.
> My question is: how?  Mach hardcodes the address of ASP to 0xf0800000,
> but there's nothing even close in the driver list.  I notice in the
> bootlogs which have previously been posted, LASI was at the address of
> `Core BA', but you can see that's wildly different on this machine.
> Should I invent my own and insert it into the structures we have?

Hrm.  That's uncomfortable. So did it actually work at 0xf0800000?

The problem comes when we hit an ASP that's not at 0xf0800000, which I'd
think might come up with ASP add on cards.

I don't think that firmware is lying, though.  Perhaps we just need to
subtract 0x2f000 for some reason.

> Here's the driver list printed at boot on the 715 (is someone collecting
> these somewhere?)

Within a week, I'll send some mail about The Puffin PA RISC Hardware
Guide. Details to come.

- Alex
