Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA06471
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 18:43:57 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 3 Jan 2001 01:47:17 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA20552;
	Wed, 3 Jan 2001 12:46:53 +1100
Date: Wed, 3 Jan 2001 12:46:52 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Jeffrey A Law <law@redhat.com>
cc: Paul Bame <bame@fc.hp.com>, John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
In-Reply-To: <27911.978466673@upchuck>
Message-ID: <Pine.LNX.4.21.0101031235310.24351-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 2 Jan 2001, Jeffrey A Law wrote:

> Moving it out of libgcc may or may not make sense.  If I recall the key thing
> to remember is that you want copies of those routines in each shared library,
> otherwise you can lose in unpleasant ways.  An alternative is to make the
> millicode routines themselves into a shared library and everyone links against.

The real reason that we currently need separate millicode routines for
each shared lib is that linkage to millicode functions is different than
for normal functions.  In particular, you don't want to load r19 (32 bit
case) or r27 (64 bit case) when calling millicode.  Therefore, a shared
millicode lib would require special .plt entries.  Not too hard to do,
just a bit messy.

Alan
-- 
Linuxcare.  Support for the Revolution.
