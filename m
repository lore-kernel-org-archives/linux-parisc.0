From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Fix up generic MADV_* values and add
 MADV_HWPOISON and MADV_SOFT_OFFLINE
Date: Fri, 4 Aug 2017 19:57:19 +0200
Message-ID: <694ff684-0266-ec28-ef6e-c352b42c12ef@gmx.de>
References: <20170804163148.GA29168@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170804163148.GA29168@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04.08.2017 18:31, Helge Deller wrote:
> In addition there is a conflict with some the common/generic MADV_* constants
> between kernel headers and glibc headers.  

Please ignore this patch.
I was wrong: kernel and glibc are in sync.

Nevertheless, maybe adjusting the parisc values to the default values in kernel and
glibe would make sense. Even if it's a ABI change, the impact of such a change is probably low
given the fact that those madvise values are hints.

Helge 

> The existing glibc headers on parisc
> already define those values in the range of 8-17 which should be common between
> all architectures and which all architectures with the exception of parisc
> follow.  But the parisc kernel still defines those with values above 65 because
> of an old kernel patch which reserved the range of 12-64 for page size
> specifications.  The old kernel patch never actually used those values in code,
> so changing those MADV_* constants back to the common values shouldn't break
> anything and instead make existing userspace applications work as expected.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
> index 5979745..a34ebf4 100644
> --- a/arch/parisc/include/uapi/asm/mman.h
> +++ b/arch/parisc/include/uapi/asm/mman.h
> @@ -49,16 +49,18 @@
>  #define MADV_REMOVE	9		/* remove these pages & resources */
>  #define MADV_DONTFORK	10		/* don't inherit across fork */
>  #define MADV_DOFORK	11		/* do inherit across fork */
> +#define MADV_HWPOISON	100		/* poison a page for testing */
> +#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
>  
> -#define MADV_MERGEABLE   65		/* KSM may merge identical pages */
> -#define MADV_UNMERGEABLE 66		/* KSM may not merge identical pages */
> +#define MADV_MERGEABLE   12		/* KSM may merge identical pages */
> +#define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
>  
> -#define MADV_HUGEPAGE	67		/* Worth backing with hugepages */
> -#define MADV_NOHUGEPAGE	68		/* Not worth backing with hugepages */
> +#define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
> +#define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
>  
> -#define MADV_DONTDUMP   69		/* Explicity exclude from the core dump,
> +#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
>  					   overrides the coredump filter bits */
> -#define MADV_DODUMP	70		/* Clear the MADV_NODUMP flag */
> +#define MADV_DODUMP	17		/* Clear the MADV_NODUMP flag */
>  
>  /* compatibility flags */
>  #define MAP_FILE	0
> diff --git a/tools/arch/parisc/include/uapi/asm/mman.h b/tools/arch/parisc/include/uapi/asm/mman.h
> index 03d8d5b..eb4df3e 100644
> --- a/tools/arch/parisc/include/uapi/asm/mman.h
> +++ b/tools/arch/parisc/include/uapi/asm/mman.h
> @@ -1,20 +1,22 @@
>  #ifndef TOOLS_ARCH_PARISC_UAPI_ASM_MMAN_FIX_H
>  #define TOOLS_ARCH_PARISC_UAPI_ASM_MMAN_FIX_H
> -#define MADV_DODUMP	70
> -#define MADV_DOFORK	11
> -#define MADV_DONTDUMP   69
> -#define MADV_DONTFORK	10
> -#define MADV_DONTNEED   4
> -#define MADV_FREE	8
> -#define MADV_HUGEPAGE	67
> -#define MADV_MERGEABLE   65
> -#define MADV_NOHUGEPAGE	68
>  #define MADV_NORMAL     0
>  #define MADV_RANDOM     1
> -#define MADV_REMOVE	9
>  #define MADV_SEQUENTIAL 2
> -#define MADV_UNMERGEABLE 66
>  #define MADV_WILLNEED   3
> +#define MADV_DONTNEED   4
> +#define MADV_FREE	8
> +#define MADV_REMOVE	9
> +#define MADV_DONTFORK	10
> +#define MADV_DOFORK	11
> +#define MADV_HWPOISON	100
> +#define MADV_SOFT_OFFLINE 101
> +#define MADV_MERGEABLE	12
> +#define MADV_UNMERGEABLE 13
> +#define MADV_HUGEPAGE	14
> +#define MADV_NOHUGEPAGE 15
> +#define MADV_DONTDUMP	16
> +#define MADV_DODUMP	17
>  #define MAP_ANONYMOUS	0x10
>  #define MAP_DENYWRITE	0x0800
>  #define MAP_EXECUTABLE	0x1000
> @@ -36,10 +38,6 @@
>  #define PROT_READ	0x1
>  #define PROT_SEM	0x8
>  #define PROT_WRITE	0x2
> -/* MADV_HWPOISON is undefined on parisc, fix it for perf */
> -#define MADV_HWPOISON	100
> -/* MADV_SOFT_OFFLINE is undefined on parisc, fix it for perf */
> -#define MADV_SOFT_OFFLINE 101
>  /* MAP_32BIT is undefined on parisc, fix it for perf */
>  #define MAP_32BIT	0
>  /* MAP_UNINITIALIZED is undefined on parisc, fix it for perf */
> 

