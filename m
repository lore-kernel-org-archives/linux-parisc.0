From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: parisc compile error
Date: Sun, 17 Feb 2008 17:36:04 -0500
Message-ID: <20080217223604.GA26901@phobos.i.cabal.ca>
References: <JW6GMA$1445536B7A545413BA0D6B6753D6901F@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "rubi.sher" <rubi.sher@scarlet.be>, kyle <kyle@mcmartin.ca>,
	clameter <clameter@sgi.com>, bunk <bunk@kernel.org>,
	kyle <kyle@parisc-linux.org>, matthew <matthew@wil.cx>,
	grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <JW6GMA$1445536B7A545413BA0D6B6753D6901F@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Feb 13, 2008 at 01:42:10PM +0100, rubisher wrote:
>

Can I get your Signed-off-by for this, Joel? (I assume you are Joel :)

cheers, Kyle

>     - some lake of changes of kset to kobj:
> --- ./drivers/parisc/pdc_stable.c.Orig	2008-01-28 07:09:26.000000000 +0000
> +++ ./drivers/parisc/pdc_stable.c	2008-02-13 11:22:16.000000000 +0000
> @@ -829,7 +829,7 @@
>  				   struct kobj_attribute *attr,
>  				   const char *buf, size_t count)
>  {
> -	return pdcs_auto_write(kset, attr, buf, count, PF_AUTOBOOT);
> +	return pdcs_auto_write(kobj, attr, buf, count, PF_AUTOBOOT);
>  }
>  
>  /**
> @@ -845,7 +845,7 @@
>  				     struct kobj_attribute *attr,
>  				     const char *buf, size_t count)
>  {
> -	return pdcs_auto_write(kset, attr, buf, count, PF_AUTOSEARCH);
> +	return pdcs_auto_write(kobj, attr, buf, count, PF_AUTOSEARCH);
>  }
>  
>  /**
> @@ -1066,7 +1066,7 @@
>  	}
>  
>  	/* Don't forget the root entries */
> -	error = sysfs_create_group(stable_kobj, pdcs_attr_group);
> +	error = sysfs_create_group(stable_kobj, &pdcs_attr_group);
>  
>  	/* register the paths kset as a child of the stable kset */
>  	paths_kset = kset_create_and_add("paths", NULL, stable_kobj);
> === <> ===
> 
> And the kernel build, but I don't yet try to boot it...
> 
> Hth,
> r.
> ---
> Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
> http://www.scarlet.be/
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
