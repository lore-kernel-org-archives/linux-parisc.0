Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 908B4482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Dec 2002 22:49:40 -0700 (MST)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5) with ESMTP id gBG6SvlQ012787;
	Mon, 16 Dec 2002 06:28:58 GMT
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5/Submit) id gBG6Stu2012785;
	Mon, 16 Dec 2002 06:28:55 GMT
Subject: Re: [parisc-linux] problems with PCI IDE controller
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Matthew Wilcox <willy@debian.org>
Cc: Joerg Steindlberger <j@steindlberger.de>,
	PARISC-LINUX <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20021214131048.L10991@parcelfarce.linux.theplanet.co.uk>
References: <courier.3DFB1AEA.0000527C@server01>
	<20021214131048.L10991@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 16 Dec 2002 06:28:55 +0000
Message-Id: <1040020135.11729.221.camel@irongate.swansea.linux.org.uk>
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

On Sat, 2002-12-14 at 13:10, Matthew Wilcox wrote:
> > hp-c240 login: Uniform Multi-Platform E-IDE driver Revision: 6.31
> > ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
> > PDC20268: IDE controller on PCI bus 00 dev 08
> > PDC20268: chipset revision 2
> > PDC20268: not 100% native mode: will probe irqs later

Is this a plug in card. For some reason it has been left in non native
mode so won't work as a plug in board.
