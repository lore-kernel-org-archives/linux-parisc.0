Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from zouave.sonic.net (zouave.sonic.net [209.204.172.153])
	by dsl2.external.hp.com (Postfix) with ESMTP id 16169482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Apr 2001 18:00:44 -0600 (MDT)
Subject: Re: [parisc-linux] Getting Started...
In-Reply-To: <A8566E157F5FD411BCFB00D0B7816D514459E4@ntexchange.cat.csiro.au> from "van de Werken, Matthew (DEM, PH)" at "Apr 3, 2001  9:38:41 am"
To: M.Vandewerken@cat.csiro.au (van de Werken, Matthew (DEM, PH))
Date: Tue, 3 Apr 2001 00:00:19 +0000 ()
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-Id: <20010403000019.74DF73A@frizzen.efball.com>
From: frankb@efball.com (E Frank Ball)
List-ID: <linux-parisc.vger.kernel.org>

I'm not using PA-RISC Linux, yet, but I hope to be soon.  I'm been using
ix86 linux for a few years, and HP-UX for 15 years.  I deal with 700
series hardware everyday at work, mostly 715s, 725s, and 745s.

} I have recently "acquired" a couple of old 735/xxx's, and I wish to run
} Linux on these.
} 
} * These boxes seem to have no indication whether they are 735/125 or 735/99
} - how do I find out which they are?

If they aren't labeled as "735/125" or "735/99" they should be 100MHz.


} * I don't know how much memory they have, how do I find this out? They have
} maybe half of the memory expansion slots filled.

The boot screen should print the memory amount almost first thing.  The
735s use different ram than all the other 700s, so I don't know the part
numbers.  If you tell me I might be able to check (A2575-60001 is a 32MB
card for the other 700s, look for that kind of a number).
Do the RAM cards have ICs loaded on boths sides or only 1?  How many ICs
on each side?

} * I have no HIL keyboard or mouse, is there a way to make a HIL-to-PS/2
} adapter so I can have a k/b and mouse at the console, or am I better off
} using a serial terminal?

Modular Industrial Computers Inc used to make a HIL to PS2 Converter
box.  I don't think they do anymore because they can't get the ICs
anymore (HP part number 1RD2-6001).   Nobody else makes them.  The HIL
keyboards and mice are probably still available as "replacement parts"
from HP.  TAMs (www.tamsinc.com) is another possible source, so is
Monterey Bay Communication.


} * These machines have no graphics output, how can I tell if they're alive?
} Serial cable to a terminal (9600-N-1)?

Yuk, no wonder you don't know how much RAM you have.


} * These machines have only the FDDI(?) optical network. I'm not sure how to
} connect these to my ethernet (if at all), or am I better off adding an ISA
} or EISA network card to the boxes?

All the ones I've seen had an AUI port.


} * Can I add an ISA or EISA network card to the boxes, and will it be
} recognised? Drivers?

I'd like to know the answer to this.  I have 715s with an EISA backplane
and then I could have two ethernet connections.  Can I use the 27245 (hp
driver) or 27247, 27252 (hp-plus driver) cards?  Or maybe the J2405
(lance driver) card?


   E Frank Ball                efball@efball.com
