Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover (rover.mkp.net [209.217.122.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A425483C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Sep 2001 21:18:45 -0600 (MDT)
Sender: mkp@mkp.net
To: Bent Wagner <psy@get2net.dk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] AUI on 725-100
References: <Pine.LNX.4.21.0109130021290.1097-100000@psy.bronderslev.dk>
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 12 Sep 2001 23:18:41 -0400
In-Reply-To: <Pine.LNX.4.21.0109130021290.1097-100000@psy.bronderslev.dk>
Message-ID: <yq1zo7zzsku.fsf@jcb.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Bent" == Bent Wagner <psy@get2net.dk> writes:

Bent> I have some 725-100 boxes, but no AUI to rj45 adapters.

Bent> I have a HUB with an AUI connector on it.

Bent> Can i connect those two without using adapters, and if so how
Bent> should the cable be wired?

http://www.cisco.com/warp/public/779/smbiz/service/knowledge/pinouts/aui.htm


Bent> It seems odd to me that you should put adapters between the
Bent> machine and the HUB. Why not make it a BNC or rj45 instead?

AUI was the standard ethernet interface many years ago.  It had the
advantage that you could connect a suitable transceiver depending on
your network type (thick, thin, RJ45, fibre).

There's a similar media-independent interface for Fast Ethernet called
MII.  You'll find that on a lot of high-end equipment.

-- 
Martin K. Petersen      Cereal Bowl Engineer, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, GNOME
