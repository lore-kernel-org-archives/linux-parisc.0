Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9623F482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Aug 2001 18:25:01 -0600 (MDT)
Message-Id: <200108030023.SAA21794@puffin.external.hp.com>
To: "CARSON,KEVIN (HP-Canada,ex1)" <kevin_carson@hp.com>
Cc: robert.holmberg@idobath.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux on R947X? 
In-Reply-To: Message from "CARSON,KEVIN (HP-Canada,ex1)" <kevin_carson@hp.com>
   of "Thu, 02 Aug 2001 12:50:08 EDT." <B9957F974955D411829400D0B74FF27A04BF7875@xtor01.canada.hp.com>
Date: Thu, 02 Aug 2001 18:23:35 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"CARSON,KEVIN (HP-Canada,ex1)" wrote:
> I believe we are talking about a 947RX which is the MPe equivalent of the
> G30.

Ok.

> This presents two problems.  The hardware is identical to the G30 but
> everything that I have read in the PA-Linux project is that support for
> these machines will be a long time coming, if ever.

So far, no one inside HP has volunteered to make it happen.
If someone external wants to sign an NDA for device docs and make it
happen, that might be possible.

> The second problem is
> that the firmware is different for MPe than HP-UX.

At some point MPE systems were only different from HPUX systems
by changing the model string. G30 is a "nova-class" machine and
might predate this.

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
