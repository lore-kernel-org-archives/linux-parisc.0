Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 952A8482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Aug 2001 11:49:25 -0600 (MDT)
Message-Id: <200108091747.LAA13929@puffin.external.hp.com>
To: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] more serial console problems on D310 
In-Reply-To: Message from Kirk Bresniker <kirkb@chrome.rose.hp.com>
   of "Thu, 09 Aug 2001 08:50:31 PDT." <200108091550.IAA08745@chrome.rose.hp.com>
Date: Thu, 09 Aug 2001 11:47:50 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Kirk Bresniker wrote:
> | I look at the HW database and it seems the D310 has two LASI (core_adapter)
> | chips (and WAX, no PCI). I suspect the detection of serial ports misnumbers
> | them (ie parisc-linux finds them in the wrong order) or we only properly
> | handle one of the two LASI's.
> 
> It may seem like that in the HW database, but there is never more than one
> LASI in a d-class system, the LASI is on the main system board, so it's
> always there regardless of which processor asssembly gives the d-class its
> flavor, and no processor board or add-in card ever contained a second LASI.

Kirk,
You are right. I misread the ioscan output.

Here are the HW database contents in a more readable form:

type	driver		HWpath	Description
------	-------------	------	--------------------------
ba	core_adapter	16	Core I/O Adapter
ext_bus	CentIf		16/0	Built-in Parallel Interface
tty	asio0		16/4	Built-in RS-232C
ext_bus	c720		16/5	Built-in SCSI
...
lan	lan2		16/6	Built-in LAN
ps2	ps2		16/7	Built-in Keyboard/Mouse
ba	core_adapter	20	Core I/O Adapter
tty	asio0		20/2	Built-in RS-232C
ba	eisa_adapter	20/5	EISA Bus Adapter
lan	btlan0		20/5/8	EISA card INP0500
...

I had assumed "core_adapter" meant LASI.
The second "Core I/O Adapter" at "20" must be WAX.

> The serial port labeled console is attached to the LASI rs-232 unless an
> access port card is plugged into the access port capable slot.
...

Ok. We still have an ordering issue then between WAX/LASI and how
tty's are numbered/discovered. That's in addition to the problem
of interrupts not getting delivered for the serial port on WAX at "20/2".

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
