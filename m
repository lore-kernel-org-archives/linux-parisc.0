Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0DC724A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 17:12:23 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA01345
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Feb 2001 17:08:14 -0700
Message-Id: <200102020014.QAA01660@milano.cup.hp.com>
To: 5116@telia.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] register_fallback_cpu() 
In-reply-to: Your message of "Thu, 01 Feb 2001 23:15:57 PST."
             <200102012215.XAA10570@zaphod.halden.lillfab.se>
Date: Thu, 01 Feb 2001 16:14:25 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

5116@telia.com wrote:
> ---1463811727-1804289383-981065757=:6612
> Content-Type: TEXT/plain; CHARSET=US-ASCII
> 
> On 31 Jan, Grant Grundler wrote:
> 
> .... And the patch... 

Ok. I see the problem:
    Multiple entries in the "array" passed to register_driver()

I mistakenly deleted this line from the code:
-       for (;driver->check;driver++)  {

and the associated '}'. I'll restore the for() loop.

But Matthew is right: use the build-tools/cvsrc as your "~/.cvsrc".
It's generally easier to read.

thanks! (and sorry for the mistake)
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
