Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA15821
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Mar 2000 15:59:37 -0700
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m12R04O-0027lhC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Fri, 3 Mar 2000 22:57:12 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Date: Fri, 3 Mar 2000 22:53:11 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Philipp Rumpf <prumpf@inwestnet.de>
Cc: Grant Grundler <grundler@cup.hp.com>, willy@thepuffingroup.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] code 28 trap
Message-ID: <20000303225311.C27816@alpha.franken.de>
References: <20000224224934.N9944@thepuffingroup.com> <200002252036.MAA04792@milano.cup.hp.com> <20000225230348.E812@abacus.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000225230348.E812@abacus.local>; from Philipp Rumpf on Fri, Feb 25, 2000 at 11:03:48PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Feb 25, 2000 at 11:03:48PM +0100, Philipp Rumpf wrote:
> > > Uh oh.  We really need a kernel unaligned trap handler.  Some of
> > > the network protocols rely on that being handled right (yes, i know.
> > > it sucks.)
> > 
> > It really sucks. If any code in the performance path depends on this,
> 
> Another vote for "it sucks".
> 
> Which network drivers, protocols aso exactly are you using (and did you
> check for the bug Matthew posted an URL for ?) ?  I really don't think
> we should write an unaligned handler until we find ourselves using weird
> protocols (and hopefully not even then).

the first person using IPX will need an unaligend trap handler. All the
ethernet driver try to align the IP header to a 32bit boundary (that's
the reason for the skb_reserve(skb, 2)), which messes up the alignment
in IPX headers. And there are ethernet chips, which can only handle
32bit aligned receive buffer (tulip for example). You either have to
copy the received frame to a proper aligned new skb (that's what we
do at the moment) or handle the missalignment in an unaligned trap
handler.

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
