From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to
 expand_upwards
Date: Wed, 20 Apr 2011 14:34:41 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1104201425020.31768@chino.kir.corp.google.com>
References: <20110420102314.4604.A69D9226@jp.fujitsu.com> <BANLkTi=mxWwLPEnB+rGg29b06xNUD0XvsA@mail.gmail.com> <20110420161615.462D.A69D9226@jp.fujitsu.com> <BANLkTimfpY3gq8oY6bPDajBW7JN6Hp+A0A@mail.gmail.com> <20110420112020.GA31296@parisc-linux.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Pekka Enberg <penberg@kernel.org>,
        KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>,
        Christoph Lameter <cl@linux.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Michal Hocko <mhocko@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
        LKML <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org,
        Ingo Molnar <mingo@elte.hu>, x86 maintainers <x86@kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20110420112020.GA31296@parisc-linux.org>
List-ID: <linux-mm.kvack.org>

On Wed, 20 Apr 2011, Matthew Wilcox wrote:

> > That part makes me think the best option is to make parisc do
> > CONFIG_NUMA as well regardless of the historical intent was.
> 
> But it's not just parisc.  It's six other architectures as well, some
> of which aren't even SMP.  Does !SMP && NUMA make any kind of sense?
> 

It does as long as DISCONTIGMEM is hijacking NUMA abstractions throughout 
the code; for example, look at the .config that James is probably using 
for testing here:

	CONFIG_PA8X00=y
	CONFIG_64BIT=y
	CONFIG_DISCONTIGMEM=y
	CONFIG_NEED_MULTIPLE_NODES=y
	CONFIG_NODES_SHIFT=3

and CONFIG_NUMA is not enabled.  So we want CONFIG_NODES_SHIFT of 3 
(because MAX_PHYSMEM_RANGES is 8) and CONFIG_NEED_MULTIPLE_NODES is 
enabled because of DISCONTIGMEM:

	#
	# Both the NUMA code and DISCONTIGMEM use arrays of pg_data_t's
	# to represent different areas of memory.  This variable allows
	# those dependencies to exist individually.
	#
	config NEED_MULTIPLE_NODES
		def_bool y
		depends on DISCONTIGMEM || NUMA

when in reality we should do away with CONFIG_NEED_MULTIPLE_NODES and just 
force DISCONTIGMEM to enable CONFIG_NUMA at least for -stable and as a 
quick fix for James.

In the long run, we'll probably want to define a lighterweight CONFIG_NUMA 
as a layer that CONFIG_DISCONTIGMEM can use for memory range abstractions 
and then CONFIG_NUMA is built on top of it to define proximity between 
those ranges.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
