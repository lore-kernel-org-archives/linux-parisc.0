Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA23556
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Dec 2000 06:27:30 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 22 Dec 2000 13:30:32 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 149SH6-0004YH-00; Fri, 22 Dec 2000 13:30:20 +0000
Date: Fri, 22 Dec 2000 13:30:20 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Helge Deller <deller@gmx.de>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] configuration problems with cvs from 20001216 15:40 CET
Message-ID: <20001222133020.A17200@parcelfarce.linux.theplanet.co.uk>
References: <20001217115105.A17378@excalibur.cologne.de> <00121721201800.25726@P100> <20001218230325.A934@excalibur.cologne.de> <00122000445401.00303@P100> <20001221233934.A766@excalibur.cologne.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001221233934.A766@excalibur.cologne.de>; from karsten@excalibur.cologne.de on Thu, Dec 21, 2000 at 11:39:34PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 21, 2000 at 11:39:34PM +0100, Karsten Merker wrote:
> It seems the "console=ttyS0" is the reason for the crash. To be sure, I
> have taken a fresh kernel tree (checkout from today) and compiled the
> kernel with the default configuration. It worked...

specifying `console=ttyS0' before the checkin i recently did would
definitely have caused exactly that crash.  it was trying to do an outb
because the serial driver wasn't properly configured.  since no 715 has
PCI, outb crashed & burned.

> The only difference to a working kernel is the additional kernel
> parameter. What I find strange in this case is the fact that giving
> "console=ttyS0" is mandatory on other systems - e.g. Linux/MIPS on a
> DECstation does not give you anything on the serial port unless you
> specify console=ttySx, even if serial console is the only option because
> no other console driver is compiled into the kernel.

Yeah, this is because our console handling code was on crack.  It should
work now...

-- 
Revolutions do not require corporate support.
