From: Dave Hansen <dave@linux.vnet.ibm.com>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to
 expand_upwards
Date: Fri, 22 Apr 2011 13:24:48 -0700
Message-ID: <1303503888.9308.6661.camel@nimitz>
References: <1303337718.2587.51.camel@mulgrave.site>
	 <alpine.DEB.2.00.1104201530430.13948@chino.kir.corp.google.com>
	 <20110421221712.9184.A69D9226@jp.fujitsu.com>
	 <1303403847.4025.11.camel@mulgrave.site>
	 <alpine.DEB.2.00.1104211328000.5741@router.home>
	 <1303411537.9048.3583.camel@nimitz>
	 <1303496357.2590.38.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Christoph Lameter <cl@linux.com>,
        KOSAKI Motohiro
 <kosaki.motohiro@jp.fujitsu.com>,
        David Rientjes <rientjes@google.com>,
        Pekka Enberg <penberg@kernel.org>, Michal Hocko <mhocko@suse.cz>,
        Andrew
 Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
        LKML <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org,
        Ingo Molnar <mingo@elte.hu>, x86 maintainers
 <x86@kernel.org>,
        Tejun Heo <tj@kernel.org>, Mel Gorman <mel@csn.ul.ie>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1303496357.2590.38.camel@mulgrave.site>
List-ID: <linux-mm.kvack.org>

On Fri, 2011-04-22 at 13:19 -0500, James Bottomley wrote:
> I looked at converting parisc to sparsemem and there's one problem that
> none of these cover.  How do you set up bootmem?  If I look at the
> examples, they all seem to have enough memory in the first range to
> allocate from, so there's no problem.  On parisc, with discontigmem, we
> set up all of our ranges as bootmem (we can do this because we
> effectively have one node per range).  Obviously, since sparsemem has a
> single bitmap for all of the bootmem, we can no longer allocate all of
> our memory to it (well, without exploding because some of our gaps are
> gigabytes big).  How does everyone cope with this (do you search for
> your largest range and use that as bootmem or something)? 

Sparsemem is purely post-bootmem.  It doesn't deal with sparse
bootmem. :(

That said, I'm not sure you're in trouble.  One bit of bitmap covers 4k
(with 4k pages of course) of memory, one byte covers 32k, and A 32MB
bitmap can cover 1TB of address space.  It explodes, but I think it's
manageable.  It hasn't been a problem enough up to this point to go fix
it.

-- Dave

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
