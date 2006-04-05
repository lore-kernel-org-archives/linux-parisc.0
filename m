From: Chris Frost <chris@frostnet.net>
Subject: Re: [parisc-linux] IOGear Firewire+USB card causes unexpected irq 2
Date: Wed, 5 Apr 2006 11:37:47 -0700
Message-ID: <20060405183747.GZ25493@pooh.bubble.frostnet.net>
References: <20060329093444.GA5593@pooh.bubble.frostnet.net> <20060330080202.GE5336@pooh.bubble.frostnet.net> <20060404033400.GQ25493@pooh.bubble.frostnet.net> <200604040805.33828.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <chris@frostnet.net>
In-Reply-To: <200604040805.33828.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Apr 04, 2006 at 08:05:33AM +0200, Helge Deller wrote:
> 01:0f.0 FireWire (IEEE 1394): NEC Corporation: Unknown device 00f2 (rev 01) (prog-if 10 [OHCI])
> says:	Interrupt: pin A routed to IRQ 9
> 
> Do you have CONFIG_EISA and/or CONFIG_ISA enabled ?
> If yes, try without...

Neither are enabled.
(But thanks for the suggestion.)

-- 
Chris Frost  |  <http://www.frostnet.net/chris/>
-------------+----------------------------------
Public PGP Key:
   Email chris@frostnet.net with the subject "retrieve pgp key"
   or visit <http://www.frostnet.net/chris/about/pgp_key.phtml>
