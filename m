Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 28CB64A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Feb 2001 22:27:42 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA13452
	for <parisc-linux@puffin.external.hp.com>; Sun, 25 Feb 2001 22:22:39 -0700
Message-Id: <200102260530.VAA23229@milano.cup.hp.com>
To: Matthieu Delahaye <delahaym@esiee.fr>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Unregister driver patch 
In-reply-to: Your message of "Sun, 25 Feb 2001 12:02:38 PST."
             <3A98E64E.A8A9216A@esiee.fr>
Date: Sun, 25 Feb 2001 21:30:03 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Matthieu,
Ok. I lied. One more issue with the patch in register_pa_dev().

Matthieu Delahaye wrote:
> @@ -145,16 +187,16 @@
>  {
>  	struct pa_iodc_driver *driver = pa_drivers;
>  
> -	while ((0 == hp_dev->managed) && (NULL != driver)) {
> +	while ((NULL == hp_dev->driver) && (NULL != driver)) {
>  
>  		if (compare_spec(hp_dev,driver))
> -			hp_dev->managed =
> -				((*driver->callback)(hp_dev,driver) == 0);
> +			hp_dev->driver =
> +				(((*driver->callback)(hp_dev,driver) == 0)?driv
>   er:NULL);
>  
>  		driver = driver->next;
>  	}
>  
> -	return hp_dev->managed;
> +	return (hp_dev->driver==driver);

In the case a device is managed,  "driver" points to "->next" after
we exit the loop and we end up returning false.  Right?

I think "return (NULL != hp_dev->driver)" is the correct code.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
