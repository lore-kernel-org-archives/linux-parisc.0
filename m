Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA24124
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Mar 2000 12:24:54 -0700
Received: from prismalink.com (IDENT:bheadley@d60.focal7.interaccess.com [207.208.187.60])
	by postal.interaccess.com (8.9.0/8.9.0) with ESMTP id MAA24600
	for <parisc-linux@thepuffingroup.com>; Fri, 17 Mar 2000 12:20:08 -0600 (CST)
Sender: bheadley@postal.interaccess.com
Message-ID: <38D27735.780FC3B0@prismalink.com>
Date: Fri, 17 Mar 2000 12:19:33 -0600
From: "Bryan W. Headley" <bheadley@prismalink.com>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] 2.3.99pre1 merge CANCELLED
References: <E12W0Op-0002kk-00@endor.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Personally, I'd merge now regardless of their situation. If the goal is to be
in the 2.4 baseline, then the rest of the development
community needs to see that the addition of the parisc code does not
negatively effect things.  If not, and it's a 2.5 delivery, we still
have to be firmly rooted in 2.4, when the two trees split off.

Also, the changes required to fix whatever's wrong with 2.3.99pre1 may be in
the realm of 3-4 files; what's the manifest for merging look like in
comparison, and what is the likelihood of the 3-4 (or whatever the count)
files between what you are merging/contributing and what they are fixing
overlapping each other?

Even if they do overlap, I'd rather manage the 1-2 line "patches" they put
into those overlapped files than continually hold off doing the merge.  Either
road, the sooner you can drop the manifest of the files to merge from "the
whole distribution" to a more manageable 2-5 files, plus arch/pa-risc, the
better.

The sooner we're in sync to something, the easier it'll be to keep in sync.
The early 2.4's will go fast, as things forgotten to be merged, or not merged
right and ferreted out and fixed. (One of the reasons I dislike the parallel
development paths: none of us have good enough revision control tools to
notice that something fixed in 2.2 after branch-off did not propagate to 2.3
as it should -- ah, for a PD Clearcase!)


--
Bryan W. Headley                     Phone: 312/913-9158
Chief Technology Officer             Fax:   312/913-9155
Prisma & Company                     Email: bheadley@prismalink.com
