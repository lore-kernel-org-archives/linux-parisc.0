Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: Matthew Wilcox <willy@debian.org>,
	Ryan Bradetich <rbradetich@uswest.net>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Problem find devices on the E55 I/O interfaces 
In-Reply-To: Message from Christoph Plattner <christoph.plattner@gmx.at>
   of "Wed, 03 Jul 2002 00:26:53 +0200." <3D2228AD.DC192B3B@gmx.at>
References: <3D1A377A.E0CFABBD@gmx.at> <1025579851.956.469.camel@beavis> <3D22101D.74982658@gmx.at> <christoph.plattner@gmx.at> <20020702212501.84BD14861@dsl2.external.hp.com> <20020702225559.G27706@parcelfarce.linux.theplanet.co.uk>  <3D2228AD.DC192B3B@gmx.at> 
Date: Tue, 02 Jul 2002 18:48:54 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020703004854.74746486E@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Christoph Plattner wrote:
> So, the devices below may be the HP-PB bus, as you mentioned.
> The resulting question: is this HP-PB bus now transperent ?

The bus converter is "transparent", not the bus.
ie everything we need to know about the secondary bus, we should be able
to read from the bus converter.

> Why are the devices not found ?
> 
> The point confusing me, is that the PDC boot monitor can display the
> hardware paths below the "56", but Linux calling PDC calls cannot see
> those devices, independent, if the device type is really know or only
> found as unknown.

Sounds like the bus walk code is looking at the wrong address
for walking the lower BC port.

I'll point Ryan at the IO ACD (ioacd_v096.pdf only seems to be
available inside HP *sigh*) and he can sort it out.

grant
