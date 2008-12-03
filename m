From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] parisc: set_time() catch errors
Date: Wed, 3 Dec 2008 01:12:43 -0700
Message-ID: <20081203081243.GB32121@colo.lackof.org>
References: <4935C1B4.5030806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: Roel Kluin <roel.kluin@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4935C1B4.5030806@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 03, 2008 at 12:16:04AM +0100, Roel Kluin wrote:
> set_rtc_time returns negative on error, ret should be signed to catch those
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>

Reviewed-by: Grant Grundler <grundler@parisc-linux.org>

> ---
> diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
> index 346d633..c6bfa6f 100644
> --- a/drivers/rtc/rtc-parisc.c
> +++ b/drivers/rtc/rtc-parisc.c
> @@ -34,7 +34,8 @@ static int parisc_get_time(struct device *dev, struct rtc_time *tm)
>  static int parisc_set_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct parisc_rtc *p = dev_get_drvdata(dev);
> -	unsigned long flags, ret;
> +	unsigned long flags;
> +	int ret;
>  
>  	spin_lock_irqsave(&p->lock, flags);
>  	ret = set_rtc_time(tm);


Use of unsigned is wrong given the later code in parisc_set_time() does:
        if (ret < 0)
                return -EOPNOTSUPP;


I expected a compiler "out of range"-like warning.
Someone know why no warning was emitted?
Or was one emitted and we've just ignored it?

thanks,
grant
