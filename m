Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA30040
	for <parisc-linux@puffin.external.hp.com>; Sun, 6 Feb 2000 19:29:44 -0700
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m12Hcve-0027TIC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Mon, 7 Feb 2000 02:25:26 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Date: Mon, 7 Feb 2000 01:32:09 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Tulip driver
Message-ID: <20000207013209.B3162@alpha.franken.de>
References: <20000206024651.B3143@alpha.franken.de> <200002061654.IAA09946@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002061654.IAA09946@milano.cup.hp.com>; from Grant Grundler on Sun, Feb 06, 2000 at 08:54:23AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Feb 06, 2000 at 08:54:23AM -0800, Grant Grundler wrote:
> Now I have the opposite problem: PCI code finds and initiliazes the
> tulips behind card-mode Dino but tulip.c doesn't want to talk to them.
> So I can't really say for sure my changes work.

The checked in tulip version probes for only one tulip chip. If you
want to make the driver probe for all tulips, search for the second
FIXME in the driver and remove the break; after the comment.

> I've committed my code anyway since the oboard tulip continues to work.
> Perhaps you can take another look at this.

still no go, now it hangs while probing the first tulip on the card.

Thomas.

PS: Anybody who wants to play with the tulip driver, use revision 1.4
of arch/parisc/kernel/irq.c. Newer versions got cleaned up, so they
don't work anymore:-( But with the old irq.c bootp handshake works and
I don't have to use the hacked sash anymore.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
