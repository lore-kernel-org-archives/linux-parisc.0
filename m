Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3ACDB482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 12:13:59 -0600 (MDT)
Message-Id: <200107171812.MAA30279@puffin.external.hp.com>
To: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Booting 0.9.2 on C110 
In-Reply-To: Message from "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
   of "Tue, 17 Jul 2001 13:24:57 +0200." <1A8904C3797ED411AC2E0008C7E6F88117C920@nlntmail2b.ats.nld.alcatel.nl>
Date: Tue, 17 Jul 2001 12:12:54 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Witvliet, Hans" wrote:
> Hi all,
> 
> Update to previous message, tried 0.9.2 on following other machines:
...
> B2000 system decided to load 32-bit kernel instead of 64-bit kernel: did not
> boot at all.

CD-Drive on systems with suckyio isn't supported yet. Randolph Chung
committed a first cut of support for it but it's not working yet.
(suckyio is in B/C/J with 4 digits behind it.eg B2000, C3000)

I expected the B2000 to boot with a 64-bit kernel too.
Perhaps the firmware needs to be updated? (See parisc-linux FAQ)
But you can build/install a 64-bit kernel later if you think it will help...
(See previous thread on this in the mail archive)

...
> I tried to reboot the K-server and the R-server, but somehow people were not
> all that pleased with me any more ;-)))

Yeah...I can imagine :^)
K, D, R class are architecturally very similar to C110/C200/C240 machines.
But no one plans on writing drivers for HP-PB devices (K-class).

> So i have to postpone that attempt, but as they are also 64-bit machines, i
> expect same results as with the B2000.

I wouldn't - they are quite different.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
