Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA08368
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Mar 2000 10:04:48 -0700
From: willy@thepuffingroup.com
Date: Sun, 5 Mar 2000 11:05:52 -0500
To: rob hoppe <hoppe@mindspring.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] uncacheable memory  (D370)
Message-ID: <20000305110552.G9944@thepuffingroup.com>
References: <20000304144938.A9944@thepuffingroup.com> <200003050549.VAA03562@milano.cup.hp.com> <20000305092901.E9944@thepuffingroup.com> <38C283DC.83968072@mindspring.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <38C283DC.83968072@mindspring.com>; from rob hoppe on Sun, Mar 05, 2000 at 10:57:16AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Mar 05, 2000 at 10:57:16AM -0500, rob hoppe wrote:
> 
> 
> > >  - T-class has something similar to U2 which is NOT I/O coherent
> >
> 
> I have a chance at a T-500.  Is it of use?

Not in the short term, but if you can get access to it, I'd love to see
ioscan output turn up in the hwdb...

> >
> > 725/100, 715/later, E-class, early D-class).
> >
> > > o PA-7300LC systems *might* support uncacheable memory and subcacheline...
> > >   (Could anyone definitively answer this for any PA-7300LC box?)
> >
> 
> Where does the D-370 dual processor fit here?

The D370 has a U2 IOA in it and as such is IO Coherent.
