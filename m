Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C5934A19
	for <parisc-linux@parisc-linux.org>; Thu, 22 Feb 2001 23:23:58 -0700 (MST)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id DEDE3D11
	for <parisc-linux@parisc-linux.org>; Thu, 22 Feb 2001 22:23:52 -0800 (PST)
Message-Id: <200102230626.WAA20515@milano.cup.hp.com>
To: Matthew Wilcox <willy@ldl.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Fix HPUX fork 
In-reply-to: Your message of "Thu, 22 Feb 2001 21:46:13 PST."
             <E14WA7R-0004qy-00@chrysl>
Date: Thu, 22 Feb 2001 22:26:47 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> -		cregs->kpc = &child_return;
>  		cregs->gr[30] = usp;
> +		if (p->personality == PER_HPUX) {
> +			cregs->kpc = &hpux_child_return;
> +		} else {
> +			cregs->kpc = &child_return;
> +		}

Matthew,
In general, branches hurt performance on RISC archs.
Could the code be structured something like:

	cregs->kpc = child_return_ftn[p->personality];
or 
	cregs->kpc = personality_data[p->personality].child_ret_ftn;


For PARISC-linux, do we need more personalities for wide-mode or SOM support?
If so, then indexing is probably a better solution.

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
