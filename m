Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA22390
	for <parisc-linux@puffin.external.hp.com>; Fri, 16 Jul 1999 16:09:57 -0600
Message-Id: <199907162210.SAA02313@hiauly1.hia.nrc.ca>
Subject: Re: Antwort: Re: [parisc-linux] 715/33 experience and one question
To: prumpf@suse.de (Philipp Rumpf)
Date: Fri, 16 Jul 1999 18:10:18 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Ulrich.Strelow@Schering.DE, Helge.Deller@ruhr-uni-bochum.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19990716215106.P19641@suse.de> from "Philipp Rumpf" at Jul 16, 99 09:51:06 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > > head.S is Revision 1.23  1999/07/15 13:52:59  deller
> > 
> > My experience with my 735/99 is essentially the same.  With the same revision
> > of head.S, the boot hangs at the same spot with no leds blinking.  No dino
> > is found.  Here is the final output:
> 
> Try again, please. (I seem to have missed one file during my morning sync,
> which I tend to blame on the "morning" part).

...
interrupted with code 142, regs 00000000
IAOQ:	00000000	0000000a
PSW:	00000009
EIR:	00000000
interrupted with code 241, regs 00000000
IAOQ:	00000000	0000000a
Calibrating delay loop...
132.00 BogoMIPS
interrupted with code 17, regs 000ad600
IAOQ:	000211c0	000211c4
Kernel panic: here

Leds 1, 2, 3 and 4 were on.

System.map:

...
00021148 t $CODE$
000211a8 T free_initmem
000211b0 T do_check_pgt_cache
000211b8 T mem_init
000211c8 T __bad_pte_kernel
000211d0 T __bad_pte
000211d8 T get_pte_kernel_slow
...
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
