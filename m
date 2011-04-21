From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to expand_upwards
Date: Thu, 21 Apr 2011 22:16:41 +0900 (JST)
Message-ID: <20110421221712.9184.A69D9226@jp.fujitsu.com>
References: <1303337718.2587.51.camel@mulgrave.site> <alpine.DEB.2.00.1104201530430.13948@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Cc: kosaki.motohiro@jp.fujitsu.com,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Pekka Enberg <penberg@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Michal Hocko <mhocko@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, Ingo Molnar <mingo@elte.hu>,
	x86 maintainers <x86@kernel.org>
To: David Rientjes <rientjes@google.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1104201530430.13948@chino.kir.corp.google.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, 20 Apr 2011, James Bottomley wrote:
> 
> > > This is probably because the parisc's DISCONTIGMEM memory ranges don't 
> > > have bits set in N_NORMAL_MEMORY.
> > > 
> > > diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> > > --- a/arch/parisc/mm/init.c
> > > +++ b/arch/parisc/mm/init.c
> > > @@ -266,8 +266,10 @@ static void __init setup_bootmem(void)
> > >  	}
> > >  	memset(pfnnid_map, 0xff, sizeof(pfnnid_map));
> > >  
> > > -	for (i = 0; i < npmem_ranges; i++)
> > > +	for (i = 0; i < npmem_ranges; i++) {
> > > +		node_set_state(i, N_NORMAL_MEMORY);
> > >  		node_set_online(i);
> > > +	}
> > >  #endif
> > 
> > Yes, this seems to be the missing piece that gets it to boot.  We really
> > need this in generic code, unless someone wants to run through all the
> > other arch's doing it ...
> > 
> 
> Looking at all other architectures that allow ARCH_DISCONTIGMEM_ENABLE, we 
> already know x86 is fine, avr32 disables ARCH_DISCONTIGMEM_ENABLE entirely 
> because its code only brings online node 0, and tile already sets the bit 
> in N_NORMAL_MEMORY correctly when bringing a node online, probably because 
> it was introduced after the various node state masks were added in 
> 7ea1530ab3fd back in October 2007.
> 
> So we're really only talking about alpha, ia64, m32r, m68k, and mips and 
> it only seems to matter when using CONFIG_SLUB, which isn't surprising 
> when greping for it:
> 
> 	$ grep -r N_NORMAL_MEMORY mm/*
> 	mm/memcontrol.c:	if (!node_state(node, N_NORMAL_MEMORY))
> 	mm/memcontrol.c:		if (!node_state(node, N_NORMAL_MEMORY))
> 	mm/page_alloc.c:	[N_NORMAL_MEMORY] = { { [0] = 1UL } },
> 	mm/page_alloc.c:			node_set_state(zone_to_nid(zone), N_NORMAL_MEMORY);
> 	mm/slub.c:	for_each_node_state(node, N_NORMAL_MEMORY) {
> 	mm/slub.c:	for_each_node_state(node, N_NORMAL_MEMORY) {
> 	mm/slub.c:	for_each_node_state(node, N_NORMAL_MEMORY) {
> 	mm/slub.c:	for_each_node_state(node, N_NORMAL_MEMORY) {
> 	mm/slub.c:	for_each_node_state(node, N_NORMAL_MEMORY) {
> 	mm/slub.c:	for_each_node_state(node, N_NORMAL_MEMORY) {
> 	mm/slub.c:	for_each_node_state(node, N_NORMAL_MEMORY) {
> 	mm/slub.c:		for_each_node_state(node, N_NORMAL_MEMORY) {
> 	mm/slub.c:		for_each_node_state(node, N_NORMAL_MEMORY) {
> 	mm/slub.c:	for_each_node_state(node, N_NORMAL_MEMORY)
> 
> Those memory controller occurrences only result in it passing a node id of 
> -1 to kmalloc_node() which means no specific node target, and that's fine 
> for DISCONTIGMEM since we don't care about any proximity between memory 
> ranges.
> 
> This should fix the remaining architectures so they can use CONFIG_SLUB, 
> but I hope it can be tested by the individual arch maintainers like you 
> did for parisc.

ia64 and mips have CONFIG_ARCH_POPULATES_NODE_MAP and it initialize
N_NORMAL_MEMORY automatically if my understand is correct.
(plz see free_area_init_nodes)

I guess alpha and m32r have no active developrs. only m68k seems to be need
fix and we have a chance to get a review... 



