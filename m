Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95E21482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Nov 2002 13:22:56 -0700 (MST)
Subject: Re: [parisc-linux] [RFC] Patch to handle parisc-device quirks/bugs.
From: Ryan Bradetich <rbradetich@uswest.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021117200021.E7530@parcelfarce.linux.theplanet.co.uk>
References: <1037559910.26816.9.camel@beavis>
	<20021117200021.E7530@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 17 Nov 2002 13:22:52 -0700
Message-Id: <1037564572.27005.20.camel@beavis>
Mime-Version: 1.0
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

On Sun, 2002-11-17 at 13:00, Matthew Wilcox wrote:
> On Sun, Nov 17, 2002 at 12:05:09PM -0700, Ryan Bradetich wrote:
> > The following patch fixes this problem by adding a HP hardare
> > quirks table, and fixing up the device early on in the discovery
> > process so everything else just works.
> 
> We have some other occurrences of this kind of problem:
> 
> Graphics cards are frequently wrong.
> HSC-PCI cards show up with the wrong sversion in 715/Mirage machines.
> One of the Dinos in the J2240 has the wrong sversion.

These could easily be added to the quirks list also :)

> We ignore the problem for gfx cards since we don't use the IDs anyway.
> The Dino problems are solved by additional IDs in the Dino driver.

ditto.

> It is legitimate for a driver to refuse to claim a device that it's
> advertised for.  So my personl preference is to advertise for all BC
> ports, and then refuse to claim the ones which are actually lower ports.
> That confines the knowledge to one driver.


So for this case, you would rather see the U2 GSC+ port added to the
hppb.c driver, and simply not-claim any driver that does not reside on
the central bus?  This would work because ccio only claims devices for
the U2 runway side, not the GSC side.

> This scheme doesn't fix the device name printout, but that seems less
> important.

The quirks fixes the print-outs, plus all these problems are fixed in
one place, drivers do not even to know there was a problem.

Either way works for me really, just pointing out the reason I built it
as a quirk table to begin with.

Thanks,

-Ryan

> -- 
> Revolutions do not require corporate support.
> 
