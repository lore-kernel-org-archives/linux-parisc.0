Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 474AA482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 16:32:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15tcl4-0001Wg-00; Tue, 16 Oct 2001 23:32:22 +0100
Date: Tue, 16 Oct 2001 23:32:22 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jochen Friedrich <jochen@scram.de>
Cc: Matthew Wilcox <willy@debian.org>, Tom <palinux@alaskatech.org>,
	PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011016233222.J15532@parcelfarce.linux.theplanet.co.uk>
References: <20011016210054.H15532@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.33.0110170023580.13382-100000@alpha.bocc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0110170023580.13382-100000@alpha.bocc.de>; from jochen@scram.de on Wed, Oct 17, 2001 at 12:26:22AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 17, 2001 at 12:26:22AM +0200, Jochen Friedrich wrote:
> tr0: ISA P&P Auto 16/4 Adapter found
> tr0: using irq 9, PIOaddr a20, 16K shared RAM.
> tr0: Hardware address : 00:04:AC:35:AE:E7
> tr0: Shared RAM paging enabled. Page size: 16K Shared Ram size 63K
> tr0: Maximum Receive Internet Protocol MTU 16Mbps: 16344, 4Mbps: 6104

That's cool.

> This *might* have to do with interrupts, though...

Maybe.  I'm not sure that interrupts 8-15 work; may need to program the
intel chipset to do it properly.

-- 
Revolutions do not require corporate support.
