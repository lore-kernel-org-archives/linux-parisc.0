Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85B1D482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 May 2001 11:28:42 -0600 (MDT)
To: herrold <herrold@owlriver.com>
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	plaven@ozemail.com.au, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: List of packages for hppa ISO release version
 2
In-Reply-To: Message from herrold <herrold@owlriver.com>
   of "Wed, 30 May 2001 13:13:37 EDT." <Pine.LNX.4.33.0105301310180.6841-100000@pokey.513erich.iwaynet.net>
References: <Pine.LNX.4.33.0105301310180.6841-100000@pokey.513erich.iwaynet.net> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 30 May 2001 11:31:26 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010530173126.765C837CFD@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

herrold writes...

> On Wed, 30 May 2001, Grant Grundler wrote:
> 
> > "Pete" wrote:
> > > Can I ask the reason why this is being taken out?
> >
> > ssh is subject to US export restrictions. We can't export
> > a CD image with it either.
> > Debian has it in "non-us" section for the same reason - so it can be
> > built/distributed "off-shore". Stupid, but that's the law here, now.
> 
> Not to put too fine a point on it, but the US ITAR regulations were
> relaxed over a year ago for non-commercial distribution after a
> single notification.  The relevant RSA patent is expired for six
> months.  Please contact me offlist if any questions -- the OpenSSH
> and OpenSSL packages seem like no-brainers ...

My, non-legal-word-of-mouth-only, understanding is that the BXA still need to 
be contacted for each release. I'm not sure what that entails but it doesn't 
sound like freedom to me. IMHO, there's something to be said for following the 
letter of the law to make a political point.

FYI- we did decide to ship bind9 which is also in non-US because bind upstream 
has gone through the effort required for export.

Anyway given that we plan to release in the next day or so, we don't have time 
to deal with it anyway. Maybe we'll have figured it out for the next release, 
and hopefully Debian will have solved it for us before then. For now point at 
non-US.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
