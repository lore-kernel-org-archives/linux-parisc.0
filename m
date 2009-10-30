From: Randolph Chung <randolph@tausq.org>
Subject: Re: [PATCH] parisc: use sort() instead of home-made implementation
Date: Fri, 30 Oct 2009 11:41:32 +0800
Message-ID: <4AEA606C.4080003@tausq.org>
References: <20091029215901.GA30311@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091029215901.GA30311@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge Deller wrote:
> Signed-off-by: Helge Deller <deller@gmx.de>

Excellent. sort() was not there when this was coded up, but always good 
to stop replicating code :)

Signed-off-by: Randolph Chung <tausq@parisc-linux.org>

randolph

> 
> 
> diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
> index 69dad5a..e5a4390 100644
> --- a/arch/parisc/kernel/unwind.c
> +++ b/arch/parisc/kernel/unwind.c
> @@ -13,6 +13,7 @@
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/kallsyms.h>
> +#include <linux/sort.h>
>  
>  #include <asm/uaccess.h>
>  #include <asm/assembly.h>
> @@ -115,24 +116,21 @@ unwind_table_init(struct unwind_table *table, const char *name,
>  	}
>  }
>  
> +static int cmp_unwind_table_entry(const void *a, const void *b)
> +{
> +	return ((const struct unwind_table_entry *)a)->region_start
> +	     - ((const struct unwind_table_entry *)b)->region_start;
> +}
> +
>  static void
>  unwind_table_sort(struct unwind_table_entry *start,
>  		  struct unwind_table_entry *finish)
>  {
> -	struct unwind_table_entry el, *p, *q;
> -
> -	for (p = start + 1; p < finish; ++p) {
> -		if (p[0].region_start < p[-1].region_start) {
> -			el = *p;
> -			q = p;
> -			do {
> -				q[0] = q[-1];
> -				--q;
> -			} while (q > start && 
> -				 el.region_start < q[-1].region_start);
> -			*q = el;
> -		}
> -	}
> +	int len;
> +
> +	len  = (finish - start) / sizeof(struct unwind_table_entry);
> +	sort(start, len, sizeof(struct unwind_table_entry),
> +	     cmp_unwind_table_entry, NULL);
>  }
>  
>  struct unwind_table *

