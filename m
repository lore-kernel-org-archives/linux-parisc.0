Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50AEC482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Apr 2001 04:35:00 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id D81B9B009; Mon, 30 Apr 2001 11:35:19 +0100 (BST)
Date: Mon, 30 Apr 2001 11:35:19 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "van de Werken, Matthew (DEM, PH)" <M.Vandewerken@cat.csiro.au>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Terminology
Message-ID: <20010430113519.N15532@linuxcare.com>
References: <A8566E157F5FD411BCFB00D0B7816D51C7295B@ntexchange.cat.csiro.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <A8566E157F5FD411BCFB00D0B7816D51C7295B@ntexchange.cat.csiro.au>; from M.Vandewerken@cat.csiro.au on Mon, Apr 30, 2001 at 04:13:56PM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Apr 30, 2001 at 04:13:56PM +1000, van de Werken, Matthew (DEM, PH) wrote:
> Hi folks:
> 
> I'm hoping someone can clear this up for me - it's not documented clearly
> anywhere that I can find.
> 
> What's a Zalon? Is it an interface chip between the FW SCSI on some 700
> series machines, or is it something else?

An interface chip between 53c720 and HPs internal GSC bus.  In my case
the Zalon chip is on a GSC card called Bluefish.

> What's an Outfield? I know this is on a 735, but some places I've seen say
> the 735 is a "hardball", while others list it as an "outfield". My
> understanding was that Outfield is equivalent to Zalon, only different. 

http://puffin.external.hp.com/parisc/hp9000_models.html shows hardball
as the project name for 735 machines.

http://216.208.98.4/view.php3?type=machine&name=735%2F99 shows outfield as the
main i/o control for the machine.

> What's a LASI? and how does it relate to the above? (Actually, this one is
> answered very nicely on the glossary page, but if someone can compare and
> contrast to the above I'd be grateful.

I'd say LASI was a newer Outfield.  LASI gives you 53c710 scsi rather
than 53700.  Outfield gives you 82596 LAN, whereas my B180 with LASI has
a Dino (GSCtoPCI bridge) and provides Tulip LAN that way.

Of course, I'm not that well up on HP internals, so hopefully an HP
person will correct anything I got wrong.

Richard
