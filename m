Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA08904
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 16:05:59 -0700
Message-Id: <200012042308.SAA07602@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: alan@linuxcare.com.au (Alan Modra)
Date: Mon, 4 Dec 2000 18:08:01 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rhirst@linuxcare.com, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0012050950420.16721-100000@front.linuxcare.com.au> from "Alan Modra" at Dec 5, 2000 09:55:04 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Mon, 4 Dec 2000, Richard Hirst wrote:
> 
> > > Note that all of the above applies to 32-bit modutils too.
> > 
> > Shouldn't be an issue with 32 bit, as kernel and modules all have
> > the same dp there.
> 
> Yes, silly me.  32 bit is non-pic, so you don't need to worry about
> it.  (%r19 in 32 bit case)

However, it may be an issue for 32 bit pic code under hpux.  It is not
clear to me why this didn't show up before with 32 bit pic code.  For
some reason, the circumstances which caused combine to delete the set
restoring dp after function calls didn't seem to occur.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
