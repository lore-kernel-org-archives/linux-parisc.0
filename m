Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F5234A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Feb 2001 21:28:09 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA13228
	for <parisc-linux@puffin.external.hp.com>; Sun, 25 Feb 2001 21:23:22 -0700
Message-Id: <200102260431.UAA23094@milano.cup.hp.com>
To: Matthieu Delahaye <delahaym@esiee.fr>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Unregister driver patch 
In-reply-to: Your message of "Sun, 25 Feb 2001 12:02:38 PST."
             <3A98E64E.A8A9216A@esiee.fr>
Date: Sun, 25 Feb 2001 20:30:55 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthieu Delahaye wrote:
> I think holidays aren't good for me.

hmmm...maybe not. ;^)

I'll apply the patch tomorrow barring major objections.
The patch looks good to me (with one nit noted below).
Thanks!


> -			if (device->managed)			continue;
> +			if ((int)device->driver) continue;

I'll change this to:
		if (NULL != device->driver) continue;

device->driver is a pointer and should certainly not be cast to an int
in this case. For 64-bit, we will loose the upper half of the address
and we want to test the entire address. Even if it worked, I wouldn't
want to risk it not working in the future.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
