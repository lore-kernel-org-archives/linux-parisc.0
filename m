Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA08296
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 21:08:29 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 3 Jan 2001 04:11:49 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA24176;
	Wed, 3 Jan 2001 15:11:33 +1100
Date: Wed, 3 Jan 2001 15:11:33 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Jeffrey A Law <law@redhat.com>
cc: Paul Bame <bame@fc.hp.com>, John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
In-Reply-To: <1895.978493055@upchuck>
Message-ID: <Pine.LNX.4.21.0101031509470.24351-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 2 Jan 2001, Jeffrey A Law wrote:

> 
> 
>   In message <Pine.LNX.4.21.0101031235310.24351-100000@front.linuxcare.com.au>y
> ou write:
>   > The real reason that we currently need separate millicode routines for
>   > each shared lib is that linkage to millicode functions is different than
>   > for normal functions.  In particular, you don't want to load r19 (32 bit
>   > case) or r27 (64 bit case) when calling millicode.  Therefore, a shared
>   > millicode lib would require special .plt entries.  Not too hard to do,
>   > just a bit messy.
> So what happens in this case.
> 
> Pretend shared library A references $$div from the millicode routines.  Also
> assume that the main program does not reference $$div.  Also assume that
> the shared library is _not_ referenced on the link line for the main
> program, but instead is sucked in via dl_open calls.

Ah, but that's where the automagic linker search for libmilli come into
play.  Effectively, libmilli is always mentioned on the "command line"

> The shared library will have an undefined reference for $$div which can't
> be satisfied and will terminate the application if we execute a path in
> the shared library which calls $$div.
> 
> 
> jeff
> 

-- 
Linuxcare.  Support for the Revolution.
