Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA08318
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 15:52:53 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 4 Dec 2000 22:55:26 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA17493;
	Tue, 5 Dec 2000 09:55:04 +1100
Date: Tue, 5 Dec 2000 09:55:04 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: pa reload problem
In-Reply-To: <20001204184009.K7166@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0012050950420.16721-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 4 Dec 2000, Richard Hirst wrote:

> > Note that all of the above applies to 32-bit modutils too.
> 
> Shouldn't be an issue with 32 bit, as kernel and modules all have
> the same dp there.

Yes, silly me.  32 bit is non-pic, so you don't need to worry about
it.  (%r19 in 32 bit case)

-- 
Linuxcare.  Support for the Revolution.
