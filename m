Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA20344
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Aug 1999 12:10:22 -0600
Date: Thu, 26 Aug 1999 20:12:01 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Thoughts on arch/parisc/irq.c
Message-ID: <19990826201201.N19314@suse.de>
References: <19990826172626.K19314@suse.de> <199908261713.KAA12239@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199908261713.KAA12239@milano.cup.hp.com>; from Grant Grundler on Thu, Aug 26, 1999 at 10:13:14AM -0700
List-ID: <linux-parisc.vger.kernel.org>

> > the Dino documentations says bits 5-31 are HPA but as long as 5-10 are 0 we
> > don't have to care.
> FYI - All PA device addresses are 4k page aligned.

Thanks.  This does not conflict with dino decoding the not defined bits too,
though.
> > No.  You just do
> > gsc_writel(0xfffe0000 + dev->irq, dev->hpa + DEVICE_SPECIFIC_OFFSET);
> > right after request_irq(dev->irq, ...);
> 
> Ok - this is another SMP issue...I'll hardcode 0xfffe0000 for now. 
> 
> Platform	Processor HPA
> --------	-------------
> 712/80	0xfffbe000
> 715/100	0xfffbe000
> B132L		0xfffbe000
> B180L		0xfffbe000

If this is a 7300LC, the processor EIR depends on the bus id.

	Philipp Rumpf
