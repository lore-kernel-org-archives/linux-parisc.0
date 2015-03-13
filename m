From: Graham Gower <graham.gower@gmail.com>
Subject: Re: [PATCH] parisc: fix pmd accounting with 3-level page tables
Date: Sat, 14 Mar 2015 08:20:08 +1030
Message-ID: <CAFk90B_Y_yRebJ5W+ACXmrM9U=QKTr14yGidvi71ucN3NC6H8w@mail.gmail.com>
References: <1426242602-52804-1-git-send-email-kirill.shutemov@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Domenico Andreoli <cavokz@gmail.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1426242602-52804-1-git-send-email-kirill.shutemov@linux.intel.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This fixes the problem on my C8000.

Tested-by: graham.gower@gmail.com

On 13 March 2015 at 21:00, Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
> There's hack in pgd_alloc() on parisc to initialize one pmd, which is
> not accounted. It leads to underflow on exit.
>
> Let's adjust nr_pmds on pgd_alloc() to get accounting correct.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Cc: John David Anglin <dave.anglin@bell.net>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Graham Gower <graham.gower@gmail.com>
> Cc: Domenico Andreoli <cavokz@gmail.com>
> ---
>  arch/parisc/include/asm/pgalloc.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
> index 55ad8be9b7f3..068b2fb9a47c 100644
> --- a/arch/parisc/include/asm/pgalloc.h
> +++ b/arch/parisc/include/asm/pgalloc.h
> @@ -38,6 +38,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>                 /* The first pmd entry also is marked with _PAGE_GATEWAY as
>                  * a signal that this pmd may not be freed */
>                 __pgd_val_set(*pgd, PxD_FLAG_ATTACHED);
> +               mm_inc_nr_pmds(mm);
>  #endif
>         }
>         return actual_pgd;
> --
> 2.1.4
>
