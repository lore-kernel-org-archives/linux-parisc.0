Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 584DF482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Dec 2002 07:23:47 -0700 (MST)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5) with ESMTP id gBGF3BlQ013941;
	Mon, 16 Dec 2002 15:03:11 GMT
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5/Submit) id gBGF3AvA013939;
	Mon, 16 Dec 2002 15:03:10 GMT
Subject: Re: [parisc-linux] problems with PCI IDE controller
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200212160609.XAA18500@udlkern.fc.hp.com>
References: <200212160609.XAA18500@udlkern.fc.hp.com>
Content-Type: text/plain
Date: 16 Dec 2002 15:03:09 +0000
Message-Id: <1040050989.13786.23.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
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

On Mon, 2002-12-16 at 06:09, John Marvin wrote:
> > On Sat, 2002-12-14 at 13:10, Matthew Wilcox wrote:
> > > > hp-c240 login: Uniform Multi-Platform E-IDE driver Revision: 6.31
> > > > ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
> > > > PDC20268: IDE controller on PCI bus 00 dev 08
> > > > PDC20268: chipset revision 2
> > > > PDC20268: not 100% native mode: will probe irqs later
> >
> > Is this a plug in card. For some reason it has been left in non native
> > mode so won't work as a plug in board.
> 
> I don't think this is a problem. I have a similar card in my home PC, and
> it prints the same thing (re: not 100% native mode). Here is an excerpt
> from my PC's boot messages running 2.4.19:

A PC is a very different thing

In legacy mode the PCI BAR registers are ignored, the I/O decode is at
0x170 etc and interrupts are flagged by the ISA legacy not by the PCI
bus.

That isnt going to work very well on your average PA-RISC box. Most
probably you want to force the chip into native mode on pa-risc
hardware.
