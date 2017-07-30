From: Meelis Roos <mroos@linux.ee>
Subject: Re: parisc 4.13-git, BUG: sleeping function called from invalid
 context at mm/slab.h:416
Date: Sun, 30 Jul 2017 21:12:30 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1707302112140.27473@math.ut.ee>
References: <alpine.LRH.2.20.1707292206210.12687@math.ut.ee>  <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net>  <alpine.LRH.2.20.1707300947250.27473@math.ut.ee>  <F79536F1-AB2B-435C-A127-A1DFB4AC9CE0@bell.net> <1501428648.3670.1.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1501428648.3670.1.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> How about this?  There's no need to take the write lock when creating
> links anyway.

No effect.

> 
> James
> 
> ---
> 
> diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
> index 7147aa53e9a2..d7c88b1eaf06 100644
> --- a/drivers/parisc/pdc_stable.c
> +++ b/drivers/parisc/pdc_stable.c
> @@ -331,13 +331,13 @@ pdcspath_hwpath_write(struct pdcspath_entry *entry, const char *buf, size_t coun
>  	/* Now, dive in. Write back to the hardware */
>  	pdcspath_store(entry);
>  	
> +	write_unlock(&entry->rw_lock);
> +
>  	/* Update the symlink to the real device */
>  	sysfs_remove_link(&entry->kobj, "device");
>  	ret = sysfs_create_link(&entry->kobj, &entry->dev->kobj, "device");
>  	WARN_ON(ret);
>  
> -	write_unlock(&entry->rw_lock);
> -	
>  	printk(KERN_INFO PDCS_PREFIX ": changed \"%s\" path to \"%s\"\n",
>  		entry->name, buf);
>  	
> 

-- 
Meelis Roos (mroos@linux.ee)
