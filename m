Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7376449C4
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 03:19:57 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15mtoK-00052O-00; Fri, 28 Sep 2001 10:19:56 +0100
Date: Fri, 28 Sep 2001 10:19:56 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jochen Friedrich <jochen@scram.de>
Cc: Jurij Smakov <jurij@lokmail.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Message-ID: <20010928101956.B16748@parcelfarce.linux.theplanet.co.uk>
References: <200109271442.KAA14125@mail.lokmail.net> <Pine.NEB.4.33.0109281042070.29830-100000@www2.scram.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.NEB.4.33.0109281042070.29830-100000@www2.scram.de>; from jochen@scram.de on Fri, Sep 28, 2001 at 10:49:00AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 28, 2001 at 10:49:00AM +0200, Jochen Friedrich wrote:
> If i add these instructions, ls no longer hangs but traps again with a
> trap 15. Using show_regs(), it looks like there is always a 0 loaded to
> the register. So my current question is:
> 
> where does regs->cr27 get written to the stack? Does the PA-RISC CPU does
> this automatically on a start of a trap or does the code in entry.S need
> to do this?

cr27 is only written to when doing fork/clone/vfork, iirc.  use the mfctl()
macro in place of regs->cr27 as i suggested in my other email.

-- 
Revolutions do not require corporate support.
