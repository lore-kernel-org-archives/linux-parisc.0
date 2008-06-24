From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [2.6 patch] asm/ptrace.h userspace headers cleanup
Date: Tue, 24 Jun 2008 13:08:44 +0900
Message-ID: <20080624040844.GE22526@linux-sh.org>
References: <20080623174809.GE4756@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Roland McGrath <roland@redhat.com>, linux-kernel@vger.kernel.org,
	rmk@arm.linux.org.uk, cooloney@kernel.org, dev-etrax@axis.com,
	dhowells@redhat.com, gerg@uclinux.org,
	yasutake.koichi@jp.panasonic.com, linux-parisc@vger.kernel.org,
	paulus@samba.org, linuxppc-dev@ozlabs.org,
	linux-sh@vger.kernel.org, chris@zankel.net,
	linux-mips@linux-mips.org, ysato@users.sourceforge.jp,
	Andrew Morton <akpm@linux-foundation.org>
To: Adrian Bunk <bunk@kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080623174809.GE4756@cs181140183.pp.htv.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 23, 2008 at 08:48:09PM +0300, Adrian Bunk wrote:
> This patch contains the following cleanups for the asm/ptrace.h 
> userspace headers:
> - include/asm-generic/Kbuild.asm already lists ptrace.h, remove
>   the superfluous listings in the Kbuild files of the following
>   architectures:
>   - cris
>   - frv
>   - powerpc
>   - x86
> - don't expose function prototypes and macros to userspace:
>   - arm
>   - blackfin
>   - cris
>   - mn10300
>   - parisc
> - remove #ifdef CONFIG_'s around #define's:
>   - blackfin
>   - m68knommu
> - sh: AFAIK __SH5__ should work in both kernel and userspace,
>       no need to leak CONFIG_SUPERH64 to userspace

Yes, that's fine. We've generally avoided relying entirely on the gcc
builtin definitions due to the rampant stupidity surrounding
__SH4_NOFPU__, but it is true that __SH5__ is always defined at least.

Acked-by: Paul Mundt <lethal@linux-sh.org>
