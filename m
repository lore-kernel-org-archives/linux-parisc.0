Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA21791
	for <parisc-linux@puffin.external.hp.com>; Fri, 16 Jul 1999 14:34:16 -0600
Received: from postal.sr.hp.com (root@postal.sr.hp.com [15.4.46.173])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id QAA24962
	for <parisc-linux@thepuffingroup.com>; Fri, 16 Jul 1999 16:34:24 -0400 (EDT)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id NAA16597 for <parisc-linux@thepuffingroup.com>; Fri, 16 Jul 1999 13:33:50 -0700 (PDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id NAA22819 for parisc-linux@thepuffingroup.com; Fri, 16 Jul 1999 13:34:51 -0700 (PDT)
Message-Id: <199907162034.NAA22819@meow.sr.hp.com>
Subject: Re: Antwort: Re: [parisc-linux] 715/33 experience and one question (fwd)
To: parisc-linux@thepuffingroup.com
Date: Fri, 16 Jul 1999 13:34:50 -0700 (PDT)
From: Bill Katz <billk@sr.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

|> Hello Helge,
|> >>
|> >> PSW: 00000000
|> >> EIR: 00000000
|> >> interrupted with code 241, regs 00000000
|> >> IAOQ: 00000000 00000000
|> >> Calibrating delay loop...
|> >>
|> >> Then it hangs with no leds blinking ...
|> 
|> >did you tried before or after Phillip's last commit (head.s changed) ?
|> 
|> head.S is Revision 1.23  1999/07/15 13:52:59  deller
|
|My experience with my 735/99 is essentially the same.  With the same revision
|of head.S, the boot hangs at the same spot with no leds blinking.  No dino
|is found.  Here is the final output:
|
|interrupted with code 142, regs 00000000
|IAOQ: 00000000	0000000a
|PSW:  00000000
|EIR:  80000000
|interrupted with code 241, regs 0000000a
|IAOQ: 00000000	0000000a
|Calibrating delay loop...

The 735/99 and 715/33 (as well as the 715/50 /75) are all essentially the
same computers (as well as 725 /75, ...).  If any of them find a DINO,
we've got real problems ;-)

They all use the PCX-T (aka PA7100, aka T-Bird) processor, with the
original snakes CEC.

	-Bill
