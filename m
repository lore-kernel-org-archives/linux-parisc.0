Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA18027
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Jun 2000 13:26:15 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by atlrel1.hp.com (Postfix) with ESMTP id AA60019E64
	for <parisc-linux@thepuffingroup.com>; Thu,  1 Jun 2000 15:26:43 -0400 (EDT)
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 1E0084FD82
	for <parisc-linux@thepuffingroup.com>; Thu,  1 Jun 2000 14:26:43 -0400 (EDT)
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] No handler for interrupt 259 
In-reply-to: Your message of "Wed, 31 May 2000 10:27:23 PDT."
             <200005311727.KAA02868@milano.cup.hp.com>
Date: Thu, 01 Jun 2000 13:26:42 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12xac6-0008An-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


= So who *is* generating interrupt on EIRR bit 3?
= And do they interfer with Dino operation later by
= generating additional spurious interrupts?

It goes away when I remove CONFIG_VT...  Perhaps coincidence, perhaps not.

	-P
