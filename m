Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA04783
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 11:42:06 -0700
Received: from user-78-203.jakinternet.co.uk (HELO rhirst.linuxcare.com) (194.88.78.203)
  by mailserv2.iuinc.com with SMTP; 4 Dec 2000 18:44:39 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 175A5B005; Mon,  4 Dec 2000 18:40:10 +0000 (GMT)
Date: Mon, 4 Dec 2000 18:40:09 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: pa reload problem
Message-ID: <20001204184009.K7166@linuxcare.com>
References: <20001201202613.E7166@linuxcare.com> <Pine.LNX.4.21.0012021658060.21742-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0012021658060.21742-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Sat, Dec 02, 2000 at 06:15:14PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Dec 02, 2000 at 06:15:14PM +1100, Alan Modra wrote:
> > I hope I'm not supposed to do anything special with that $$divU call,
> 
> Unfortunately, I think you are supposed to.  All the $$ routines are from
> the millicode library, and are treated specially by the linker.  When
> doing a final link, these functions are never supplied by a shared
> library, but must come from a static lib like libgcc.a, or
> libmilli.a.  This has the effect of never calling these routines via the
> .plt, and so dp is preserved.  gcc isn't doing anything wrong here.
> 
> If you use a long branch stub that only trashes r1, you should be OK.
> _Don't load dp for these routines!  (I hope all libmilli routines are
> re-entrant - if not, we'd probably have weird kernel crashes...)

OK, done that, thanks.

> Note that all of the above applies to 32-bit modutils too.

Shouldn't be an issue with 32 bit, as kernel and modules all have
the same dp there.

Richard
