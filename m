Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA20406
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 Jan 2001 22:17:40 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 4 Jan 2001 05:21:01 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id QAA28355;
	Thu, 4 Jan 2001 16:20:37 +1100
Date: Thu, 4 Jan 2001 16:20:37 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Jeffrey A Law <law@redhat.com>
cc: Paul Bame <bame@fc.hp.com>, John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
In-Reply-To: <8186.978581065@upchuck>
Message-ID: <Pine.LNX.4.21.0101041608490.15554-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 3 Jan 2001, Jeffrey A Law wrote:

> The easiest (to me) solution is to put the routines into the system C
> library.  You'd drop the special millcode conventions, but that's a

How about $$dyncall?  Wouldn't loading r19/r29 break this function?  I'm
thinking of the case where $$dyncall is passed the address of a local
function rather than a plabel.  We wouldn't want to load r19/r29 with the
value for a shared libgcc.

> small price given that the only ones you probably call with any
> regularity are div/mod in which case the cost of reloading the pic
> registers is dwarfed by cost of the divide.

-- 
Linuxcare.  Support for the Revolution.
