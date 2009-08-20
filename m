From: "Helge Deller" <deller@gmx.de>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Thu, 20 Aug 2009 13:58:30 +0200
Message-ID: <20090820115830.123490@gmx.net>
References: <4A89CC4D.5040801@gmx.de> <1250549376.7858.96.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-kernel@vger.kernel.org, roland@redhat.com,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1250549376.7858.96.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The root cause is a duplicate section name (.text); is this legal?
> 
> However, there's a problem with commit
> 6d76013381ed28979cd122eb4b249a88b5e384fa in that if you fail to allocate
> a mod->sect_attrs (in this case it's null because of the duplication),
> it still gets used without checking in add_notes_attrs()
> 
> This should fix it
> 
> Signed-off-by: James Bottomley <James.Bottomley@suse.de>


Thanks!
I tested it, and it does at least fix the kernel crash.

Tested-by: Helge Deller <deller@gmx.de>


 
> diff --git a/kernel/module.c b/kernel/module.c
> index fd14114..a703c49 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -2353,7 +2353,8 @@ static noinline struct module *load_module(void
> __user *umod,
>  	if (err < 0)
>  		goto unlink;
>  	add_sect_attrs(mod, hdr->e_shnum, secstrings, sechdrs);
> -	add_notes_attrs(mod, hdr->e_shnum, secstrings, sechdrs);
> +	if (mod->sect_attrs)
> +		add_notes_attrs(mod, hdr->e_shnum, secstrings, sechdrs);
>  
>  	/* Get rid of temporary copy */
>  	vfree(hdr);
> 

-- 
Jetzt kostenlos herunterladen: Internet Explorer 8 und Mozilla Firefox 3 -
sicherer, schneller und einfacher! http://portal.gmx.net/de/go/atbrowser
