Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8CC82482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Jul 2001 12:37:52 -0600 (MDT)
Message-Id: <200107261836.MAA19533@puffin.external.hp.com>
To: Reinhard.Gimbel@freenet.de
Cc: parisc-linux@lists.parisc-linux.org, sanaya@gr.hp.com
Subject: Re: [parisc-linux] Re: Help on install 
In-Reply-To: Message from Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
   of "Thu, 26 Jul 2001 18:48:42 +0200." <01072618484200.01103@octopus>
Date: Thu, 26 Jul 2001 12:36:33 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Reinhard Gimbel wrote:
> My expirence is that the DINO I/O chip seems to be the key 
> element for that problem. Version 1.x of this chip crashes the 
> system like you describe it (crash during boot ... :-( )

You have Dino 1.x ? I didn't think HP ever shipped those to customers.
Or did you mean another chip?
Perhaps post the console log output?

> My 
> DINO version (2.1) allows at least boot the system but the 
> system crashes when I try to do the next steps within the 
> installation procedure.

On C180 that's most likely the problem with ccio driver.
That's a known bug(s?)  that ryan bradetich hasn't been able to solve yet.
If you can help ryan, mail him.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
