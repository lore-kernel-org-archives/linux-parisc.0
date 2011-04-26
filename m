From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: [PATCH] convert parisc to sparsemem (was Re: [PATCH v3] mm: make expand_downwards symmetrical to expand_upwards)
Date: Tue, 26 Apr 2011 09:32:13 +0900 (JST)
Message-ID: <20110426093328.F33D.A69D9226@jp.fujitsu.com>
References: <1303507985.2590.47.camel@mulgrave.site> <1303583657.4116.11.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: kosaki.motohiro@jp.fujitsu.com,
	Dave Hansen <dave@linux.vnet.ibm.com>,
	Christoph Lameter <cl@linux.com>,
	David Rientjes <rientjes@google.com>,
	Pekka Enberg <penberg@kernel.org>,
	Michal Hocko <mhocko@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, Ingo Molnar <mingo@elte.hu>,
	x86 maintainers <x86@kernel.org>, Tejun Heo <tj@kernel.org>,
	Mel Gorman <mel@csn.ul.ie>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1303583657.4116.11.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi James,

 % make CROSS_COMPILE=hppa64-linux- ARCH=parisc
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CC      arch/parisc/kernel/asm-offsets.s
In file included from include/linux/topology.h:32:0,
                 from include/linux/sched.h:78,
                 from arch/parisc/kernel/asm-offsets.c:31:
include/linux/mmzone.h:916:27: fatal error: asm/sparsemem.h: No such file or directory

Parhaps, you forgot to quilt add?


> This is the preliminary conversion.  It's very nasty on parisc because
> the memory allocation isn't symmetric anymore: under DISCONTIGMEM, we
> push all memory into bootmem and then let free_all_bootmem() do the
> magic for us; now we have to do separate initialisations for ranges
> because SPARSEMEM can't do multi-range boot memory. It's also got the
> horrible hack that I only use the first found range for bootmem.  I'm
> not sure if this is correct (it won't be if the first found range can be
> under about 50MB because we'll run out of bootmem during boot) ... we
> might have to sort the ranges and use the larges, but that will involve
> us in even more hackery around the bootmem reservations code.
> 
> The boot sequence got a few seconds slower because now all of the loops
> over our pfn ranges actually have to skip through the holes (which takes
> time for 64GB).
> 
> All in all, I've not been very impressed with SPARSEMEM over
> DISCONTIGMEM.  It seems to have a lot of rough edges (necessitating
> exception code) which DISCONTIGMEM just copes with.
> 
> And before you say the code is smaller, that's because I converted us to
> generic show_mem().

Cool! I hoped to remove arch specific show_mem() long time.


And, nitpick comment.

Could you please use #ifdef CONFIG_FLAGMEM instead #ifndef CONFIG_SPARSEMEM?
MM gyes parse '#ifndef CONFIG_SPARSEMEM' as valid-both-flatmem-and-discontigmem.
but this code isn't.

If my quick grep is correct, all of your #ifndef SPARSEMEM can be converted
#ifdef FALTMEM.




