Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C07E9482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 May 2001 11:49:35 -0600 (MDT)
Message-Id: <200105161742.LAA10292@puffin.external.hp.com>
To: joel@digitalparadise.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Help with bootable CD 
In-Reply-To: Your message of "Wed, 16 May 2001 00:28:54 CDT."
             <GAENJIFENGKGOINJAONFIEOACAAA.joel@digitalparadise.net>
Date: Wed, 16 May 2001 11:42:32 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Joel Lansden" wrote:
> I am getting an error message when I try to boot my 9000 box from this
> CD I created from the ISO image.  The error message is:
> 
> 	"Can't select default wide mode, PDC_PSW call does not work"
> 
> I'm not sure what information I need to provide about my system

In general, complete console log from a serial console.
But in this case "model" string should do. (eg 9000/800/A500-44)

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
