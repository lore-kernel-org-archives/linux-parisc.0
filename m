Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 549E64A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 16:35:05 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA12066;
	Fri, 2 Feb 2001 10:30:28 +1100
Date: Fri, 2 Feb 2001 10:30:28 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Paul Bame <bame@fc.hp.com>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] $$mulI missing 
In-Reply-To: <200102012026.MAA01201@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0102021028560.19209-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 1 Feb 2001, Grant Grundler wrote:

> Paul Bame wrote:
> > I didn't think the 64-bit compiler used mulI so didn't include it
> > in the millicode routines.  I'm curious what's using it.
> 
>     arch/parisc/kernel/parisc_ksyms.c
> 
> Exported for (guess what?) CONFIG_MODULE support. :^/
> 
> I've committed the following patch. Paul tells me on 64 bit, millicode looks
> to be limited to div* and rem*.

Errm.  32 bit might still want them.  #ifndef __LP64__ ?

Alan
-- 
Linuxcare.
