Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 048154829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Aug 2002 13:26:20 -0600 (MDT)
Received: from hpugrca.grc.hp.com (hpugrca.grc.hp.com [15.137.20.50])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 83CF91019
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Aug 2002 21:26:18 +0200 (METDST)
Date: Mon, 12 Aug 2002 21:25:16 +0200
From: Holger Zessel <holger_zessel@hp.com>
To: parisc-linux@lists.parisc-linux.org
Cc: Holger Zessel <Holger_Zessel@hp.com>
Subject: Re: [parisc-linux] Additional Network Cards for 712 / thx to Helge
Message-Id: <20020812212516.0eb88ee3.holger_zessel@hp.com>
In-Reply-To: <20020812191247.P27578@parcelfarce.linux.theplanet.co.uk>
References: <OFF5A919B5.02CBBDDB-ONC1256C13.0060CB62@hasler.ascom.ch>
	<20020812191247.P27578@parcelfarce.linux.theplanet.co.uk>
Reply-To: Holger Zessel <Holger_Zessel@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 12 Aug 2002 19:12:47 +0100
Matthew Wilcox <willy@debian.org> wrote:

> On Mon, Aug 12, 2002 at 07:46:49PM +0200, Thomas Schmid wrote:
> > 1) Are there any add-on NICs for the 712 available (preferably for only 
> > little money) ?
> 
> they're very specialised and quite rare.

We had some here in the office in the past for support and with the upcoming V class test stations (which are 712) these cards must have
gotten a real
boost in the factory since the test station (basically the console)
has a separate lan connection with the V class.

One needs a special cable to separate the signals since the card has a second serial port as well. Even if you don't buy the cable the 
part no. might be useful when looking for infos: A2263-62045.
If the cards part no. is needed, let me know.

> 
> > 2) More important, are they supported by the kernel ?
> 
> yes, they're the same chip as is on the motherboard, and the driver
> handles multiple devices.

This is a good point in time to finally thank Helge Deller for fixing a bug in the driver. I was experimenting with my 712/80 at home with the
2nd lancard and could not get it to work. It showed up correctly in the
hw scan but the driver did not allocate a second interface eth1.
(tiny thread july last year: problem activating the optional lan card on 712/80)

He made a quick fix for that and indeed it worked. 


cheers,
Holgi
