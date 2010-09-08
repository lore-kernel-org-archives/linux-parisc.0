From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH 2/8] arch/parisc/include/asm: use ARRAY_SIZE macro in
 mmzone.h
Date: Wed, 8 Sep 2010 17:17:43 -0400
Message-ID: <20100908211743.GF24791@bombadil.infradead.org>
References: <1283979457-4649-1-git-send-email-nikitasangelinas@gmail.com>
 <1283980273-4880-1-git-send-email-nikitasangelinas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Nikitas Angelinas <nikitasangelinas@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1283980273-4880-1-git-send-email-nikitasangelinas@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Sep 08, 2010 at 10:11:13PM +0100, Nikitas Angelinas wrote:
> Replace sizeof(pfnnid_map) / sizeof(pfnnid_map[0]) with
> ARRAY_SIZE(pfnnid_map) in mmzone.h
> 

Thanks. Let me think about this, I don't really like the tangled web of
include dependencies this results in...

regards, Kyle

> Signed-off-by: Nikitas Angelinas <nikitasangelinas@gmail.com>
> ---
>  arch/parisc/include/asm/mmzone.h |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/parisc/include/asm/mmzone.h b/arch/parisc/include/asm/mmzone.h
> index 9608d2c..85b23b6 100644
> --- a/arch/parisc/include/asm/mmzone.h
> +++ b/arch/parisc/include/asm/mmzone.h
> @@ -3,6 +3,8 @@
>  
>  #ifdef CONFIG_DISCONTIGMEM
>  
> +#include <linux/kernel.h>
> +
>  #define MAX_PHYSMEM_RANGES 8 /* Fix the size for now (current known max is 3) */
>  extern int npmem_ranges;
>  
> @@ -51,7 +53,7 @@ static inline int pfn_to_nid(unsigned long pfn)
>  		return 0;
>  
>  	i = pfn >> PFNNID_SHIFT;
> -	BUG_ON(i >= sizeof(pfnnid_map) / sizeof(pfnnid_map[0]));
> +	BUG_ON(i >= ARRAY_SIZE(pfnnid_map));
>  	r = pfnnid_map[i];
>  	BUG_ON(r == 0xff);
>  
> -- 
> 1.7.2.3
> 
> 
