Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA14549
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 10:02:30 -0700
Message-Id: <200101241708.JAA20961@milano.cup.hp.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 and newest CVS bits 
In-reply-to: Your message of "Wed, 24 Jan 2001 09:43:32 PST."
             <Pine.LNX.4.21.0101240937380.25434-100000@maestro.symsys.com>
Date: Wed, 24 Jan 2001 09:08:24 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Greg Ingram wrote:
> ccio-dma.c:738: Assertion size > 0 failed!
> Kernel panic: size > 0                                                       

Bogus ASSERT. Ryan committed the fixes last night. Please try again.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
