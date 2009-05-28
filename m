From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] serial: 8250_gsc: fix printk format warning
Date: Wed, 27 May 2009 22:51:06 -0700
Message-ID: <20090527225106.10fc9cc6.akpm@linux-foundation.org>
References: <1242652291-1868-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	alan@lxorguk.ukuu.org.uk
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1242652291-1868-1-git-send-email-a.beregalov@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 18 May 2009 17:11:31 +0400 Alexander Beregalov <a.beregalov@gmail.com> wrote:

> Fix this build warning:
> drivers/serial/8250_gsc.c:44: warning: format '%lx' expects type
> 'long unsigned int', but argument 2 has type 'resource_size_t'
> 

The patch does more than fix a "warning".  It fixes an actual error. 
The caller will prepare a 64-bit argument and the callee will print
only 32 bits of it.

> ---
>  drivers/serial/8250_gsc.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/serial/8250_gsc.c b/drivers/serial/8250_gsc.c
> index 418b4fe..a7b02a5 100644
> --- a/drivers/serial/8250_gsc.c
> +++ b/drivers/serial/8250_gsc.c
> @@ -41,7 +41,7 @@ static int __init serial_init_chip(struct parisc_device *dev)
>  			printk(KERN_INFO
>  				"Serial: device 0x%lx not configured.\n"
>  				"Enable support for Wax, Lasi, Asp or Dino.\n",
> -				dev->hpa.start);
> +				(unsigned long)dev->hpa.start);

Nope.  hpa.start can be u32 or u64.  We need to cast that to the wider
type so that it will correctly print in all circumstances.

So I changed both patches to print with %ll and to cast to
unsigned long long.
