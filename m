Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA16444
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 23:53:27 -0700
Message-Id: <200012030656.WAA02559@milano.cup.hp.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] merge activity 
In-reply-to: Your message of "Sat, 02 Dec 2000 21:11:48 PST."
             <200012030511.VAA02450@milano.cup.hp.com>
Date: Sat, 02 Dec 2000 22:56:28 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> > u_long becomes unsigned long
> 
> I've been using "ulong" as well. Is less than desirable as well?
> Feel free to change if it is.

I see that's been done as well. np.

> > old code has mostly been cleaned out
> > a lot of #ifdefs have been removed.
> 
> Some of the "ifdef 0" I have in "my" code are there for future stuff.
> An examples is code related to DELAYED_RESOURCE_CNT in sba_iommu.c.
> Fortunately, this wasn't removed.
> Haw should I mark this to make sure people understand it's work-in-progress?

I do see #ifdef DUMP_RESMAP code (not much code) has been removed.
Obviously it wasn't marked right. :^)
(arch/parisc/kernel/sba_iommu.c)

later,
grant
