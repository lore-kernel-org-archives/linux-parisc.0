From: Corey Minyard <minyard@acm.org>
Subject: Re: [PATCH] ipmi_si: fix crash on parisc
Date: Wed, 6 Dec 2017 07:19:07 -0600
Message-ID: <ce8dfe3f-c863-5c42-0a6c-0c1975031702@acm.org>
References: <alpine.LRH.2.02.1712060052170.12854@file01.intranet.prod.int.rdu2.redhat.com>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: openipmi-developer@lists.sourceforge.net,
        linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1712060052170.12854@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/06/2017 03:25 AM, Mikulas Patocka wrote:
> This patch fixes ipmi crash on parisc introduced in the kernel 4.15-rc.
> The pointer io.io_setup is not initialized and thus it causes crash in
> try_smi_init when attempting to call new_smi->io.io_setup.

Thanks, I'll get this in for 4.15.

-corey

> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>
> ---
>   drivers/char/ipmi/ipmi_si_parisc.c |    2 ++
>   1 file changed, 2 insertions(+)
>
> Index: linux-4.15-rc2/drivers/char/ipmi/ipmi_si_parisc.c
> ===================================================================
> --- linux-4.15-rc2.orig/drivers/char/ipmi/ipmi_si_parisc.c	2017-12-06 01:19:49.000000000 +0100
> +++ linux-4.15-rc2/drivers/char/ipmi/ipmi_si_parisc.c	2017-12-06 06:40:12.000000000 +0100
> @@ -10,6 +10,8 @@ static int __init ipmi_parisc_probe(stru
>   {
>   	struct si_sm_io io;
>   
> +	memset(&io, 0, sizeof(io));
> +
>   	io.si_type	= SI_KCS;
>   	io.addr_source	= SI_DEVICETREE;
>   	io.addr_type	= IPMI_MEM_ADDR_SPACE;


