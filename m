Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8D4049C6
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 02:49:09 -0600 (MDT)
Date: Fri, 28 Sep 2001 10:49:00 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Jurij Smakov <jurij@lokmail.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 720 - some progress 
In-Reply-To: <200109271442.KAA14125@mail.lokmail.net>
Message-ID: <Pine.NEB.4.33.0109281042070.29830-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Jurij,

using your patch, the programs ls etc don't trap anymore, but they just
hang.

> +               if(!(regs->iir & 0xfc000000) && (((regs->iir & 0x1fe0)>>5) == 0x45)) {
> +                 /* This is MFCTL instruction */
> +                 fromcr = (regs->iir & 0x03e00000)>>21;
> +                 togr = (regs->iir & 0x1f);
> +                 /* Emulate the instruction if the read is from cr27 */
> +                 if(fromcr == 27) {
> +                   regs->gr[togr] = regs->cr27;

I guess you need to advance the PC at this place. Something like:

		regs->iaoq[0] = regs->iaoq[1];
		regs->iaoq[1] = regs->iaoq[0] + 4;

> +                   return;
> +                 }
> +               }
> +               /* Something else is wrong */

If i add these instructions, ls no longer hangs but traps again with a
trap 15. Using show_regs(), it looks like there is always a 0 loaded to
the register. So my current question is:

where does regs->cr27 get written to the stack? Does the PA-RISC CPU does
this automatically on a start of a trap or does the code in entry.S need
to do this?

Cheers,
Jochen
