Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from dhcp23.swansea.linux.org.uk (unknown [81.2.110.254])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C7E54852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 13 Dec 2003 08:37:58 -0700 (MST)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id
	hBDFXxPr023728; Sat, 13 Dec 2003 15:34:00 GMT
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id
	hBDFXvP1023726; Sat, 13 Dec 2003 15:33:57 GMT
Subject: Re: [parisc-linux] proposed changes to dino.c
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20031213035125.GB28775@colo.lackof.org>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
	<1071093265.1730.27.camel@mulgrave>
	<20031212074838.GA16885@colo.lackof.org>
	<1071241131.1814.5.camel@mulgrave>
	<1071257297.21661.3.camel@dhcp23.swansea.linux.org.uk>
	<20031213035125.GB28775@colo.lackof.org>
Content-Type: text/plain
Message-Id: <1071329635.23720.2.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Sat, 13 Dec 2003 15:33:56 +0000
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sad, 2003-12-13 at 03:51, Grant Grundler wrote:
> On Fri, Dec 12, 2003 at 07:28:18PM +0000, Alan Cox wrote:
> > You don't need the ROM mapped expect for reading stuff like MAC, and you
> > can do that by mapping each port over the same address range.
> 
> interesting trick.
> That should work nicely for the 4-port tulip especially.
> 
> Can we allocate/map only the first tulip's ROM and point the remaining
> tulip's ROM_RESOURCE at the first one?
> 
> I'm worried multiple PCI devices could attempt to respond to
> the MMIO transaction and fight over the bus.

If the other ROMs are disabled then I don't see that happening. Its an
old trick btw - I claim no originality here. Don Becker had some driver
code that did this, and the graphics people in Linux and Windows pull
the trick of unmapping the frame buffer to use as the ROM map
temporarily
