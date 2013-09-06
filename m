From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: parisc debian kernel - missing  modules for C8000 -
 linux-image-3.10-2-parisc64-smp
Date: Fri, 06 Sep 2013 07:50:57 -0700
Message-ID: <1378479057.2063.6.camel@dabdike.int.hansenpartnership.com>
References: <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl>
	 <BLU0-SMTP99E4F2E24E1A3F5BA18E7A97360@phx.gbl>
	 <108451378018002@web28j.yandex.ru>
	 <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl>
	 <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk>
	 <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl>
	 <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk>
	 <52278FBD.2010304@bell.net> <BLU0-SMTP36B9C5CB7AF69063DE0EBD97320@phx.gbl>
	 <5228F071.4040000@gmx.de> <20130906085203.GA15333@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Alex Ivanov <gnidorah@p0n4ik.tk>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130906085203.GA15333@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2013-09-06 at 10:52 +0200, Thomas Bogendoerfer wrote:
> On Thu, Sep 05, 2013 at 10:58:25PM +0200, Helge Deller wrote:
> > Maybe section 4.5 (Chips et Coherency Issues) is relevant too: ?
> > The Rage128 product revealed a weakness in some motherboard chipsets in that there is no mechanism to guarantee
> 
> but radeon is not r128, iirc.
> 
> My current state is:
> 
> - parisc AGP GART code writes IOMMU entries in the wrong byte order and
>   doesn't add the coherency information SBA code adds
> 
> - our PCI BAR setup doesn't really work very well together with the Radeon
>   DRM address setup. DRM will generate addresses, which are even outside
>   of the connected LBA
> 
> I've hacked around both problems, but it doesn't solve the ring test
> issue. I even bought an PCI Radeon card to rule out any AGP oddities,
> but nothing new came out of the experiments with the PCI card.

Hang on, if you bought a new Radeon card, how are you POSTing it?  The
BIOS will have the x86 POST code.

> I've started checking drivers/video/aty to see what it does with
> acceleration and compare that with radeon DRM. The aty driver uses
> an endian config bit DRM doesn't use, but I haven't tested whether
> this makes a difference and how it is connected to the overall picture. 
> 
> What I'm still wondering is whether radeon DRM really works on 64bit
> big endian boxes. Is there any prove, that someone has it running ?
> Is it running on any big endian boxes ?

Yes, I've got (or rather had) one working on a power station (the IBM
Linux on Power workstation) before it died. It was an R128.

James


