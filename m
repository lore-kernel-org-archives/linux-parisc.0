Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E04894A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 15:15:20 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA31769
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Feb 2001 15:11:11 -0700
From: 5116@telia.com
Message-Id: <200102012215.XAA10566@zaphod.halden.lillfab.se>
Date: Thu, 1 Feb 2001 23:15:05 +0100 (CET)
Reply-To: 5116@telia.com
Subject: Re: [parisc-linux] register_fallback_cpu() 
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <200102010541.VAA00554@milano.cup.hp.com>
MIME-Version: 1.0
Content-Type: TEXT/plain; CHARSET=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 31 Jan, Grant Grundler wrote:
> But I don't think it's related to the register_fallback_cpu() code changes
> I made. Maybe something else I submitted that day...
I now have it booting, b ut not with today's cvs I had to revert to
2001-01-31. 
The problem is that register_driver only tries the first structure in
the array it gets, and the ASP is second in the array in busdevice.c
which causes it to never be initialized.

I also noticed that the busdev_driver_for array is marked as initdata,
but a pointer to it gets saved in arch/parisc/drivers.c.

Best Regards, Daniel

-- 
