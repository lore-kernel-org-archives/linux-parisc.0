From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [2.6 patch] binfmt_som.c: add MODULE_LICENSE
Date: Sat, 9 Aug 2008 18:55:11 -0600
Message-ID: <20080810005511.GB2617@colo.lackof.org>
References: <20080806211155.GV1702@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, bdale@hp.com
To: Adrian Bunk <bunk@kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080806211155.GV1702@cs181140183.pp.htv.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

+bdale@hp.com

On Thu, Aug 07, 2008 at 12:11:55AM +0300, Adrian Bunk wrote:
> This patch adds the missing MODULE_LICENSE("GPL").
> 
> Reported-by: Adrian Bunk <bunk@kernel.org>
> Signed-off-by: Adrian Bunk <bunk@kernel.org>
> 
> ---
> 
> This patch has been sent on:
> - 15 Jun 2008
> 
> 4cec562181f818f16f072b9a14ca7a0ce6c66417 diff --git a/fs/binfmt_som.c b/fs/binfmt_som.c
> index fdc36bf..6d3bebb 100644
> --- a/fs/binfmt_som.c
> +++ b/fs/binfmt_som.c
> @@ -308,3 +308,5 @@ static void __exit exit_som_binfmt(void)
>  
>  core_initcall(init_som_binfmt);
>  module_exit(exit_som_binfmt);
> +
> +MODULE_LICENSE("GPL");

Someone from HP needs to ACK this patch since I believe HP funded the code
changes made during the parisc-linux port. This should be a no-brainer
and I expect Bdale Garbee can quickly take care of this.

thanks,
grant
