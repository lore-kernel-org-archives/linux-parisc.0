Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79D38482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Jun 2001 16:07:59 -0600 (MDT)
Date: Mon, 4 Jun 2001 17:09:34 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: "Michael S. Zick" <mszick@pflash.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] D310 boot messages
In-Reply-To: <01060416591200.00472@wolf01.my.home>
Message-ID: <Pine.LNX.4.21.0106041708310.20217-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 4 Jun 2001, Michael S. Zick wrote:
> Thanks for the feedback -
> Your boot ends at the same point mine does -
> 
> I suspect that an entry needs to be made in /dev for the ttyB
> device and probably a line in /etc/inittab to proc a getty on it -
> 
> But I am just guessing - a *nix expert will have to tell us how.

I'll try it out in a little bit and report back when I get home.

dave

> Your message listing tells me a lot - my 9000/720 uses the same
> SCSI driver but doesn't work (yet) -
> 
> I have in the past (last week) built a working kernel - that used the
> STI driver and did not need the "ttyB" hack to by-pass its call to
> "register_console" in function "__init con_init of file linux/drivers/char/console.c
> 
> A seemingly related problem is getting my machine's HIL devices recognized -
> but the changes I made to fix the crator-on console_init fixed that also -
> now, if I can only find my notes.
> 
> So - I will find how I did that - put it back into this V0.9 kernel, then proceed to
> learn why the LASI-Sim700 driver for the 53c7xx doesn't work on my model 720.
> 
> I'll keep the list posted on what, if anything, I can find.
> 

-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison
