Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9550C482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 14:38:31 -0600 (MDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel1.hp.com (Postfix) with ESMTP id 734DAC36
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 16:38:30 -0400 (EDT)
Received: from there (eeyore.fc.hp.com [15.1.54.199])
	by ldl.fc.hp.com (Postfix) with SMTP id 3864E4169
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 14:38:30 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 18 Sep 2001 14:40:37 -0600
MIME-Version: 1.0
Message-Id: <20010918203830.3864E4169@ldl.fc.hp.com>
Subject: [parisc-linux] C3600/J5600 support
List-ID: <linux-parisc.vger.kernel.org>

I don't have time to pursue C3600/J5600 issues, so I'm forwarding this to 
the list in case anyone else wants to look at it.  I got C3600 to boot 
with a small ugly hack (see below), so I think a clean solution shouldn't 
be too hard to find.

Bjorn


----------  Forwarded Message  ----------

Subject: Re: C3600 LBA problem
Date: Thu, 13 Sep 2001 01:11:32 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
To: Bjorn Helgaas <bjorn_helgaas@hp.com>

Bjorn Helgaas wrote:
> Hi Grant,
>
> I'm playing with a C3600.  Not sure if the kernel is "supposed" to work
> on this or not, but it seems pretty close.

Rick Jones and I tried to boot on a J5600 and it HPMC'd too.
It wasn't a priority to pursue at the time.

> When I boot the current cvs kernel (with EARLY_BOOTUP_DEBUG) on the
> C3600, I get an HPMC while doing a config space read just after finding
> an LBA:
>
>   lba version TR4.0 (0x5) found at 0xfffffffffed30000
>   <HPMC>
>
> >From the PIM, I see:
>
>   PC: 1024ca44 (_gsc_readb+4)
>     1024ca44:   0f 40 00 1c     ldb  r0(sr0,r26),ret0
>   R26: fffffffffed3004a
>   RP: 10111130 (in lba_cfg_read)
>
> I don't see anything wrong with the address we're trying to read -- it
> looks like a valid byte in the CONFIG_DATA CSR.
>
> I notice in lba_cfg_read##size that since this is a TR4 LBA, we don't
> use the old workaround code.  However, if I short-circuit the version
> testing so we DO use the old code, the kernel boots just fine!  I.e.,
> with the following change to lba_pci.c:
>
> -       if ((!LBA_TR4PLUS(d)) && (!LBA_SKIP_PROBE(d))) { \
> +       if (1 /*(!LBA_TR4PLUS(d)) && (!LBA_SKIP_PROBE(d))*/) { \
>
> it works.  Any ideas on how to pursue this?

Several ideas:
o Sprockets firmware *does* program the chipset a bit differently
  than PAT PDC firmware - notably DMA hint registers. Dump *all* LBA
  registers from A500, C3K, and C3600 boot and see what's different.
  It also might be a difference in how Astro or the CPU is initialized
  but LBA is a starting point.

o Talk to Sprockets firmware team. JL Marsh is my contact though I
  think he's been working on IA64 firmware for quite some time.
  Find out if any of the differences are obvious to them.

o Look at later versions of HPUX LBA code to see if they do anything
  different. I based my code on 990P (r11_rose_latest or something like
 that). Joe Loos (Cupertino) would know who "owns" LBA support for HPUX. I
 haven't talked to him in a while and don't even know if he's
  still around.

>   I'm also testing on an A500,
> which looks like it has TR4 LBAs as well, so I know the TR4PLUS path
> isn't completely broken.

Exactly. A500 is working for everyone so I'm pretty sure it's not
a fundemental HW problem.

> Oh, I'll attach all the console output from both boots.

mh doesn't deal well with attachments. I need to get to bed anyway.
I will unpack/look at those tomorrow for you.

hope this helps,
grant

-------------------------------------------------------
