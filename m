Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CC5C482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 08:43:44 -0600 (MDT)
Date: Thu, 6 Jun 2002 10:43:45 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: Randolph Chung <tausq@debian.org>, patrick@tykepenguin.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb getting healthier? (PCI guru needed, that's you willy!)
Message-ID: <20020606104345.D7198@systemhalted>
References: <20020606092115.C6900@systemhalted> <20020606150944.D27186@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020606150944.D27186@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Thu, Jun 06, 2002 at 03:09:44PM +0100
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

> 
> that ugly macro expands into inb/inw/inl.  that printk probably needs to
> go away -- i don't think it's helpful.  maybe it should stay for adapter
> != 0, but so many drivers probe ISA space for their devices that we're
> going to keep getting them.
> 
> i bet the loop isn't infinite... probably driver probing.  If you turn
> off CONFIG_PCI, the driver shouldn't be compiled in.
>

Ah, excellent. I think I understand how that works.
Sadly, I'm not so sure that's the case, since it prints:
---
PCI or EISA Bus Adapter 0 is not registered. in8(0x64) returning -1;
" in8(0x60) returning -1;
---
This message is not an exact copy since my notes are at home.

This printk alternates, dare I say, forever? (I'll leave it running for
a few hours and see what happens). 

I'll try and figure out what, if any, driver is broken.
Most importantly I'll disable PCI/EISA support for now and see how
far the system boots.

Thanks W!

c.
