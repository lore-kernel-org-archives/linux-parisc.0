Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69410482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Nov 2001 00:03:05 -0700 (MST)
Message-Id: <200111050659.XAA24866@puffin.external.hp.com>
To: Daniel Engstrom <5116@telia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some Questions... 
In-Reply-To: Message from Daniel Engstrom <5116@telia.com>
   of "Sun, 04 Nov 2001 22:28:24 +0100." <20011104222824.O2303@zaphod.halden.lillfab.se>
Date: Sun, 04 Nov 2001 23:59:08 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Daniel Engstrom wrote:
> 3) String I/O implementation
> The string I/O functions (insl/outsl and friends) are implemented in 
> terms of inl/outl and so on. This means that the HPA switch code in 
> arch/parisc/kernel/pci.c is executed once per word in the transfer.
> If the pci_hba_data struct had entries for these the test would have 
> been done outside of the loop.

It doesn't matter. The cost (in cycles) to perform the read
far exceeds any savings in cpu cycles getting rid of the switch
will bring. I'm talking 500 or so cycles per IO port space read
on a 400Mhz PA8500.

Of course, you could measure inb() precisely with CR16 on *your* box
(using EISA) since YMMV and I haven't done this in a while.

grant
