Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from richardson.uni2.net (richardson.uni2.net [129.142.7.104])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C77F4861
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Sep 2001 19:55:58 -0600 (MDT)
Received: from psy.bronderslev.dk (IDENT:postfix@p303-177.ppp.get2net.dk [195.82.210.177])
	by richardson.uni2.net (8.11.0/8.11.0) with ESMTP id f8D1ttd01629
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Sep 2001 03:55:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by psy.bronderslev.dk (Postfix) with ESMTP id 4DC8AA590
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Sep 2001 00:28:31 +0200 (CEST)
Date: Thu, 13 Sep 2001 00:28:31 +0200 (CEST)
From: Bent Wagner <psy@get2net.dk>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0109130021290.1097-100000@psy.bronderslev.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] AUI on 725-100
List-ID: <linux-parisc.vger.kernel.org>

Hello all

I have some 725-100 boxes, but no AUI to rj45 adapters.

I have a HUB with an AUI connector on it.

Can i connect those two without using adapters, and if so
how should the cable be wired?

It seems odd to me that you should put adapters between the
machine and the HUB. Why not make it a BNC or rj45 instead?

I do have a netcard, a 100VG but it gives compiler errors
if i select it in the kernel configuration.



Bent Wagner
psy@get2net.dk
