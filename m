Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from khan.acc.umu.se (khan.acc.umu.se [130.239.18.139])
	by dsl2.external.hp.com (Postfix) with ESMTP id 25B50483C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Sep 2001 20:48:26 -0600 (MDT)
Date: Thu, 13 Sep 2001 04:48:24 +0200 (MEST)
From: Mattias Wadenstein <maswan@acc.umu.se>
To: Bent Wagner <psy@get2net.dk>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] AUI on 725-100
In-Reply-To: <Pine.LNX.4.21.0109130021290.1097-100000@psy.bronderslev.dk>
Message-ID: <Pine.GSO.4.33.0109130446180.43-100000@tiger.acc.umu.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 13 Sep 2001, Bent Wagner wrote:

>
> Hello all
>
> I have some 725-100 boxes, but no AUI to rj45 adapters.
>
> I have a HUB with an AUI connector on it.
>
> Can i connect those two without using adapters, and if so
> how should the cable be wired?

http://www.hardwarebook.net/cable/network/aui2aui.html

(Just a small plug for a local project :) )

> It seems odd to me that you should put adapters between the
> machine and the HUB. Why not make it a BNC or rj45 instead?

BNC or (most) rj45 cables handles distances better, I think. But AUI is
universal, there are adapters from that to the other media formats
(including thick coax). I think that is the explanation.

/Mattias Wadenstein
