Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A7894A92
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 05:18:49 -0600 (MDT)
Date: Sat, 29 Sep 2001 13:17:21 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: Matthew Wilcox <willy@debian.org>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 720 - some progress
In-Reply-To: <20010929080006.A25136@dogbert.localdomain>
Message-ID: <Pine.NEB.4.33.0109291313210.9243-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Albert,

On Sat, 29 Sep 2001, Albert Strasheim wrote:

> > 		if (fromcr == 26 || fromcr == 27) {
> > 			regs->gr[togr] = mfctl(fromcr);
> > 			return;
> > 		}
>
> Making this change causes the build to fail:

> {standard input}:912: Error: Undefined absolute constant: 'fromcr'.
> {standard input}:912: Error: Field out of range [0..31] (-1).
> {standard input}:912: Error: Invalid operands

> Jochen suggested that in the case 11 handler, Jurij's
>
> regs->gr[togr] = regs->cr27;
>
> be replaced with
>
> regs->iaoq[0] = regs->iaoq[1];
> regs->iaoq[1] = regs->iaoq[0] + 4;

Not replaced, but added:

 		if (fromcr == 26) {
 			regs->gr[togr] = mfctl(26);
			regs->iaoq[0] = regs->iaoq[1];
			regs->iaoq[1] = regs->iaoq[0] + 4;
 			return;
 		}
 		if (fromcr == 27) {
 			regs->gr[togr] = mfctl(27);
			regs->iaoq[0] = regs->iaoq[1];
			regs->iaoq[1] = regs->iaoq[0] + 4;
 			return;
 		}

These commands:

regs->iaoq[0] = regs->iaoq[1];
regs->iaoq[1] = regs->iaoq[0] + 4;

just advance the instruction counter of the PA-RISC CPU, so after
returning from the trap, the CPU will move on instead of retrying the
failed op-code (which will, of course, trap again causing an infinite
loop)

Cheers,
Jochen
