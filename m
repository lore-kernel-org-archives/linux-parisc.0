Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE612482A
	for <parisc-linux@parisc-linux.org>; Thu, 12 Apr 2001 12:48:35 -0600 (MDT)
Sender: Jes.Sorensen@cern.ch
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: matthew@wil.cx (Matthew Wilcox), parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups
References: <E14nTbe-0007lJ-00@the-village.bc.nu>
From: Jes Sorensen <jes@linuxcare.com>
Date: 12 Apr 2001 20:48:28 +0200
In-Reply-To: Alan Cox's message of "Thu, 12 Apr 2001 00:00:56 +0100 (BST)"
Message-ID: <d3pueirm2r.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Alan" == Alan Cox <alan@lxorguk.ukuu.org.uk> writes:

>> Then Linus changed his mind. You are still *only* supposed to use
>> readb/writeb on PCI (and possible ISA) on PCI like devices.

Alan> ISA is a PCI like device, its a wacky slow motion PCI bridge
Alan> with no configuration space ;).

True, but is GSC sufficiently similar? (note, I don't have intimate
knowledge about GSC).

Jes
