Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA04107
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 09:06:10 -0700
Message-Id: <200011021612.IAA28541@milano.cup.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a500.out16 
In-reply-to: Your message of "Thu, 02 Nov 2000 10:48:33 PST."
             <20001102104833.G32715@linuxcare.com>
Date: Thu, 02 Nov 2000 08:12:47 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


This is why I do NOT like our current scheme of using host
physical addresses to access I/O space.

Richard Hirst wrote:
...
> I'd guess that the NCR registers are being cached:
> 
> 
> static int __init ncr_regtest (struct ncb* np)
> {
>         register volatile u_int32 data;
>         /*
>         **      ncr registers may NOT be cached.
>         **      write 0xffffffff to a read only register area,
>         **      and try to read it back.
>         */
>         data = 0xffffffff;
>         OUTL_OFF(offsetof(struct ncr_reg, nc_dstat), data);
>         data = INL_OFF(offsetof(struct ncr_reg, nc_dstat));

If INL_OFF and OUTL_OFF are broken, they will very likely point
to something in memory - page zero. And happily scribble over
it gsc_write(xxx).

We don't cache I/O space. Never.
Something is definitely broken on this code path.

I'll look at this once I find out what I broke on the j5k/c3k boot path
in lba_pci.c. jsm already restored the previous version of lba_pci.c
so folks can still boot 32-bit on c3k/j5k.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
