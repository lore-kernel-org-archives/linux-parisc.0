Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA06775
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 19:34:36 -0700
From: dhazeghi@pacbell.net
Received: from pacbell.net ([63.197.150.190])
 by mta5.snfc21.pbi.net (Sun Internet Mail Server sims.3.5.2000.01.05.12.18.p9)
 with ESMTP id <0G4100M32NNIUJ@mta5.snfc21.pbi.net> for
 parisc-linux@thepuffingroup.com; Tue, 14 Nov 2000 18:16:30 -0800 (PST)
Date: Tue, 14 Nov 2000 18:17:39 -0800
Subject: Re: [parisc-linux] [Semi OT] SOM Linker
Sender: dara@mta5.snfc21.pbi.net
To: parisc-linux@thepuffingroup.com
Message-id: <3A11F243.4A3625C@pacbell.net>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
References: <3A0F7D5B.4A70CB73@pacbell.net> <3A1037F0.826C9D8C@linuxcare.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:

> dhazeghi@pacbell.net wrote:
> > However I would like to know what work if any has been done on the SOM
> > linker which HP released to the public last November(?). It seems that
> > as of right now, it has not been touched since February 14, and the FSF
> > binutils snapshots still do not have any SOM support for ld. Has there
> > been any movement in merging this in, or is anybody working on this?
>
> The initial plan was to do our 32-bit userspace with SOM, worrying about
> ELF32 much later in the game.  But ELF32 development happened a lot
> quicker than expected, and so nobody's really done much on the SOM
> linker.

That's what it looked like...

>
>
> I suspect it'd be very hard to use the SOM linker code to incorporate it
> into binutils, but I could be wrong.
>
> What are you actually trying to do?

I would like to be able to set up a cross compilation environment for hpux and
32 bit PA-RISC. However without a functional cross linker, this is impossible
to do, and as binutils has not got one yet, I thought perhaps the one that HP
open-sourced might be some use. It would seem logical that with the sources
available, it shouldn't be too difficult to fix the broken bits and get a SOM
linker working in binutils, but that doesn't seem to have happened yet. Oh
well, thanks for the info...

Dara Hazeghi
