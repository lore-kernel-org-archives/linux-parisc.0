Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15F46482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Aug 2001 09:42:04 -0600 (MDT)
Message-Id: <200108091540.JAA13539@puffin.external.hp.com>
To: Reinhard.Gimbel@freenet.de
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
   of "Mon, 06 Aug 2001 22:38:13 +0200." <01080622381300.01641@octopus>
Date: Thu, 09 Aug 2001 09:40:13 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: C180: no real progress :-(
List-ID: <linux-parisc.vger.kernel.org>

Reinhard Gimbel wrote:
> Few weeks ago I posted some thoughts I had in this mailing list 
> because palinux-0.9.2 was crashing on the older box all the 
> time during installation.

I haven't seen any commits from rbrad yet.
I know he's still working on fixing the ccio driver bugs.

> 
> Some kernel messages led my in the false direction. I thought 
> DINO (h/w v2.1; or better the software glue of DINO) was the 
> root cause of "my" problems. This box had firmware v2.7.

please please please update the firmware on this box. See the parisc-linux
FAQ for details on how to upgrade firmware. You don't want to chase
data corruption problems due to the old dino. Upgrading the firmware
will prevent the scenario.  The box is useful but one can't use PCI
devices (except graphics) in it.

> Installation via network/NFS did not work because of problems; 
> With the older box i tried many things (100Mbps, 10Mbps, Hub, 
> cross-over cable) but no success ...

This should work. Make sure link lights on  the hub/switch and 
C180 are on. Shouldn't need a cross-over cable if you have a hub.
Othwerwise, review the palo parameters you are using.

> 
> After I got the replacement on Friday (DINO v3.1 [which should 
> be ok. according the kernel messages ...], firmware v5.1) the 
> problems are still present.
> 
> BTW: Grant, you are right ! But newer firmware seems not to 
> solve the problem ...

No. But it avoids some other ones.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
