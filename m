Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56340482E
	for <parisc-linux@parisc-linux.org>; Thu, 14 Nov 2002 15:17:09 -0700 (MST)
Message-ID: <3DD42259.2070106@gmx.at>
Date: Thu, 14 Nov 2002 23:23:21 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] [IMPORTANT] PDC & Mux console major number changed
References: <20021114151344.Y30392@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hello,

I do not think it is a good idea to have the same MAJOR for PDC console
and MUX driver. Those drivers are different in concept, and the PDC
driver is valid for ALL HP machines, independent if it is a 720, 712
800er, ..... The PDC driver used the ROM support and can be used
as fall back in any case.

The MUX driver is the serial driver for those special hardware of HP.
This driver can be handled in two ways:
- Let it be an own driver with special devices, like
		/dev/ttyX0..7 or /dev/ttyM0..7 (or whatever ...)
- Let it become the "default" serial device:
		/dev/ttyS0../dev/ttyS7
   This is only possible, if there is no HP with a 16450-class UART
   and a MUX !!!

So IMO it is better to use the /dev/ttySn for MUX and 16450-like UART
instead of using MUX together with PDC !
PDC is generic and NOT for special HPs. On special HP it is the only
method to use PDC console or now MUX.


With friendly regards
Christoph P.



Matthew Wilcox wrote:
> Now that we've been assigned an official major number for Mux, and had
> it accepted into 2.5, I've changed 2.4.20-rc1-pa2 to use that number.
> So if you're using an E class, a K class or a D/R class with the funky
> console thing, before you upgrade from 2.4.19, you MUST rm /dev/ttyB0
> and replace it with:
> 
> mknod /dev/ttyB0 c 11 0
> 
> Yes, breakage like this sucks, but I'd rather do it now than later.
> 



-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
