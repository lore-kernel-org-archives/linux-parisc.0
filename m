Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc1-cwma1-5-cust128.swa.cable.ntl.com [80.5.120.128])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02CB9482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Sep 2002 15:37:48 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5) with ESMTP id g87Ldn30015383;
	Sat, 7 Sep 2002 22:39:49 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5/Submit) id g87LdlBl015381;
	Sat, 7 Sep 2002 22:39:47 +0100
Subject: Re: [parisc-linux] Bus Speed
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: marc@centraltx.com
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200209071549.AA99484160@mail.centraltx.com>
References: <200209071549.AA99484160@mail.centraltx.com>
Content-Type: text/plain
Date: 07 Sep 2002 22:39:46 +0100
Message-Id: <1031434786.14390.6.camel@irongate.swansea.linux.org.uk>
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

On Sat, 2002-09-07 at 21:49, marc wrote:
> When Linux starts up I see a message saying:
> 
> ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
> 
> I have a C180 and the bus speed at startup says:
> 
> Central Bus Speed (in MHz) :        120
> 
> so I'm assuming I should add the boot parameter as mentioned above.
> Will I see any performance gain?

I doubt the 120Mhz clock is run to non PCI IDE devices. The PARISC port
should be setting the IDE base clocking itself.
