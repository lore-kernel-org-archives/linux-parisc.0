Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA27727
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 03:41:51 -0700
Message-ID: <19991116104321.17833.rocketmail@web504.yahoomail.com>
Date: Tue, 16 Nov 1999 02:43:21 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] problems with HPMC code in interruption.S
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

I have had the same problem yesterday (unresolved
symbol os_hpmc). The simple solution is to include
hpmc.o in arch/parisc/kernel/Makefile.

Although this works, I must admit that I don't
understand the reason for this problem. I think that
the reference in realmode_setup.c is commented out by
if SETUP_HPMC which is set to 0...

Maybe someone else has an explantion for this.
Ulrich

--- Alex deVries <adevries@thepuffingroup.com> wrote:
> 
> Because of the incompleteness of the HPMC code in
> the CVS tree right now,
> it looks like the kernel won't build because of
> os_hpmc problems.
> 
> Several people have mailed me about this, so just
> bear with us until
> Philipp has the time to look at it closer, unless
> someone know an obvious
> fix.
> 
> - Alex
> 
> -- 
> Alex deVries <adevries@thepuffingroup.com>
> Vice President Engineering
> The Puffin Group
> 
>
---------------------------------------------------------------------------
> To unsubscribe: send e-mail to
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


=====

__________________________________________________
Do You Yahoo!?
Bid and sell for free at http://auctions.yahoo.com
