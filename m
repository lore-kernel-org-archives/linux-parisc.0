Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pokey.513erich.iwaynet.net (router.513erich.iwaynet.net [206.244.44.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id A3839482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 May 2001 11:16:05 -0600 (MDT)
Date: Wed, 30 May 2001 13:13:37 -0400 (EDT)
From: herrold <herrold@owlriver.com>
Sender: <herrold@513erich.iwaynet.net>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: <plaven@ozemail.com.au>, <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: List of packages for hppa ISO release version
 2
In-Reply-To: <200105301504.JAA09492@puffin.external.hp.com>
Message-ID: <Pine.LNX.4.33.0105301310180.6841-100000@pokey.513erich.iwaynet.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 30 May 2001, Grant Grundler wrote:

> "Pete" wrote:
> > Can I ask the reason why this is being taken out?
>
> ssh is subject to US export restrictions. We can't export
> a CD image with it either.
> Debian has it in "non-us" section for the same reason - so it can be
> built/distributed "off-shore". Stupid, but that's the law here, now.

Not to put too fine a point on it, but the US ITAR regulations were
relaxed over a year ago for non-commercial distribution after a
single notification.  The relevant RSA patent is expired for six
months.  Please contact me offlist if any questions -- the OpenSSH
and OpenSSL packages seem like no-brainers ...

(I am a lawyer, although not _your_ lawyer, and 'read and write
this "code" proficiently)

-- Russ
