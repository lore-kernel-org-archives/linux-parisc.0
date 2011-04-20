From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to expand_upwards
Date: Wed, 20 Apr 2011 10:23:35 +0900 (JST)
Message-ID: <20110420102314.4604.A69D9226@jp.fujitsu.com>
References: <1303249716.11237.26.camel@mulgrave.site> <alpine.DEB.2.00.1104191657030.26867@router.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Cc: kosaki.motohiro@jp.fujitsu.com,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Pekka Enberg <penberg@kernel.org>,
	Michal Hocko <mhocko@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, David Rientjes <rientjes@google.com>
To: Christoph Lameter <cl@linux.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1104191657030.26867@router.home>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Tue, 19 Apr 2011, James Bottomley wrote:
> 
> > > Which part of me telling you that you will break lots of other things in
> > > the core kernel dont you get?
> >
> > I get that you tell me this ... however, the systems that, according to
> > you, should be failing to get to boot prompt do, in fact, manage it.
> 
> If you dont use certain subsystems then it may work. Also do you run with
> debuggin on.
> 
> The following patch is I think what would be needed to fix it.

I'm worry about this patch. A lot of mm code assume !NUMA systems 
only have node 0. Not only SLUB.

I'm not sure why this unfortunate mismatch occur. but I think DISCONTIG
hacks makes less sense. Can we consider parisc turn NUMA on instead?



