Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 056A44854
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 12 Dec 2003 00:48:40 -0700 (MST)
Date: Fri, 12 Dec 2003 00:48:38 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] proposed changes to dino.c
Message-ID: <20031212074838.GA16885@colo.lackof.org>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
	<1071093265.1730.27.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1071093265.1730.27.camel@mulgrave>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Dec 10, 2003 at 04:54:24PM -0500, James Bottomley wrote:
> +/* The alignment contraints for PCI bridges under dino */
> +#define DINO_BRIDGE_ALIGN 0x100000

hrmm...I was expecting this to be defined in include/linux/pci.h
but it's not. "pbus_size_mem()" seems to take care of this
in the drivers/pci generic code.

> +		/* null out the ROM resource if there is one (we don't
> +		 * care about an expansion rom on parisc, since it
> +		 * usually contains (x86) bios code) */
> +		dev->resource[PCI_ROM_RESOURCE].flags = 0;
> +		dev->resource[PCI_ROM_RESOURCE].start = 0;
> +		dev->resource[PCI_ROM_RESOURCE].end = 0;

I just realized some drivers may need to access data (not code)
in the ROM. I'm not aware of any but I don't want to under
estimate how creative people can get. Just something to beware
when bringing up new cards.

The rest looked fine to me. I don't maintain any dino-based
machines any more and thus can't test it.

thanks,
grant
