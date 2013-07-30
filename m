From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] BMC support for PARISC machines
Date: Tue, 30 Jul 2013 08:32:32 +0200
Message-ID: <9487813.vZBgAZSMSR@eto>
References: <20130730000702.4C0D21D232@solo.franken.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2056396.ti35J4flce"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: openipmi-developer@lists.sourceforge.net,
	linux-parisc@vger.kernel.org, minyard@acm.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130730000702.4C0D21D232@solo.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2056396.ti35J4flce
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Thomas Bogendoerfer wrote:
> The last line of PARISC machines (C8000, RP34x0, etc.) have a BMC for
> controlling temperature, fan speed and other stuff. The BMC is connected
> via a special bus and listed in the firmware device tree. This change
> adds support for these BMCs to the IPMI driver.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> 
> This is the second try to get this change integrated. If you see
> any problems with this patch, please give me hints how to improve
> this patch.
> 
> 
>  drivers/char/ipmi/ipmi_si_intf.c |   77
> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 77 insertions(+)
> 
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c
> b/drivers/char/ipmi/ipmi_si_intf.c index af4b23f..b017b8a 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -71,6 +71,11 @@
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> 
> +#ifdef CONFIG_PARISC
> +#include <asm/hardware.h>	/* for register_parisc_driver() stuff */
> +#include <asm/parisc-device.h>
> +#endif
> +
>  #define PFX "ipmi_si: "
> 
>  /* Measure times between events in the driver. */
> @@ -298,6 +303,9 @@ static int pci_registered;
>  #ifdef CONFIG_ACPI
>  static int pnp_registered;
>  #endif
> +#ifdef CONFIG_PARISC
> +static int parisc_registered;
> +#endif
>  static unsigned int kipmid_max_busy_us[SI_MAX_PARMS];
>  static int num_max_busy_us;

Can be bool

> @@ -2697,6 +2705,64 @@ static struct platform_driver ipmi_driver = {
>  	.remove		= ipmi_remove,
>  };
> 
> +#ifdef CONFIG_PARISC
> +static int ipmi_parisc_probe(struct parisc_device *dev)
> +{
> +	struct smi_info *info;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +
> +	if (!info) {
> +		dev_err(&dev->dev,
> +			"could not allocate memory for PARISC probe\n");
> +		return -ENOMEM;
> +	}
> +
> +	info->si_type		= SI_KCS;
> +	info->addr_source	= SI_DEVICETREE;
> +	info->io_setup		= mem_setup;
> +	info->io.addr_type	= IPMI_MEM_ADDR_SPACE;
> +	info->io.addr_data	= dev->hpa.start;
> +	info->io.regsize	= 1;
> +	info->io.regspacing	= 1;
> +	info->io.regshift	= 0;
> +	info->irq		= 0; /* no interrupt */
> +	info->irq_setup		= NULL;
> +	info->dev		= &dev->dev;
> +
> +	dev_dbg(&dev->dev, "addr 0x%lx regsize %d spacing %d irq %d\n",
> +		info->io.addr_data, info->io.regsize, info->io.regspacing,
> +		info->irq);

Printing regsize, regspacing, and IRQ here is kind of pointless as they have 
fixed values, no?

> +	dev_set_drvdata(&dev->dev, info);
> +
> +	if (add_smi(info)) {
> +		kfree(info);
> +		return -EBUSY;
> +	}

add_smi() will already return an error code AFAICS. So just forward that.

Regards,

Eike
--nextPart2056396.ti35J4flce
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlH3XggACgkQXKSJPmm5/E4n1gCgnpRGoWImCEjjaSItuiEUIcsS
vjsAoKOcGPRAgpTpi7QiiBexG3RfSpRI
=+NkC
-----END PGP SIGNATURE-----

--nextPart2056396.ti35J4flce--

