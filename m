Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC1544A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 18:29:03 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA02245
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Feb 2001 18:24:54 -0700
Message-Id: <200102020131.RAA01876@milano.cup.hp.com>
To: 5116@telia.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] register_fallback_cpu() 
In-reply-to: Your message of "Thu, 01 Feb 2001 23:15:05 PST."
             <200102012215.XAA10566@zaphod.halden.lillfab.se>
Date: Thu, 01 Feb 2001 17:31:18 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

5116@telia.com wrote:
> On 31 Jan, Grant Grundler wrote:
> > But I don't think it's related to the register_fallback_cpu() code changes
> > I made. Maybe something else I submitted that day...
> I now have it booting, b ut not with today's cvs I had to revert to
> 2001-01-31. 
> The problem is that register_driver only tries the first structure in
> the array it gets, and the ASP is second in the array in busdevice.c
> which causes it to never be initialized.

Yup. I submitted that bug in the same batch. :^(
I've committed the fix for this. Thanks!

> I also noticed that the busdev_driver_for array is marked as initdata,
> but a pointer to it gets saved in arch/parisc/drivers.c.

Someone with system with LASI should test/commit (in that order)
this bugfix. Helge, Richard, or Matthew perhaps?

thanks,
grant
