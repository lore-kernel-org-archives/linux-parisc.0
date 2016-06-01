From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: The patch "mm, page_alloc: avoid looking up the first zone in
 a zonelist twice" breaks memory management
Date: Wed, 1 Jun 2016 08:26:47 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.1606010817550.6561@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1605311706040.16635@file01.intranet.prod.int.rdu2.redhat.com> <574E0687.5050201@suse.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Mel Gorman <mgorman@techsingularity.net>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Helge Deller <deller@gmx.de>
To: Vlastimil Babka <vbabka@suse.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <574E0687.5050201@suse.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Tue, 31 May 2016, Vlastimil Babka wrote:

> On 05/31/2016 11:20 PM, Mikulas Patocka wrote:
> > Hi
> > 
> > The patch c33d6c06f60f710f0305ae792773e1c2560e1e51 ("mm, page_alloc: avoid 
> > looking up the first zone in a zonelist twice") breaks memory management 
> > on PA-RISC.
> 
> Hi,
> 
> I think the linked patch should help. Please try and report.
> 
> http://marc.info/?i=20160531100848.GR2527%40techsingularity.net
> 
> Thanks,
> Vlastimil

Thanks, that patch fixes it.

Mikulas
