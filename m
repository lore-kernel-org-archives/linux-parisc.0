Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0DF914829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Aug 2002 09:26:30 -0600 (MDT)
Date: Mon, 5 Aug 2002 11:25:00 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Jurriaan Kalkman <Jurriaan.Kalkman@zrt.nl>
Cc: Ralf.Hildebrandt@charite.de, rbradetich@uswest.net,
	parisc-linux@lists.parisc-linux.org
Subject: Re: Betr.: Re: [parisc-linux] 2.4.19 tree merged in.
Message-ID: <20020805152500.GE31773@systemhalted>
References: <sd4e97dd.056@ms-zrt1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <sd4e97dd.056@ms-zrt1>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> >
> >For me, it doesn't even BUILD!
> >
> There is a noxious problem where the latest debian modutils are still at
> 2.4.15, and kernel-2.4.19 needs newer modutils. This can be solved
> by downloading a newer version of modutils (2.4.19 is the latest, IIRC) and
> installing those. The symptoms of too old modutils are lot of unresolved
> symbols - like  you see.
> 
> Good luck,
> Jurriaan
>

I had forgotten about that change.
Yes, you will need to update modutils...
ftp://ftp.kernel.org/pub/linux/utils/kernel/modutils/v2.4/modutils-2.4.19.tar.gz

I always have the latest source for this lying around and I forget 
about it :}

c.
