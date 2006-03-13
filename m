From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Mon, 13 Mar 2006 13:34:17 -0700
Message-ID: <20060313203417.GB20537@colo.lackof.org>
References: <20060307211213.3A261494013@palinux.hppa> <200603072227.38097.deller@gmx.de> <20060308073743.GA31959@colo.lackof.org> <200603121426.16996.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <grundler@lackof.org>
In-Reply-To: <200603121426.16996.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Mar 12, 2006 at 02:26:16PM +0100, Helge Deller wrote:
> Here is my current analysis.
> Maybe someone with a better understanding might have some idea on what's going on ?

Yes - I'll take another look. You have good data below:

> 1. Astro BC Runway Port at 0xfffffffffed00000 [10] { 12, 0x0, 0x582, 0x0000b }
...
> hpa start = fffffffffed00000 size=4096    <<<<<< this is the Astro BC
> IOREMAP: phys_addr=fffffffffed00000, offset = 0, size=4096

I think we ahould be doing an ioremap of HPA + ASTRO_IOC_OFFSET.
ie 32*4k (0x20000)

> IOREMAP: addr = 0000000000008000         <<<<< the new vm area ( fffffffffed00000(phys) will be mapped to 0x8000(virt))
> set_pte: virtual:8000 -> phys=fffffffffed00000, pte=fffffffffed00283  << here is the pte entry which ioremap() generates.
...
> Below is the PIM HPMC output.
> Looking at the log, it seems that the pte was (mostly?) right, since
> the System Responder Address below is 0xfffffffffed10200.
> Although I don't understand why it was 0xfffffffffed10200 and not 0xfffffffffed00008 ?

We need to map the BC port to get rev info and we do that
at the top of sba_driver_callback(). So I _think_ the first
accesses are working.

Later, sba_ioc_init() calls
	sba_dev->ioc[0].ioc_hpa = ioc_remap(sba_dev, ASTRO_IOC_OFFSET);

That looks fine too.

I just wonder why we are accessing 0xfffffffffed10200 (ioc? + ROPE0_CTL)
instead of (BC HPA + 32 * SBA_FUNC_SIZE):
	0xfffffffffed00000 + 32 * 4K = 0xfffffffffed20000

Maybe the offset isn't being placed into the page table correctly.
(Unlikely...)


> Any ideas ?

I'll keep looking more later today and/or tomorrow.
I want to review the HPMC data again too.

thanks,
grant
