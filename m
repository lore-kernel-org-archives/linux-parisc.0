Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7653B496A
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 22:01:32 -0600 (MDT)
Message-Id: <200110110356.VAA21437@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Thu, 11 Oct 2001 02:40:10 BST." <20011011024010.C13932@parcelfarce.linux.theplanet.co.uk>
Date: Wed, 10 Oct 2001 21:56:44 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> I have a plan to allocate Mongoose's IRQ in a nicer way, but that will
> have to wait until tomorrow.  What do you think the best way would be
> to fix EISA card IRQs?  I have a couple of thoughts:
> 
>  * Introduce a new EISA_IRQ_BASE macro that most architectures
>    define to 0.

I don't know what other archs do or how hard that would be to drive
into the other arches.

>  * Reserve IRQ region 0 for EISA

reserve IRQ region 0 for EISA.
It's reserved now to catch broken PCI drivers that treat the IRQ number
as a byte instead of an int. So for machines w/o EISA, it could
continue to remain reserved for that purpose.

grant
