Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5F22482E
	for <parisc-linux@parisc-linux.org>; Thu, 14 Nov 2002 15:45:03 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18CSjK-0007GD-00; Thu, 14 Nov 2002 22:44:58 +0000
Date: Thu, 14 Nov 2002 22:44:58 +0000
From: Matthew Wilcox <willy@debian.org>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] [IMPORTANT] PDC & Mux console major number changed
Message-ID: <20021114224458.C21295@parcelfarce.linux.theplanet.co.uk>
References: <20021114151344.Y30392@parcelfarce.linux.theplanet.co.uk> <3DD42259.2070106@gmx.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DD42259.2070106@gmx.at>; from christoph.plattner@gmx.at on Thu, Nov 14, 2002 at 11:23:21PM +0100
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

On Thu, Nov 14, 2002 at 11:23:21PM +0100, Christoph Plattner wrote:
> I do not think it is a good idea to have the same MAJOR for PDC console
> and MUX driver. Those drivers are different in concept, and the PDC
> driver is valid for ALL HP machines, independent if it is a 720, 712
> 800er, ..... The PDC driver used the ROM support and can be used
> as fall back in any case.

I wish you'd said something before... they've been using the same major
for months now.  Anyway, there's really no point in using the PDC console
if the Mux console works, so I don't see why it's a bad thing.

> The MUX driver is the serial driver for those special hardware of HP.
> This driver can be handled in two ways:
> - Let it be an own driver with special devices, like
> 		/dev/ttyX0..7 or /dev/ttyM0..7 (or whatever ...)

Too late.  Lanana already has the registration:

11 char	Serial Mux device	(Linux/PA-RISC only)
		  0 = /dev/ttyB0	First mux port
		  1 = /dev/ttyB1	Second mux port
		    ...

(http://www.lanana.org/docs/device-list/devices.txt)

> - Let it become the "default" serial device:
> 		/dev/ttyS0../dev/ttyS7
>    This is only possible, if there is no HP with a 16450-class UART
>    and a MUX !!!

There is such a machine; D & R class can have a Mux plugin card and they
also have 16x50 UARTs provided by Lasi & Wax.  (firmware disables Lasi's
UART when this card is plugged in, but Wax's is still active).

-- 
Revolutions do not require corporate support.
