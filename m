Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dhcp23.swansea.linux.org.uk (pc1-cwma1-5-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A1EF3484E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Aug 2003 10:31:00 -0600 (MDT)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9) with ESMTP id h7RGUGra023189;
	Wed, 27 Aug 2003 17:30:17 +0100
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9/Submit) id h7RGUEpd023187;
	Wed, 27 Aug 2003 17:30:14 +0100
Subject: Re: [parisc-linux] C3000 and IDE DMA support
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0308261152480.6589-100000@sal.ucc.ie>
References: <Pine.LNX.4.44.0308261152480.6589-100000@sal.ucc.ie>
Content-Type: text/plain
Message-Id: <1062001812.22739.84.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 27 Aug 2003 17:30:13 +0100
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

On Maw, 2003-08-26 at 12:46, M. Grabert wrote:
> - the hard disk performs very bad (just 3.13 MB/s instead of expected
>   >30 MB/s, tested with similar drive in PC and same hdparm settings)
>   In fact it shows typical data rates for unsupported DMA transfers

Your drive is in PIO, probably PIO3 or so.

> - excessive harddisk access, ie. copying large files (>1GB) obviously
>   blocks any other access to the harddisk, at least it's not (very) responsive
>   (caused by the slow transfer rate?)

Hard to tell

> - can't change from my default kernel setting (DMA) to PIO mode via hdparm,
>   it causes a kernel oops (but hey, who needs PIO anyway ;)

That would be a bug

> Is unmasq_irq supported? What about DMA? Is it obviously not fixed yet
> (at least somebody wrote that "ns87415 dma doesn't work reliably on
>  suckyio-systems" a couple of weeks back)

irq unmasking is a generic IDE property so should be fine on any
platform with a non prehistoric defunct controller (NS87415 is fine)

> Any hints how to speed up the transfer rate?

Buy a PC ;)

Basically you need to fix DMA support
