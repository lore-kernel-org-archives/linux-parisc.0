Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50C70482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Dec 2002 23:09:35 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel7.hp.com (Postfix) with ESMTP id 3407E805E81
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Dec 2002 01:09:30 -0500 (EST)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id XAA18500
	for parisc-linux@lists.parisc-linux.org; Sun, 15 Dec 2002 23:09:29 -0700 (MST)
Date: Sun, 15 Dec 2002 23:09:29 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200212160609.XAA18500@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problems with PCI IDE controller
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

> On Sat, 2002-12-14 at 13:10, Matthew Wilcox wrote:
> > > hp-c240 login: Uniform Multi-Platform E-IDE driver Revision: 6.31
> > > ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
> > > PDC20268: IDE controller on PCI bus 00 dev 08
> > > PDC20268: chipset revision 2
> > > PDC20268: not 100% native mode: will probe irqs later
>
> Is this a plug in card. For some reason it has been left in non native
> mode so won't work as a plug in board.

I don't think this is a problem. I have a similar card in my home PC, and
it prints the same thing (re: not 100% native mode). Here is an excerpt
from my PC's boot messages running 2.4.19:

    Uniform Multi-Platform E-IDE driver Revision: 6.31
    ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
    PDC20267: IDE controller on PCI bus 02 dev 08
    PCI: Found IRQ 10 for device 02:01.0
    PDC20267: chipset revision 2
    PDC20267: not 100% native mode: will probe irqs later
    PDC20267: (U)DMA Burst Bit ENABLED Primary PCI Mode Secondary PCI Mode.
	ide0: BM-DMA at 0xa400-0xa407, BIOS settings: hda:pio, hdb:pio
	ide1: BM-DMA at 0xa408-0xa40f, BIOS settings: hdc:pio, hdd:pio

All of my hard drives are on this card, so I know it works just fine (I
use ide=reverse so that my hard drives start with hda. I keep my CD and
DVD drives on the motherboard IDE buses).

John
