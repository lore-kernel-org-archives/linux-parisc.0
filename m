From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to
 expand_upwards
Date: Thu, 21 Apr 2011 15:12:46 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1104211505320.20201@chino.kir.corp.google.com>
References: <1303317178.2587.30.camel@mulgrave.site> <alpine.DEB.2.00.1104201410350.31768@chino.kir.corp.google.com> <20110421220351.9180.A69D9226@jp.fujitsu.com> <alpine.DEB.2.00.1104211237250.5829@chino.kir.corp.google.com> <alpine.DEB.2.00.1104211500170.5741@router.home>
 <alpine.DEB.2.00.1104211411540.20201@chino.kir.corp.google.com> <1303421088.4025.52.camel@mulgrave.site> <alpine.DEB.2.00.1104211431500.20201@chino.kir.corp.google.com> <1303422566.4025.56.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Christoph Lameter <cl@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>,
	Pekka Enberg <penberg@kernel.org>,
	Michal Hocko <mhocko@suse.cz>, Hugh Dickins <hughd@google.com>,
	linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, Ingo Molnar <mingo@elte.hu>,
	x86 maintainers <x86@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1303422566.4025.56.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 21 Apr 2011, James Bottomley wrote:

> > Ok, it seems like there're two options for this release cycle:
> > 
> >  (1) merge the patch that enables CONFIG_NUMA for DISCONTIGMEM but only 
> >      do so if CONFIG_SLUB is enabled to avoid the build error, or
> 
> That's not an option without coming up with the rest of the numa
> fixes ... we can't basically force all SMP systems to become UP.
> 
> What build error, by the way?  There's only a runtime panic caused by
> slub.
> 

If you enable CONFIG_NUMA for ARCH_DISCONTIGMEM_ENABLE on parisc, it 
results in the same build error that you identified in

	http://marc.info/?l=linux-parisc&m=130326773918005

at least on my hppa64 compiler.

> >  (2) disallow CONFIG_SLUB for parisc with DISCONTIGMEM.
> 
> Well, that's this patch ... it will actually fix every architecture, not
> just parisc.
> 
> 
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 56240e7..a7ad8fb 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1226,6 +1226,7 @@ config SLAB
> >           per cpu and per node queues.
> >  
> >  config SLUB
> > +       depends on BROKEN || NUMA || !DISCONTIGMEM
> >         bool "SLUB (Unqueued Allocator)"
> >         help
> >            SLUB is a slab allocator that minimizes cache line usage
> 
> 
> I already sent it to linux-arch and there's been no dissent; there have
> been a few "will that fix my slub bug?" type of responses.
> 

I was concerned about tile because it actually got all this right by using 
N_NORMAL_MEMORY appropriately and it uses slub by default, but it always 
enables NUMA at the moment so this won't impact it.

Acked-by: David Rientjes <rientjes@google.com>

I agree we can now defer "parisc: enable CONFIG_NUMA for DISCONTIGMEM and 
fix build errors" until parisc moves away from DISCONTIGMEM, its extracted 
away from CONFIG_NUMA, or the scheduler issues are debugged.
