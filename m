From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] Extract initrd free logic from arch-specific code.
Date: Fri, 30 Mar 2018 13:15:17 +0200
Message-ID: <20180330111517.rrx6gs2skkgk336j@gmail.com>
References: <20180325221853.10839-1-shea@shealevy.com>
 <20180328152714.6103-1-shea@shealevy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mips@linux-mips.org, linux-sh@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "James E.J. Bottomley" <jejb@parisc-linux.org>,
 Christoph Hellwig <hch@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 uclinux-h8-devel@lists.sourceforge.jp,
 Vladimir Murzin <vladimir.murzin@arm.com>, Marc Zyngier <marc.zyngier@arm.com>,
 adi-buildroot-devel@lists.sourceforge.net, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>,
 linux-cris-kernel@axis.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kerne
To: Shea Levy <shea@shealevy.com>
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180328152714.6103-1-shea@shealevy.com>
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org


* Shea Levy <shea@shealevy.com> wrote:

> Now only those architectures that have custom initrd free requirements
> need to define free_initrd_mem.
> 
> Signed-off-by: Shea Levy <shea@shealevy.com>

Please put the Kconfig symbol name this patch introduces both into the title, so 
that people know what to grep for.

> ---
>  arch/alpha/mm/init.c      |  8 --------
>  arch/arc/mm/init.c        |  7 -------
>  arch/arm/Kconfig          |  1 +
>  arch/arm64/Kconfig        |  1 +
>  arch/blackfin/Kconfig     |  1 +
>  arch/c6x/mm/init.c        |  7 -------
>  arch/cris/Kconfig         |  1 +
>  arch/frv/mm/init.c        | 11 -----------
>  arch/h8300/mm/init.c      |  7 -------
>  arch/hexagon/Kconfig      |  1 +
>  arch/ia64/Kconfig         |  1 +
>  arch/m32r/Kconfig         |  1 +
>  arch/m32r/mm/init.c       | 11 -----------
>  arch/m68k/mm/init.c       |  7 -------
>  arch/metag/Kconfig        |  1 +
>  arch/microblaze/mm/init.c |  7 -------
>  arch/mips/Kconfig         |  1 +
>  arch/mn10300/Kconfig      |  1 +
>  arch/nios2/mm/init.c      |  7 -------
>  arch/openrisc/mm/init.c   |  7 -------
>  arch/parisc/mm/init.c     |  7 -------
>  arch/powerpc/mm/mem.c     |  7 -------
>  arch/riscv/mm/init.c      |  6 ------
>  arch/s390/Kconfig         |  1 +
>  arch/score/Kconfig        |  1 +
>  arch/sh/mm/init.c         |  7 -------
>  arch/sparc/Kconfig        |  1 +
>  arch/tile/Kconfig         |  1 +
>  arch/um/kernel/mem.c      |  7 -------
>  arch/unicore32/Kconfig    |  1 +
>  arch/x86/Kconfig          |  1 +
>  arch/xtensa/Kconfig       |  1 +
>  init/initramfs.c          |  7 +++++++
>  usr/Kconfig               |  4 ++++
>  34 files changed, 28 insertions(+), 113 deletions(-)

Please also put it into Documentation/features/.

> diff --git a/usr/Kconfig b/usr/Kconfig
> index 43658b8a975e..7a94f6df39bf 100644
> --- a/usr/Kconfig
> +++ b/usr/Kconfig
> @@ -233,3 +233,7 @@ config INITRAMFS_COMPRESSION
>  	default ".lzma" if RD_LZMA
>  	default ".bz2"  if RD_BZIP2
>  	default ""
> +
> +config HAVE_ARCH_FREE_INITRD_MEM
> +	bool
> +	default n

Help text would be nice, to tell arch maintainers what the purpose of this switch 
is.

Also, a nit, I think this should be named "ARCH_HAS_FREE_INITRD_MEM", which is the 
dominant pattern:

triton:~/tip> git grep 'select.*ARCH' arch/x86/Kconfig* | cut -f2 | cut -d_ -f1-2 | sort | uniq -c | sort -n
    ...
      2 select ARCH_USES
      2 select ARCH_WANTS
      3 select ARCH_MIGHT
      3 select ARCH_WANT
      4 select ARCH_SUPPORTS
      4 select ARCH_USE
     16 select HAVE_ARCH
     23 select ARCH_HAS

It also reads nicely in English:

  "arch has free_initrd_mem()"

While the other makes little sense:

  "have arch free_initrd_mem()"

?

Thanks,

	Ingo
