From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PULL] cpumask updates for parisc
Date: Mon, 16 Mar 2009 13:20:41 -0400
Message-ID: <20090316172041.GC4282@bombadil.infradead.org>
References: <200903161444.36219.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, travis@sgi.com
To: Rusty Russell <rusty@rustcorp.com.au>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757209AbZCPRVA@vger.kernel.org>
In-Reply-To: <200903161444.36219.rusty@rustcorp.com.au>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 16, 2009 at 02:44:35PM +1030, Rusty Russell wrote:
> The following changes since commit 5bee17f18b595937e6beafeee5197868a3f74a06:
>   Kyle McMartin (1):
>         parisc: sba_iommu: fix build bug when CONFIG_PARISC_AGP=y
> 
> are available in the git repository at:
> 
>   ssh://master.kernel.org/home/ftp/pub/scm/linux/kernel/git/rusty/linux-2.6-cpumask-for-parisc.git master
> 
> Rusty Russell (3):
>       cpumask: arch_send_call_function_ipi_mask: parisc
>       cpumask: prepare for iterators to only go to nr_cpu_ids/nr_cpumask_bits.: parisc
>       cpumask: Use accessors code.: parisc
> 
>  arch/parisc/include/asm/smp.h  |    3 ++-
>  arch/parisc/kernel/irq.c       |    4 ++--
>  arch/parisc/kernel/processor.c |    6 +++---
>  arch/parisc/kernel/smp.c       |   18 +++++++++---------
>  4 files changed, 16 insertions(+), 15 deletions(-)
> 

I've pulled these into a test branch, and will let you know if my
autobuilder shakes out any issues with them.

cheers, Kyle
