Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from dhcp23.swansea.linux.org.uk (unknown [81.2.110.254])
	by dsl2.external.hp.com (Postfix) with ESMTP id F003A4890
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Dec 2003 13:15:27 -0700 (MST)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id
	hB8KBEPr010460; Mon, 8 Dec 2003 20:11:15 GMT
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id
	hB8KBDCi010458; Mon, 8 Dec 2003 20:11:13 GMT
Subject: Re: [parisc-linux] test11-pa2 & serial console on C3k success,
	siimage problems
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20031208183522.GA28925@colo.lackof.org>
References: <Pine.LNX.4.58.0312080747340.7829@sal.ucc.ie>
	<20031208183522.GA28925@colo.lackof.org>
Content-Type: text/plain
Message-Id: <1070914268.10399.16.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Mon, 08 Dec 2003 20:11:09 +0000
Cc: parisc-linux@lists.parisc-linux.org, "M. Grabert" <xam@cs.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Llu, 2003-12-08 at 18:35, Grant Grundler wrote:
> On Mon, Dec 08, 2003 at 08:20:38AM +0000, M. Grabert wrote:
> ...
> > SiI680: 100% native mode on irq 128
> >     ide0: MMIO-DMA at 0xf4800000-0xf4800007 -- Error, MMIO ports already in use.
> >     ide1: MMIO-DMA at 0xf4800008-0xf480000f -- Error, MMIO ports already in use.
> 
> Look at the code that prints this line and the error msg.

This can only occur if critical 2.4 IDE fixes for mmio are missing from
2.6 or some kind of implementation error is being tripped. Ask
Bartlomiej why mmio==2 mode ("check by host driver only") isn't
implemented. Its requited for mmio PCI devices to work properly even on
x86. That or the SI680/3112 driver in 2.6 is not setting it and the
kernel code is there but not being used.

That message just can't occur on the proper code.

Background:
	Drivers use ioremap returns for mmio registers
	IDE core only knows ioremap data
	IDE core used to try and reserve the matching physical locations

On x86 it "happens" to work until you have more than about 2.5Gb of RAM

Alan
