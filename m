From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [PATCH] missing exports
Date: Sat, 10 Jul 2004 14:33:18 -0600
Message-ID: <20040710203318.GC27696@colo.lackof.org>
References: <1067288209.3591.1.camel@kars.perseus.home> <Pine.GSO.4.58.0407101107240.10242@waterleaf.sonytel.be> <20040710130529.GP5889@parcelfarce.linux.theplanet.co.uk> <200407101555.18830.deller@gmx.de> <1089477389.2474.129.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
 Linux/m68k kernel mailing list <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 parisc-linux@parisc-linux.org
To: Kars de Jong <jongk@linux-m68k.org>
In-Reply-To: <1089477389.2474.129.camel@kars.perseus.home>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jul 10, 2004 at 06:36:30PM +0200, Kars de Jong wrote:
...
> @@ -284,6 +286,9 @@
>  #ifdef __hppa__
>  	struct parisc_device	*dev;
>  	int		dev_err;	/* carries status from registration */
> +#elif defined(__mc68000__)
> +	void		*dev;

Can *dev be unified eventually to "struct device"?

"void *" isn't my favorite construct.

grant
