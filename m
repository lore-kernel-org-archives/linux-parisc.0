From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: parisc debian kernel - missing  modules for C8000 -
 linux-image-3.10-2-parisc64-smp
Date: Fri, 6 Sep 2013 16:53:01 +0200
Message-ID: <20130906145301.GA19013@alpha.franken.de>
References: <108451378018002@web28j.yandex.ru>
 <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl>
 <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk>
 <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl>
 <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk>
 <52278FBD.2010304@bell.net>
 <BLU0-SMTP36B9C5CB7AF69063DE0EBD97320@phx.gbl>
 <5228F071.4040000@gmx.de>
 <20130906085203.GA15333@alpha.franken.de>
 <23BC892C-4F67-4669-A161-5F6ADE15F203@p0n4ik.tk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Alex Ivanov <gnidorah@p0n4ik.tk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <23BC892C-4F67-4669-A161-5F6ADE15F203@p0n4ik.tk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Sep 06, 2013 at 06:12:01PM +0400, Alex Ivanov wrote:
> 06.09.2013, ? 12:52, Thomas Bogendoerfer <tsbogend@alpha.franken.de> ???????(?):
> > DRM will generate addresses, which are even outside
> >  of the connected LBA
> 
> Aren't they fixing this sort of problems, like here: https://lkml.org/lkml/2010/12/6/516 ?

no it's the side CPU->card. It only happens with PCI GART mode. DRM
shuffles around the addresses for VRAM and GTT, but misses that non PC
platforms might have more than one PCI bus, where transactions are
forwarded... or whatever it misses in our setup.

> > Is it running on any big endian boxes ?
> 
> I've seen some patches were made for KMS in order to fix support for
> big-endian machines, however all of them seem to be done for relatively
> new chips, like r600.

do you have a pointer to them ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
