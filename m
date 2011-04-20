From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to
 expand_upwards
Date: Wed, 20 Apr 2011 14:05:16 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1104201403060.31768@chino.kir.corp.google.com>
References: <20110420161615.462D.A69D9226@jp.fujitsu.com> <BANLkTimfpY3gq8oY6bPDajBW7JN6Hp+A0A@mail.gmail.com> <20110420174027.4631.A69D9226@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Pekka Enberg <penberg@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Michal Hocko <mhocko@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, Ingo Molnar <mingo@elte.hu>,
	x86 maintainers <x86@kernel.org>
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110420174027.4631.A69D9226@jp.fujitsu.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 20 Apr 2011, KOSAKI Motohiro wrote:

> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index 69ff049..0bf9ae8 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -229,6 +229,12 @@ config HOTPLUG_CPU
>  	default y if SMP
>  	select HOTPLUG
>  
> +config NUMA
> +	bool "NUMA support"
> +	help
> +	  Say Y to compile the kernel to support NUMA (Non-Uniform Memory
> +	  Access).
> +
>  config ARCH_SELECT_MEMORY_MODEL
>  	def_bool y
>  	depends on 64BIT
> @@ -236,6 +242,7 @@ config ARCH_SELECT_MEMORY_MODEL
>  config ARCH_DISCONTIGMEM_ENABLE
>  	def_bool y
>  	depends on 64BIT
> +	depends on NUMA
>  
>  config ARCH_FLATMEM_ENABLE
>  	def_bool y

I think this should probably be

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -244,6 +244,9 @@ config ARCH_DISCONTIGMEM_DEFAULT
 	def_bool y
 	depends on ARCH_DISCONTIGMEM_ENABLE
 
+config NUMA
+	def_bool ARCH_DISCONTIGMEM_ENABLE
+
 config NODES_SHIFT
 	int
 	default "3"

instead since we don't need CONFIG_NUMA for anything other than 
CONFIG_PA8X00 and 64-bit enabled.
