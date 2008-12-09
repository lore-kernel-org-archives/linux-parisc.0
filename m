From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] parisc: remove gratuitous cpu_online_map declaration.
Date: Wed, 10 Dec 2008 08:36:19 +1030
Message-ID: <200812100836.20148.rusty@rustcorp.com.au>
References: <200812041012.41496.rusty@rustcorp.com.au> <20081209035407.GF30783@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081209035407.GF30783@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tuesday 09 December 2008 14:24:07 Kyle McMartin wrote:
> On Thu, Dec 04, 2008 at 10:12:41AM +1030, Rusty Russell wrote:
> > This is defined in linux/cpumask.h (included in this file already),
> > and this will break when the definition changes (in a following patch).
> > 
> > Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
> 
> Accepted, though it would have been nice if it had either hit all the
> maintainers, or hit the list too...

OK, I picked one maintainer at semi-random.   I've added you and Willy
to my annoy-maintainers script.

Thanks,
Rusty.
