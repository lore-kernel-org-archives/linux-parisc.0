Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA08222
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 22:32:59 -0700
From: dhazeghi@pacbell.net
Received: from pacbell.net ([63.197.150.190])
 by mta6.snfc21.pbi.net (Sun Internet Mail Server sims.3.5.2000.01.05.12.18.p9)
 with ESMTP id <0G4100ES2W8R5C@mta6.snfc21.pbi.net> for
 parisc-linux@thepuffingroup.com; Tue, 14 Nov 2000 21:22:03 -0800 (PST)
Date: Tue, 14 Nov 2000 21:23:41 -0800
Subject: Re: [parisc-linux] [Semi OT] SOM Linker
Sender: dara@mta6.snfc21.pbi.net
To: parisc-linux@thepuffingroup.com
Message-id: <3A121DDD.992ECBC8@pacbell.net>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
References: <200011150300.WAA20789@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

John David Anglin wrote:

> > I would like to be able to set up a cross compilation environment for hpux and
> > 32 bit PA-RISC. However without a functional cross linker, this is impossible
> > to do, and as binutils has not got one yet, I thought perhaps the one that HP
> > open-sourced might be some use. It would seem logical that with the sources
> > available, it shouldn't be too difficult to fix the broken bits and get a SOM
> > linker working in binutils, but that doesn't seem to have happened yet. Oh
> > well, thanks for the info...
>
> You should be able to build cross compilation tools under hpux for hppa-linux.
> First you should install native versions of binutils and gcc under hpux (this
> assumes that you have the hpux C compiler and linker).  The release version of
> gcc (2.95.2) would be a good choice.  The standard hpux linker works fine with
> gcc/gas for C compilations.  Then follow the directions at www.parisc-linux.org
> for building the cross compilation tools and linux.

This is not precisely what I mean. What I should have said is that I want to create
a cross compiler --host=i686-linux --target=hppa-hpux. I asked this list, because
you folks did some work on the SOM linker, which is at the moment the missing piece
for a cross toolchain which targets hpux.

Thanks,

Dara

P.S. On a different note, is the recipe fully up to date? I tried following it a
few weeks ago, but glibc did not complete building successfully.
