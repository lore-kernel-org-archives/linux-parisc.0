Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA10875
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Nov 1999 14:02:01 -0700
Received: from security.hp.com (cranston.fc.hp.com [15.6.91.224])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id NAA10948
	for <parisc-linux@thepuffingroup.com>; Mon, 1 Nov 1999 13:03:07 -0800 (PST)
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: parisc-linux@thepuffingroup.com, lamont@security.hp.com
Subject: Re: [parisc-linux] xchg implementation 
In-reply-to: Your message of "Sun, 31 Oct 1999 19:37:39 +0100."
             <19991031193739.V516@mencheca.ch.genedata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 01 Nov 1999 14:03:05 -0700
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19991101210305.75FA118708@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> This is a uniprocessor optimisation of the xchg() case where it's _not_
> exchanging with zero.  What I need is a spare CR register.  As far as I
> can see from the comments, CR28-30 are currently reserved; leaving CRs
> 24, 25 and 31 available.  Unless someone's using one of them without
> documenting it somewhere...?  That really does need to be written down
> somewhere.

IIRC, CR24 and 25 are readable from user space (not writable), and can be
quite useful for thread specific data, thread id, etc...  It might do to
leave them available for such a use.

lamont
