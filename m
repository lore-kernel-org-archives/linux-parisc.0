Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA21300
	for <parisc-linux@puffin.external.hp.com>; Fri, 16 Jul 1999 13:44:43 -0600
Message-Id: <199907161734.NAA01720@hiauly1.hia.nrc.ca>
Subject: Re: Antwort: Re: [parisc-linux] 715/33 experience and one question
To: Ulrich.Strelow@Schering.DE
Date: Fri, 16 Jul 1999 13:34:32 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Helge.Deller@ruhr-uni-bochum.de, parisc-linux@thepuffingroup.com
In-Reply-To: <C12567B0.0045F7F0.00@BE2314.schering.de> from "Ulrich.Strelow@Schering.DE" at Jul 16, 99 02:44:05 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Hello Helge,
> >>
> >> PSW: 00000000
> >> EIR: 00000000
> >> interrupted with code 241, regs 00000000
> >> IAOQ: 00000000 00000000
> >> Calibrating delay loop...
> >>
> >> Then it hangs with no leds blinking ...
> 
> >did you tried before or after Phillip's last commit (head.s changed) ?
> 
> head.S is Revision 1.23  1999/07/15 13:52:59  deller

My experience with my 735/99 is essentially the same.  With the same revision
of head.S, the boot hangs at the same spot with no leds blinking.  No dino
is found.  Here is the final output:

interrupted with code 142, regs 00000000
IAOQ: 00000000	0000000a
PSW:  00000000
EIR:  80000000
interrupted with code 241, regs 0000000a
IAOQ: 00000000	0000000a
Calibrating delay loop...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
