Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA22881
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Mar 2000 11:17:36 -0700
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by atlrel1.hp.com (Postfix) with ESMTP id 38AF1183
	for <parisc-linux@thepuffingroup.com>; Fri, 17 Mar 2000 12:19:00 -0500 (EST)
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.3.99pre1 merge CANCELLED 
In-reply-to: Your message of "Thu, 16 Mar 2000 20:12:28 EST."
             <38D1867C.F8098460@subcarrier.org>
Date: Fri, 17 Mar 2000 10:18:59 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12W0Op-0002kk-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= There have now been reported several problems with the 2.3.99pre1
= release, so prumpf is right that we should hold off merging for now. 
= Once there is a stable 2.3.99preX release, we should merge to that
= kernel since it has been some time since our last merge.

We could use this opportunity to start removing our SOM __setup
hacks since we're now based on ELF?

	-P
