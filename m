Received: from P100.ruhr-uni-bochum.de (root@pec-31-36.tnt4.me2.uunet.de [149.225.31.36])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id TAA03089
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Mar 2000 19:16:03 -0700
Received: from localhost (localhost [[UNIX: localhost]])
	by P100.ruhr-uni-bochum.de (8.8.8/8.8.8) id CAA20203
	for parisc-linux@puffin.external.hp.com; Fri, 3 Mar 2000 02:17:04 +0100
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: <parisc-linux@puffin.external.hp.com>
Date: Fri, 3 Mar 2000 01:50:58 +0100
Content-Type: text/plain
References: <200003022119.NAA11506@milano.cup.hp.com> <007901bf8490$8db01ef0$a94abc0f@hungary.hp.com>
In-Reply-To: <007901bf8490$8db01ef0$a94abc0f@hungary.hp.com>
MIME-Version: 1.0
Message-Id: <00030302170400.19213@P100>
Subject: [parisc-linux] Lasi Ethernet - update
List-ID: <linux-parisc.vger.kernel.org>

Hi puffins & folks,

I just checked in an updated version of the LASI ethernet-driver, which helps me
to boot my 715/64 into root-nfs and sash...
The code needs more cleanup, but I thought it is better to commit it now, so
other people can at least use it.

In order to get the driver working I wrote own functions for dma_cache_wback()
and dma_cache_inv(), which needs generic clean-up and should of course go
into another source-file (cache.c ?). Phillipp, maybe you want to integrate
them properly ?

During the tests here, it seems, that the current kernel doesn´t handle
ARP-requests properly. When I ping one of the machines, the 715 segfaults at
once with:
  "Unexpected Interruption!: Code=31 regs=..... (Addr=0000000)"
Does this happen on other machines/netcards too ?


Regards,

Helge Deller.
