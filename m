Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA14042
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Nov 1999 07:09:56 -0700
Received: from security.hp.com (cranston.fc.hp.com [15.6.91.224])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id JAA06093
	for <parisc-linux@thepuffingroup.com>; Tue, 2 Nov 1999 09:10:17 -0500 (EST)
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: LaMont Jones <lamont@security.hp.com>, parisc-linux@thepuffingroup.com,
        lamont@security.hp.com
Subject: Re: [parisc-linux] xchg implementation 
In-reply-to: Your message of "Tue, 02 Nov 1999 09:53:40 +0100."
             <19991102095340.D516@mencheca.ch.genedata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Tue, 02 Nov 1999 07:10:58 -0700
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19991102141105.9EB1518708@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > IIRC, CR24 and 25 are readable from user space (not writable), and can be
> > quite useful for thread specific data, thread id, etc...  It might do to
> > leave them available for such a use.
> You're thinking of CR26 and 27 (ref: Kane's PA-RISC 2.0 Architecture,
> page 2-17).  CR31 _is_ used, I didn't read carefully enough:

And the worst of it is that I knew that.  Sigh...

thanks for the clarification,
lamont
