Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 552E04891
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Jan 2004 07:39:03 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i0JEcwa02957; Mon, 19 Jan 2004 09:38:58 -0500
Subject: Re: [parisc-linux] 32bit parisc kernel 2.6.1 and pcmcia
From: James Bottomley <James.Bottomley@steeleye.com>
To: Helge Deller <deller@gmx.de>
In-Reply-To: <200401191007.19929.deller@gmx.de>
References: <200401182059.34270.deller@gmx.de>
	<1074469497.1805.25.camel@mulgrave> <200401191007.19929.deller@gmx.de>
Content-Type: text/plain
Date: 19 Jan 2004 09:38:54 -0500
Message-Id: <1074523135.2201.6.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, 2004-01-19 at 04:07, Helge Deller wrote:
> Yenta: CardBus bridge found at 0000:00:02.0 [0000:0000]
> Yenta: ISA IRQ mask 0x0000, PCI irq 98
> Socket status: 30000007
> Yenta: CardBus bridge found at 0000:00:02.1 [0000:0000]
> Yenta: ISA IRQ mask 0x0000, PCI irq 99
> Socket status: 30000007

Hmm, that's not too good.  It should look something like

Yenta: CardBus bridge found at 0000:00:02.0 [0000:0000]
Yenta: setting irqmux to INTA,INTB
Yenta: Enabling burst memory read transactions
Yenta: Using CSCINT to route CSC interrupts to PCI
Yenta: Routing CardBus interrupts to PCI
Yenta: ISA IRQ mask 0x0000, PCI irq 98
Socket status: 30000410
cs MEM ports 0xf0804000-0xf0804fff allocated in parent Dino parisc8:0
LMMIO 0
 others)
cs IO ports 0x0-0x3f allocated in parent Dino I/O Port

The relevant points are the lines routing all the interrupts to PCI
(because we can't do ISA interrupts).

The fixes I put into yenta were only for the PCI1410 (well, 13xx) yenta
sockets, probably something extra has to be done to fix this one up.

James
