Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BAC9482A
	for <parisc-linux@parisc-linux.org>; Tue, 17 Apr 2001 12:04:58 -0600 (MDT)
Sender: Jes.Sorensen@cern.ch
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups
References: <E14o832-0003Ih-00@the-village.bc.nu>
From: Jes Sorensen <jes@linuxcare.com>
Date: 17 Apr 2001 20:04:53 +0200
In-Reply-To: Alan Cox's message of "Fri, 13 Apr 2001 19:11:52 +0100 (BST)"
Message-ID: <d366g3xv0a.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Alan" == Alan Cox <alan@lxorguk.ukuu.org.uk> writes:

>> Well time to go study the bus behaviors and compare them then. How
>> does gsc behave wrt cache coherency, read-around-write, write
>> ordering etc etc.

Alan> And ISA is noticable for the fact it doesnt behave quite like
Alan> PCI. You use readb/readw/readl on ISA.

Yes, except that ISA has stronger semantics than PCI.

>> Using writeb on a gsc is misleading everybody else who reads the
>> code into believing that it's a PCI device.

Alan> Rubbish.

Unfortunately not, look at the fb code to see the chaos.

Jes
