From: Christoph Lameter <cl@linux.com>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to
 expand_upwards
Date: Thu, 21 Apr 2011 15:02:42 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1104211500170.5741@router.home>
References: <1303317178.2587.30.camel@mulgrave.site> <alpine.DEB.2.00.1104201410350.31768@chino.kir.corp.google.com> <20110421220351.9180.A69D9226@jp.fujitsu.com> <alpine.DEB.2.00.1104211237250.5829@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Pekka Enberg <penberg@kernel.org>,
	Michal Hocko <mhocko@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, Ingo Molnar <mingo@elte.hu>,
	x86 maintainers <x86@kernel.org>
To: David Rientjes <rientjes@google.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1104211237250.5829@chino.kir.corp.google.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 21 Apr 2011, David Rientjes wrote:

> I think we may want to just convert slub (and the memory controller) to
> use N_HIGH_MEMORY rather than N_NORMAL_MEMORY since nothing else uses it
> and the generic code seems to handle N_HIGH_MEMORY for all configs
> appropriately.

In 32 bit configurations some architectures (like x86) provide nodes
that have only high memory. Slab allocators only handle normal memory.
SLAB operates in a kind of degraded mode in that case by falling back for
each allocation to the nodes that have normal memory.

