Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.vi-internet.de (mailx.planet-interkom.de [195.182.114.81])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58036482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Jul 2001 03:21:59 -0600 (MDT)
Sender: ruediger@dsl2.external.hp.com
Message-ID: <3B57F813.1B47E511@hrzpub.tu-darmstadt.de>
Date: Fri, 20 Jul 2001 11:21:23 +0200
From: =?iso-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel crashs on 715/100
References: <200107200641.AAA19609@puffin.external.hp.com>
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler schrieb:

> I tried to look at these files but the white space was trashed.
> So I can't look up symbols. I wanted to know what GR02 and IOAQ point at.
>
> grant
>
> Grant Grundler
> parisc-linux {PCI|IOMMU|SMP} hacker
> +1.408.447.7253
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

Hello Grant,

GR02 has the value 101987dc
I0AQ ha the values 1010d5ac and 1010d5b0.

a.c from "build-tools" says " 0x1010d5ac outb+2c" and "0x1010d5b0 outb+30

I also refresh the files on th server. Now they are readable... ;-)

Thanks for your help,

            Rüdiger
