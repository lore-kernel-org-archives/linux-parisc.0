Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA30824
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Nov 1999 11:15:46 -0700
Message-Id: <199911301817.NAA02676@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress - Update
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 30 Nov 1999 13:17:05 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de, alan@lxorguk.ukuu.org.uk,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199911252347.SAA01418@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 25, 99 06:47:19 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I built another kernel without IPC.  In this one, the kernel panic'd
> in get_unused_buffer_head.  This one occured because unused_list was
> zero.  Again, it looks like there is an initialization problem somewhere.
> I think others have reported this problem in the past.  It looks like:
> 
> bad address 0000001c (code 15)
> Kernel panic: bad address

I have found the cause of this panic.  The problem occurs when xchg
is called with a pointer which is not aligned on a 16 byte boundary.
The ldcws semaphore instruction is only defined when the address is
aligned on a 16 byte boundary.  It is used when the value to exchange
is 0.

The macro xchg is used in quite a few places in what is nominally
machine independent code.  Should we add __attribute__ ((aligned (16))
to the definitions of all variables which exchange with 0?  Or, should
we look for another solution?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
