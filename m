Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA19333
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 15:56:40 -0700
Message-Id: <200101302302.PAA28266@milano.cup.hp.com>
To: 5116@telia.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] register_fallback_cpu() 
In-reply-to: Your message of "Tue, 30 Jan 2001 23:47:35 PST."
             <200101302247.XAA16738@zaphod.halden.lillfab.se>
Date: Tue, 30 Jan 2001 15:02:34 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

5116@telia.com wrote:

> OK, here we go.
...
> PSW: 00000000000001100000000000001011
> r4-7     00000013 0000002f c02b8cc4 c027c3d4
> r12-15   fffffffc c0237800 c0237800 c02c9584
> r20-23   c02b8cc4 c02bb800 ffffffff 00000040
> r28-31   00002580 0000002f c2fcca80 c0290e38
> sr4-7    00000000 00000000 00000000 00000000
> IASQ: 00000000 00000000 IAOQ: c010cc7c c010cc80
> ORIG_R28: 00000000

*sigh*.
Is this an unusual parisc processor in that it doesn't have r0-3?
Or r8-11?

Can you post the *whole* output?
Starting from BOOT_ADMIN> prompt?

Oh...and unless you are using the default config file,
I'll need that too.

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
