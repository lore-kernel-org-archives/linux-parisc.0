Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA13051
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Nov 1999 01:52:05 -0700
Date: Tue, 2 Nov 1999 09:53:40 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: LaMont Jones <lamont@security.hp.com>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] xchg implementation
Message-ID: <19991102095340.D516@mencheca.ch.genedata.com>
References: <19991031193739.V516@mencheca.ch.genedata.com> <19991101210305.75FA118708@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991101210305.75FA118708@security.hp.com>; from LaMont Jones on Mon, Nov 01, 1999 at 02:03:05PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Nov 01, 1999 at 02:03:05PM -0700, LaMont Jones wrote:
> > This is a uniprocessor optimisation of the xchg() case where it's _not_
> > exchanging with zero.  What I need is a spare CR register.  As far as I
> > can see from the comments, CR28-30 are currently reserved; leaving CRs
> > 24, 25 and 31 available.  Unless someone's using one of them without
> > documenting it somewhere...?  That really does need to be written down
> > somewhere.
> 
> IIRC, CR24 and 25 are readable from user space (not writable), and can be
> quite useful for thread specific data, thread id, etc...  It might do to
> leave them available for such a use.

You're thinking of CR26 and 27 (ref: Kane's PA-RISC 2.0 Architecture,
page 2-17).  CR31 _is_ used, I didn't read carefully enough:

$ find arch/parisc/ -name \*.[chS] |xargs grep ctl |grep 31
arch/parisc/kernel/interruption.S:      mtctl           29,31
arch/parisc/kernel/interruption.S:      mtctl           29,31
arch/parisc/kernel/interruption.S:      mtctl           29,31
arch/parisc/kernel/syscall.S:   mfctl   31, %r27                        ; get the kernel dp

cr26,27 are used, but only in a debug macro in head.S.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
