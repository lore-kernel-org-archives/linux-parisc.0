Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailin3.email.bigpond.com (juicer24.bigpond.com [139.134.6.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D2E1482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 04:50:47 -0600 (MDT)
Received: from bubble.local ([144.135.24.75]) by
          mailin3.email.bigpond.com (Netscape Messaging Server 4.15) with
          SMTP id GGPVPH00.EZ6 for <parisc-linux@lists.parisc-linux.org>;
          Thu, 19 Jul 2001 20:56:05 +1000
Date: Thu, 19 Jul 2001 20:20:08 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] r3 getting trashed by __wake_up?
Message-ID: <20010719202008.C14307@bubble.sa.bigpond.net.au>
References: <200107190751.BAA09784@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107190751.BAA09784@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Thu, Jul 19, 2001 at 01:51:15AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 19, 2001 at 01:51:15AM -0600, Grant Grundler wrote:
> 
>   f0:   34 7e 00 80     ldo 40(r3),sp
>   f4:   e8 40 d0 00     ret       
>   f8:   4f c3 3f 81     ldw,mb -40(sp),r3
> 
> Shouldn't sp be restored with "copy r3,sp"?
> And the restore of r3 be "ldw 0(sp),r3"?

No, because then an interrupt might come along and trash 0(sp).  All
the assembly you showed looks good to me.

Alan
