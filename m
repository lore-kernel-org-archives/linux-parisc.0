From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [patch 4/4] RFC: PCI: consolidate several
	pcibios_enable_resources() implementations
Date: Tue, 19 Feb 2008 17:33:50 +1100
Message-ID: <1203402830.6740.98.camel@pasglop>
References: <20080219043952.845136014@ldl.fc.hp.com>
	 <20080219044307.878416912@ldl.fc.hp.com>
Reply-To: benh@kernel.crashing.org
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-pci@atrey.karlin.mff.cuni.cz, linux-arch@vger.kernel.org,
	Russell King <rmk@arm.linux.org.uk>,
	linux-arm-kernel@lists.arm.linux.org.uk,
	Kyle McMartin <kyle@parisc-linux.org>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
	linuxppc-dev@ozlabs.org, Chris Zankel <chris@zankel.net>
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080219044307.878416912@ldl.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



> Index: work6/drivers/pci/Makefile
> ===================================================================
> --- work6.orig/drivers/pci/Makefile	2008-02-18 21:16:36.000000000 -0700
> +++ work6/drivers/pci/Makefile	2008-02-18 21:16:38.000000000 -0700
> @@ -2,7 +2,7 @@
>  # Makefile for the PCI bus specific drivers.
>  #
>  
> -obj-y		+= access.o bus.o probe.o remove.o pci.o quirks.o \
> +obj-y		+= access.o bios.o bus.o probe.o remove.o pci.o quirks.o \
>  			pci-driver.o search.o pci-sysfs.o rom.o setup-res.o
>  obj-$(CONFIG_PROC_FS) += proc.o
>  
> Index: work6/drivers/pci/bios.c
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ work6/drivers/pci/bios.c	2008-02-18 21:16:38.000000000 -070
                        ^^^^^^

Yuck :-)

Please, don't call this bios ... whatever is in this file really has
nothing to do with a "BIOS" in any shape or form :-) I know we used to
call those things pcibios_* but that's really historical...

If you want to make clear it's for "utilities" that can be overriden
by the arch, maybe call it utils.c, or just stick the function in
pci.c, or setup-res.c

Ben.
