From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] kobject: Read buffer overflow
Date: Sun, 02 Aug 2009 23:33:47 +0000
Message-ID: <1249256027.3922.218.camel@mulgrave.site>
References: <4A754814.50506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: kyle@mcmartin.ca, deller@gmx.de, linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
To: Roel Kluin <roel.kluin@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A754814.50506@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2009-08-02 at 10:02 +0200, Roel Kluin wrote:
> Check whether index is within bounds before testing the element.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> This also removes the likely, should it be kept?
> 
> diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
> index f9f9a5f..13a64bc 100644
> --- a/drivers/parisc/pdc_stable.c
> +++ b/drivers/parisc/pdc_stable.c
> @@ -370,7 +370,7 @@ pdcspath_layer_read(struct pdcspath_entry *entry, char *buf)
>  	if (!i)	/* entry is not ready */
>  		return -ENODATA;
>  	
> -	for (i = 0; devpath->layers[i] && (likely(i < 6)); i++)
> +	for (i = 0; i < 6 && devpath->layers[i]; i++)

Since all patterns like this (swapping the order of conditions with no
side effects in a for loop condition) are basically trivial, shouldn't
they be going via Jiri Kosina (trivial tree)?  

James


