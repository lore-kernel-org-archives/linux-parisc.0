Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 3B39F4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Feb 2001 14:56:31 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] ASP Parallel port driver broken on HP9000/730
Date: Thu, 15 Feb 2001 22:58:50 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <20010212155919.B7969@parcelfarce.linux.theplanet.co.uk> <01021500595803.07438@P100.helgenet.de> <20010215095454.X1374@linuxcare.com>
In-Reply-To: <20010215095454.X1374@linuxcare.com>
MIME-Version: 1.0
Message-Id: <01021522582001.01057@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

On Thursday 15 February 2001 10:54, Richard Hirst wrote:
> On Thu, Feb 15, 2001 at 01:01:35AM +0100, Helge Deller wrote:
> > I'm still sure, that this is the correct address to test, but maybe we
> > should just disable the initialisation of bidirectional mode for machines
> > which - have an ASP chip, or
> > - have their parport-chip at address 0xf0824800 (which is the only region
> > where the ASP has it's parport), or
> > - on machines, where "parisc_get_cpu_type(cpu_data[0]) < pcxt_"  (from
> > hardware.h and processor.h) [but I'm not sure if pcxt_ is correct. You'll
> > need to verify]
>
> That parisc_get_cpu_type() bit isn't quite right, how about:
>
> diff -u -r1.7 parport_gsc.c
> --- parport_gsc.c       2001/01/25 00:01:32     1.7
> +++ parport_gsc.c       2001/02/15 09:42:08
> @@ -482,7 +482,7 @@
>         /*
>             some older machines with ASP-chip don't support the enhanced
> parport modes */
> -       if (!pdc_add_valid( (void *)(port+4))) {
> +       if (boot_cpu_data.cpu_type > pcxt && !pdc_add_valid( (void
> *)(port+4))) { /* Initialize bidirectional-mode (0x10) & data-tranfer-mode
> #1 (0x20) */ printk("%s: initialize bidirectional-mode.\n", __FUNCTION__);
> parport_writeb ( (0x10 + 0x20), port + 4);

Looks good. 
Could you commit ?

> Works on my 715/75, where boot_cpu_data.cpu_type = 2 = pcxt.
> Richard

Greetings,

	Helge
