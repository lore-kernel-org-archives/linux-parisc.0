Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.obsidian.de (unknown [213.69.121.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id DDB584A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Feb 2001 01:27:44 -0700 (MST)
Received: from kiste.innnet.de (obsidian@kiste.nigga-wg.de [192.168.1.2])
	by mail.obsidian.de (8.11.1/8.11.1) with ESMTP id f1FHQLO16812
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Feb 2001 09:26:21 -0800 (PST)
Date: Fri, 16 Feb 2001 09:42:46 +0100 (MET)
From: Kevin Read <obsidian@panokratie.de>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.31.0102160941400.3578-100000@kiste.innnet.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Can't build kernel without PCI
List-ID: <linux-parisc.vger.kernel.org>

Hi folks,

btw, the kernel won't build if you don't select PCI support which I don't
have on the 705 ;). It complains about missing inb and outb functions.
When I select it everything is ok.

Bye,

			Kev
