Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA14031
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 20:28:06 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 3 Dec 2000 03:30:33 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA22117;
	Sun, 3 Dec 2000 14:30:07 +1100
Date: Sun, 3 Dec 2000 14:30:07 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Henderson <rth@redhat.com>
cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com,
        gcc-patches@gcc.gnu.org
Subject: Re: pa reload problem
In-Reply-To: <20001202114327.C27671@redhat.com>
Message-ID: <Pine.LNX.4.21.0012031415130.16588-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 2 Dec 2000, Richard Henderson wrote:

> On Sat, Dec 02, 2000 at 11:35:19PM +1100, Alan Modra wrote:
> > 	* flow.c (mark_regs_live_at_end): Set PIC_OFFSET_TABLE_REGNUM even
> > 	when PIC_OFFSET_TABLE_REG_CALL_CLOBBERED.
> 
> I can't believe this makes a difference.  We already have

It did, I can assure you.  Thanks for the feedback though.  I'll freely 
admit to not having much of an understanding of gcc internals.  What I've 
learned has mostly been from poking around with gdb when faced with a gcc 
bug, and I rely on you and others pointing out the proper fix from a
higher level perspective.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
