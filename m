Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 266CB482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 12:11:20 -0600 (MDT)
Subject: Re: [parisc-linux] FB cleanups
To: jes@linuxcare.com (Jes Sorensen)
Date: Fri, 13 Apr 2001 19:11:52 +0100 (BST)
Cc: matthew@wil.cx (Matthew Wilcox), parisc-linux@parisc-linux.org
In-Reply-To: <d3eluwrbj7.fsf@lxplus015.cern.ch> from "Jes Sorensen" at Apr 13, 2001 06:48:28 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14o832-0003Ih-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Well time to go study the bus behaviors and compare them then. How
> does gsc behave wrt cache coherency, read-around-write, write ordering
> etc etc.

And ISA is noticable for the fact it doesnt behave quite like PCI. You use
readb/readw/readl on ISA.

> Using writeb on a gsc is misleading everybody else who reads the code
> into believing that it's a PCI device.

Rubbish.

Alan
