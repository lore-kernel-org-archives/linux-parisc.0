Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E12C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Apr 2002 13:39:52 -0600 (MDT)
Message-ID: <3CB1F1F6.6DA251ED@gmx.at>
Date: Mon, 08 Apr 2002 21:39:34 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ahbaid Gaffoor <ahbaidg@attbi.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>, willy@debian.org,
	jbglaw@lug-owl.de
Subject: Re: [parisc-linux] K220 - Setup via. Console
References: <3CB12C3E.B6FB23DB@attbi.com>
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

Hello, there are some points to discuss and solve.

(1) cabeling:
First of all check RS232 pinout. My E55 HP server has some
non-standards,
not only that the RX/TX pins are swapped, the handshake lines are 
completely non-standard mapped, and a simple Null-Modem cable does the
wrong ! (BTW: As HP has the wrong direction, a 1:1 cable is needed,
but again, the handshake lines are non-standard).

So check the RS232 port on the HP box. (On my 720 and 712 I never ahd
a problem, it was a standard RS232, PC-like).

(2) SUN
The SUN always has PC-like 25-pin connectors, but a gender-changer is
needed, as SUN always has the PC-pin layout, but a female instead of
male connector.

Even the 8-way serial ports of SUN (old S-bus one, and new PCI one), 
always use the same female 25-pin connectors with PC-pinout.

Special connectors as mention in the other answers is only used at
Sun ICP/IPX: Mini-DIN 8pin
Sun SparcStation 20 (and perhaps 10): one 25-pin female connector
	with two ports (you need a Y-cable).

(3) Problems between PCs under BIOS/Microsoft control.
As Microsoft (and PC BIOSes) is (are) a proprietary non-standard system, 
it also makes problems concerning the RS232 ports. Although hardware
handshake is turned off, the CTS pin (pin 5 on 25pin PC connector)
must be asserted. You need at mimimum a bridging cable between pin
4 and 5 (pin 7 and 8 on a DSUB-9pin).

The problem does not exist on SUN and on Linux PCs. The bridge is only
needed on the PC (hyperTerminal) side.

(4) XON/XOFF is often used on serial console, and as far as I know,
default !
So XON/XOFF should be enabnled, but again, this is my opinion.

(5) Serial Console:
Concerning the mail of the K220 console support.
If the serial console on the K220 is not supported, you can use the new
PDC Console Driver, you can find under non-standard serial drivers. It 
supports the PDC console driver of the firmware to use under Linux 
as driver `/dev/ttyB0'. In the help of this configuration option you can
find the steps, how to use this. I developed this driver for my E55, as
this machine is not supported, too.


So I hope ypu will find some hints and solve the problem.

With friendly regards
Christoph P.


Ahbaid Gaffoor wrote:
> 
> Hello,
> 
> I have a K220. I'd like to install the latest release of PA-RISC Linux
> on it but I need to first of all be able to console into it.
> 
> I am trying to use the console cable I have used with Sun boxes on this
> machine, however I just cannot get it to work? My terminal emulation is
> done via HyperTerminal on a laptopb via. COM1
> 
> I do not get any output information on my console connection.
> 
> What do I need to do this?
> 
> What seeting do I need on my terminal emulator? Or is there some jumper
> I have to set to allow this to work? Currently I use 9600 8N1, I also
> tried 7E1 but still no luck...
> 
> Please help...
> 
> Thanks...
> 
> Ahbaid.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
