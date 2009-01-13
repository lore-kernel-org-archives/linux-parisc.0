From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] parisc: fix dev_printk() compile warnings for
	accessing a device struct
Date: Tue, 13 Jan 2009 15:26:08 -0500
Message-ID: <20090113202608.GB25103@bombadil.infradead.org>
References: <496CF63B.1050002@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <496CF63B.1050002@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jan 13, 2009 at 09:14:51PM +0100, Helge Deller wrote:
> Fix compile warnings:
> drivers/scsi/zalon.c: In function `zalon_probe':
> drivers/scsi/zalon.c:140: warning: passing arg 1 of `dev_driver_string' from incompatible pointer type
> drivers/scsi/zalon.c:140: warning: passing arg 1 of `dev_name' from incompatible pointer type
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/drivers/scsi/lasi700.c b/drivers/scsi/lasi700.c
> index 4a4e695..f23c4ca 100644
> --- a/drivers/scsi/lasi700.c
> +++ b/drivers/scsi/lasi700.c
> @@ -103,7 +103,7 @@ lasi700_probe(struct parisc_device *dev)
>  
>  	hostdata = kzalloc(sizeof(*hostdata), GFP_KERNEL);
>  	if (!hostdata) {
> -		dev_printk(KERN_ERR, dev, "Failed to allocate host data\n");
> +		dev_printk(KERN_ERR, &dev->dev, "Failed to allocate host data\n");

Huh, I thought there was a pretty macro thingy that casted to the
embedded struct device. Oh well.

applied.
