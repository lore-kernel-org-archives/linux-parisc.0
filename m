From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 11 Dec 2005 14:23:43 -0600
Message-ID: <1134332623.3367.11.camel@mulgrave>
References: <1133818340.3395.11.camel@mulgrave>
	 <20051205220344.GJ15201@flint.arm.linux.org.uk>
	 <1133829923.3262.1.camel@mulgrave>
	 <20051206093643.GA1706@flint.arm.linux.org.uk>
	 <1133876209.3267.2.camel@mulgrave>
	 <20051207122129.GA31601@isilmar.linta.de>
	 <20051211065023.GA7987@colo.lackof.org> <1134314073.3367.5.camel@mulgrave>
	 <20051211175004.GA22449@colo.lackof.org> <1134324062.3367.9.camel@mulgrave>
	 <20051211194804.GA31384@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Grant Grundler <grundler@parisc-linux.org>,
 Helge Deller <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Return-Path: <James.Bottomley@SteelEye.com>
In-Reply-To: <20051211194804.GA31384@isilmar.linta.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 2005-12-11 at 20:48 +0100, Dominik Brodowski wrote:
> diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
> index 309eb55..d07b01f 100644
> --- a/drivers/pcmcia/Kconfig
> +++ b/drivers/pcmcia/Kconfig
> @@ -200,7 +200,7 @@ config PCMCIA_PXA2XX
>  
>  config PCMCIA_PROBE
>  	bool
> -	default y if ISA && !ARCH_SA1100 && !ARCH_CLPS711X
> +	default y if ISA && !ARCH_SA1100 && !ARCH_CLPS711X && !PARISC

Yes, that's what we have left in the parisc tree.

James
