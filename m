From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Fri, 17 Mar 2006 10:27:48 -0700
Message-ID: <20060317172748.GA1851@colo.lackof.org>
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
> Here is the important part of the bootlog:
...
> hpa start = fffffffffed00000 size=4096    <<<<<< this is the Astro BC
> IOREMAP: phys_addr=fffffffffed00000, offset = 0, size=4096
> IOREMAP: addr = 0000000000008000         <<<<< the new vm area ( fffffffffed00000(phys) will be mapped to 0x8000(virt))
> set_pte: virtual:8000 -> phys=fffffffffed00000, pte=fffffffffed00283

I'm wondering if we want all 64 bits set in the pte or if we only want
to set the lower 40 (or 44 for pa8800) bits. The Astro system map
only shows 40-bits.

The "f_extend" might not be needed for Astro chipset if the HW will
automatically alias the 32-bit address range for us. The address
map doesn't indicate 4GB-256MB is aliased. But I wonder how the
32-bit OS could otherwise work - unless PA20 CPU is silently
sign extending everything for us.

Hrm...suggests that maybe we are doing something wrong in the
asm for the 64-bit case.

> Nevertheless, when reading the quadword from (virt) 0x8000+8 it crashes
> ("A Data Miss Timeout"? - see HPMC log).

> Although I don't understand why it was 0xfffffffffed10200 and not 0xfffffffffed00008 ?

As noted before, this is a quirk in the firmware - fed10200 is the memory
controller.

> -----------------  Processor 0 HPMC Information ------------------
...
> MEM_ADDR                     = 0x000001ff3fffffff

~0UL means not valid.

> RUN_ADDR                     = 0xc1bff0fffed08040

This was the last Runway address seen on the bus.
Ditto for RUN_DATA_HIGH/LOW.

Unfortunately, fffed08040 is the address of RUN_ADDR register.
It suggests the memory controller never saw an error
and continued recording until HPMC code reads RUN_ADDR.

hth,
grant
