Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA31105
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Nov 1999 11:29:25 -0700
Date: Tue, 30 Nov 1999 19:32:44 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        alan@lxorguk.ukuu.org.uk, sieler@allegro.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress - Update
Message-Id: <19991130193244.A4951@mathe.stud.uni-erlangen.de>
References: <199911252347.SAA01418@hiauly1.hia.nrc.ca> <199911301817.NAA02676@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911301817.NAA02676@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> I have found the cause of this panic.  The problem occurs when xchg
> is called with a pointer which is not aligned on a 16 byte boundary.
> The ldcws semaphore instruction is only defined when the address is
> aligned on a 16 byte boundary.  It is used when the value to exchange
> is 0.

> The macro xchg is used in quite a few places in what is nominally
> machine independent code.  Should we add __attribute__ ((aligned (16))
> to the definitions of all variables which exchange with 0?  Or, should
> we look for another solution?

The problem with all this is xchg needs to be atomic, so there is no easy
and obviously correct way to do it.  Probably the most feasible thing is
to use spin_lock_irqsave / spin_unlock_irqrestore on an array of spinlocks
indexed by a hash of the address - x86istic code expecting xchg() to be
fast is going to suck I'd guess.

	Philipp Rumpf
