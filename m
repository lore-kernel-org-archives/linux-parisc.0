From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] Parisc: Check kmalloc return value before use the
	buffer in ccio-dma.c
Date: Thu, 6 May 2010 16:08:54 -0400
Message-ID: <20100506200854.GG4902@bombadil.infradead.org>
References: <20100506024208.GB15956@localhost.localdomain> <20100506040331.GC4902@bombadil.infradead.org> <20100506105948.GV6747@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, wzt.wzt@gmail.com,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	deller@gmx.de, jejb@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100506105948.GV6747@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, May 06, 2010 at 04:59:48AM -0600, Matthew Wilcox wrote:
> On Thu, May 06, 2010 at 12:03:31AM -0400, Kyle McMartin wrote:
> > We can change it to GFP_ATOMIC|__GFP_NOFAIL so it will retry infinitely,
> > or we can panic in the error path with a nice error message so the users
> > knows why his machine isn't going to work.
> 
> If we can't initialise the IOMMU, can we even get a panic message out to
> the user?
> 

Excellent question! I'm not sure. IODC console will still be working up
until it gets bonked, so early_console is probably still functional up
until that point.

--Kyle
