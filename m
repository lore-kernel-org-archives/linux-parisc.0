Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA23739
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Mar 2000 13:51:38 -0700
From: willy@thepuffingroup.com
Date: Sat, 4 Mar 2000 14:49:38 -0500
To: huck@cup.hp.com
Cc: gyula_matics@hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] lasi scsi driver
Message-ID: <20000304144938.A9944@thepuffingroup.com>
References: <006601bf8487$e057e010$a94abc0f@hungary.hp.com> <200003031910.LAA19111@lucy.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200003031910.LAA19111@lucy.cup.hp.com>; from Jerry Huck on Fri, Mar 03, 2000 at 11:10:58AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Mar 03, 2000 at 11:10:58AM -0800, Jerry Huck wrote:
> While the PA-RISC processor architecture supports the notion of a
> non-cacheable page, most HP memory systems do not - certainly not the
> most recent memory systems.  If you set the U-bit on a main memory page
> and then reference the page, the processor will emit a sub-cacheline
> transaction and the memory system will do something bad (probably
> HPMC).  Also, I can't find any architected interface that would let
> you test if a memory page could be accessed uncacheable.

That isn't necessarily a problem.  The interface requires the allocation
of pages which are coherent.  On recent architectures, it's possible to
allocate pages which are actually IO coherent.  On earlier architectures,
the same interface would return uncached pages.  The question is
whether there are any implementations which can do neither of the two
possibilities.
