Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8CD10482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 01:08:42 -0600 (MDT)
Message-Id: <200104130702.BAA30672@puffin.external.hp.com>
To: Jes Sorensen <jes@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups 
In-Reply-To: Your message of "12 Apr 2001 00:56:01 +0200."
             <d3wv8rqc5a.fsf@lxplus015.cern.ch>
Date: Fri, 13 Apr 2001 01:02:15 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Jes Sorensen wrote:
> Then Linus changed his mind. You are still *only* supposed to use
> readb/writeb on PCI (and possible ISA) on PCI like devices.

Jes,
AFAIK, STI devices will all be memory mapped devices.
readb/writeb will do the right thing since GSC is "PCI-like"
in this regard.

BTW, I'm not aware of any HP EISA graphics devices - only GSC devices 
with an EISA form-factor. So the answer is GSC and PCI device.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
