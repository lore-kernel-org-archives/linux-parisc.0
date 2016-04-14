From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: PCI video card hangs during system boot
Date: Thu, 14 Apr 2016 17:54:58 +0200
Message-ID: <CACrbsaDJ2PCAh3KBV=T1Cwi4JxtV31bPJw-PireiZW6W51qCmg@mail.gmail.com>
References: <CACrbsaAVBQw5zSiuS9xYo+vuP8sFk1a94FSXVz_sRGkMP+60Jg@mail.gmail.com>
	<1587186.CtnrnCsSzp@caliban.sf-tec.de>
	<570D38BF.7040307@bell.net>
	<CACrbsaBBT20+_GtJD3XMxob7Pz+mhdw7BE0h3uQSpKq-VSOHYA@mail.gmail.com>
	<570E5F69.4010203@bell.net>
	<CAFk90B_oAkq=JD0msjm2ZM2oZWAUd6yqh-XnC1Kk4HKHGOBt0w@mail.gmail.com>
	<4E86DE96-4108-41F1-872C-F7E04075466A@bell.net>
	<CACrbsaBOV3vqbwRp1i2aXA0FqgMGbuw_-9KnudnVjSwo-SW2Xg@mail.gmail.com>
	<570FB039.8040109@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Graham Gower <graham.gower@gmail.com>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <570FB039.8040109@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>
> It seems to me that an AGP card might be a better option.  The C8000 manual
> indicates that
> it has one AGP 8X Pro 110W 32-bit slot.  It looks from connector pinout in
> the Technical Reference
> Guide that the C8000 has a AGP 1.5V motherboard (pins 9, 16, 25 and 28 are
> VCC 1.5).
>
> The HP "supported" FireGL cards are 1.5V, 0.8V:
> http://www.synthmind.com/737-18872ATIAGPGraphicsCards-AGPComplianceDetails.pdf
>
> So, I think one needs to look for a 1.5V or Universal AGP card.  The first
> ATI AGP card to
> support 1.%V appears to be RAGE 128 PRO.
>
> These articles give info about AGP slots and what works electrically:
> http://www.playtool.com/pages/agpcompat/agp.html
> https://en.wikipedia.org/wiki/Accelerated_Graphics_Port

Very interesting and useful info, but they don't help us to fix the basic issue.

We have several AGP cards able to work correctly BUT in passive frame
buffer only mode, therefore the c8000, a quite fast quad core
workstation , with X11, looks like a bradypus instead that a
velociraptor.

This is the moment to recompile a custom kernel with some printk.

     Simone Mannori - ITALY
