Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A530B4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Feb 2001 10:18:36 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA18207
	for <parisc-linux@puffin.external.hp.com>; Mon, 26 Feb 2001 10:13:48 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 26 Feb 2001 17:18:24 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14XQfR-0008Ix-00; Mon, 26 Feb 2001 16:38:33 +0000
Date: Mon, 26 Feb 2001 16:38:33 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthieu Delahaye <delahaym@esiee.fr>,
	parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Unregister driver patch
Message-ID: <20010226163833.C22753@parcelfarce.linux.theplanet.co.uk>
References: <3A98E64E.A8A9216A@esiee.fr> <200102260431.UAA23094@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102260431.UAA23094@milano.cup.hp.com>; from grundler@cup.hp.com on Sun, Feb 25, 2001 at 08:30:55PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Feb 25, 2001 at 08:30:55PM -0800, Grant Grundler wrote:
> > -			if (device->managed)			continue;
> > +			if ((int)device->driver) continue;
> 
> I'll change this to:
> 		if (NULL != device->driver) continue;

we definitely don't want to cast this to an int.  But what's wrong with

if (device->driver)
	continue;

it reads properly `if device has driver then continue'.  Sure, it's complex
to think about if you try and puzzle it out `so, if i've assigned a value to
driver then it's not 0, so this is true in which case continue', but if you
just read it, it says what it means.

-- 
Revolutions do not require corporate support.
