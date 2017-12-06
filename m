From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] ipmi_si: fix crash on parisc
Date: Wed, 06 Dec 2017 11:59:53 +0100
Message-ID: <148bb897e55ffbe2225de4c0f1a32cf8@sf-tec.de>
References: <alpine.LRH.2.02.1712060052170.12854@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Cc: Corey Minyard <minyard@acm.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1712060052170.12854@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Mikulas Patocka wrote:
> This patch fixes ipmi crash on parisc introduced in the kernel 4.15-rc.
> The pointer io.io_setup is not initialized and thus it causes crash in
> try_smi_init when attempting to call new_smi->io.io_setup.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> ---
>  drivers/char/ipmi/ipmi_si_parisc.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: linux-4.15-rc2/drivers/char/ipmi/ipmi_si_parisc.c
> ===================================================================
> --- linux-4.15-rc2.orig/drivers/char/ipmi/ipmi_si_parisc.c	2017-12-06
> 01:19:49.000000000 +0100
> +++ linux-4.15-rc2/drivers/char/ipmi/ipmi_si_parisc.c	2017-12-06
> 06:40:12.000000000 +0100
> @@ -10,6 +10,8 @@ static int __init ipmi_parisc_probe(stru
>  {
>  	struct si_sm_io io;
> 
> +	memset(&io, 0, sizeof(io));
> +
>  	io.si_type	= SI_KCS;
>  	io.addr_source	= SI_DEVICETREE;
>  	io.addr_type	= IPMI_MEM_ADDR_SPACE;

Can't this be a C99 initializer for the whole struct? AFAIK this would 
set all remaining members to 0 anyway.

Eike
