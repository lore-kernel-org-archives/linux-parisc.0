Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4056482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 12:12:11 -0600 (MDT)
Subject: Re: [parisc-linux] FB cleanups
To: grundler@puffin.external.hp.com (Grant Grundler)
Date: Fri, 13 Apr 2001 19:13:41 +0100 (BST)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox),
	parisc-linux@parisc-linux.org
In-Reply-To: <200104131752.LAA06197@puffin.external.hp.com> from "Grant Grundler" at Apr 13, 2001 11:52:19 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14o84m-0003Ir-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> really? ok.  I thought the 8237A (DMA chip) on pc's provided the
> DMA capability. I didn't think it wasn't inherent to the ISA bus.

It provides some DMA capabilities. Cards can also drive DMA themselves, and
for anything > 2Mhz basically have to.
