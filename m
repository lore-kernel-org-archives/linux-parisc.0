Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F167482A
	for <parisc-linux@parisc-linux.org>; Wed, 11 Apr 2001 16:59:52 -0600 (MDT)
Subject: Re: [parisc-linux] FB cleanups
To: parisc-linux-admin@lists.parisc-linux.org (Jes Sorensen)
Date: Thu, 12 Apr 2001 00:00:56 +0100 (BST)
Cc: matthew@wil.cx (Matthew Wilcox), parisc-linux@parisc-linux.org
In-Reply-To: <d3wv8rqc5a.fsf@lxplus015.cern.ch> from "Jes Sorensen" at Apr 12, 2001 12:56:01 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14nTbe-0007lJ-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Then Linus changed his mind. You are still *only* supposed to use
> readb/writeb on PCI (and possible ISA) on PCI like devices.

ISA is a PCI like device, its a wacky slow motion PCI bridge with no 
configuration space ;).
