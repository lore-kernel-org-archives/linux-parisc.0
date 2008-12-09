From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] parisc: remove gratuitous cpu_online_map declaration.
Date: Tue, 9 Dec 2008 15:44:30 -0700
Message-ID: <20081209224430.GC24334@colo.lackof.org>
References: <200812041012.41496.rusty@rustcorp.com.au> <20081209035407.GF30783@bombadil.infradead.org> <200812100836.20148.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200812100836.20148.rusty@rustcorp.com.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 10, 2008 at 08:36:19AM +1030, Rusty Russell wrote:
> On Tuesday 09 December 2008 14:24:07 Kyle McMartin wrote:
> > On Thu, Dec 04, 2008 at 10:12:41AM +1030, Rusty Russell wrote:
> > > This is defined in linux/cpumask.h (included in this file already),
> > > and this will break when the definition changes (in a following patch).
> > > 
> > > Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
> > 
> > Accepted, though it would have been nice if it had either hit all the
> > maintainers, or hit the list too...
> 
> OK, I picked one maintainer at semi-random.   I've added you and Willy
> to my annoy-maintainers script.

Rusty,
willy and I should be dropped as parisc-linux maintainers.
(We can review parisc patches, just not listed as maintainers.)

Please add Helge Deller <deller@gmx.net> (IIRC).

Patch to MAINTAINERS was submitted just a week ago or so.

cheers,
grant

> 
> Thanks,
> Rusty.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
