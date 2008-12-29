From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] parisc: fix module loading failure of large modules
Date: Mon, 29 Dec 2008 16:46:10 +0100
Message-ID: <20081229154610.GA7871@uranus.ravnborg.org>
References: <4958D99E.4010201@gmx.de> <4958DA54.8060003@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Moritz Muehlenhoff <jmm@inutil.org>,
	Linus <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4958DA54.8060003@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 29, 2008 at 03:10:28PM +0100, Helge Deller wrote:
> [PATCH 2/2] parisc: fix module loading failure of large modules
> 
> On 32bit (and sometimes 64bit) and with big kernel modules like xfs or
> ipv6 the relocation types R_PARISC_PCREL17F and R_PARISC_PCREL22F may
> fail to reach their PLT stub if we only create one big stub array for
> all sections at the beginning of the core or init section.
> 
> With this patch we now instead append individual PLT stub entries
> directly at the end of the code sections where the stubs are actually
> called. This reduces the distance between the PCREL location and the
> stub entry so that the relocations can be fulfilled.
> 
> The kernel module loader will call module_additional_section_size() and
> request us to return the amount of additional memory we need for the
> stubs of each section. The final section size of the code segment will
> then be increased by that value when the kernel layouts the final
> addresses of all sections.
> 
> Tested with 32- and 64bit kernels.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 

> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index 644a70b..cbb622f 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -34,6 +34,9 @@ config RWSEM_GENERIC_SPINLOCK
>  config RWSEM_XCHGADD_ALGORITHM
>  	bool
>  
> +config ARCH_WANTS_STUBS_BEHIND_SECTIONS
> +	def_bool y
> +

The recommended practive today is:

In some relevant Kconfig file add:

config HAVE_MODULE_SECTION_STUBS
	bool

And then in arch/$ARCH/Kconfig do:

config PARISC
	...
	select HAVE_MODULE_SECTION_STUBS
	...

The select are supposed to be sorted alphabetically
but people seems to use a different alphabet for
each arch.

	Sam
