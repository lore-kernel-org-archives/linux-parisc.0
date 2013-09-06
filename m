From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: parisc debian kernel - missing  modules for C8000 -
 linux-image-3.10-2-parisc64-smp
Date: Fri, 6 Sep 2013 18:11:58 +0200
Message-ID: <20130906161158.GA19991@alpha.franken.de>
References: <108451378018002@web28j.yandex.ru>
 <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl>
 <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk>
 <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl>
 <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk>
 <52278FBD.2010304@bell.net>
 <BLU0-SMTP36B9C5CB7AF69063DE0EBD97320@phx.gbl>
 <5228F071.4040000@gmx.de>
 <20130906085203.GA15333@alpha.franken.de>
 <1378479057.2063.6.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Alex Ivanov <gnidorah@p0n4ik.tk>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1378479057.2063.6.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Sep 06, 2013 at 07:50:57AM -0700, James Bottomley wrote:
> Hang on, if you bought a new Radeon card, how are you POSTing it?  The
> BIOS will have the x86 POST code.

there is an x86 emulator in PDC. I even get PDC console on nvidia
cards. I also tested matrox cards but their bios hangs the machine.

> Yes, I've got (or rather had) one working on a power station (the IBM
> Linux on Power workstation) before it died. It was an R128.

was that with the KMS/DRM driver or the aty one ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
