Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18D3F482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Jul 2002 12:57:01 -0600 (MDT)
Message-ID: <3D4049F3.A53BC4BA@gmx.at>
Date: Thu, 25 Jul 2002 20:56:51 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Jussi =?iso-8859-1?Q?M=E4ki?= <valen@ihanaa.org>,
	parisc-linux@lists.parisc-linux.org <parisc-linux@lists.parisc-linux.org>
References: <Pine.LNX.4.44.0207251931310.2635-100000@kone.ihanaa.org>
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Re: e45 as a diskless server
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

Have you checked, that the E45 may have (my E55 definitively has) a
"wrong" pin out. It look to be the opposite pin assignment like a
modem, but further studies have shown, that it is non-standard.

I have soldered 8x adapters from 25-female to 25-female but with
the SUN compatible pin out ! This is the same as on the PC (25pin)
but female instead of male !

The following wirering is necessary to have a PC or SUN compatible
connector:
MUX side      PC/SUN like connector
	3.......2 
	2.......3 
	8.......4 
	22......5 
	20......6 
	7.......7 
	4.......8 
	6.......20 
	9.......22 

So you can use a simple NULL-Modem cable to connect the PC to the
PC/SUN compatible MUX connector.

For simple serial console you can use following:
	Only use pins 2,3 and 7, where 2=RX, 3=TX and 7=GND !
If you use NOT a UNIX-like system on the PC the bridge CTS and RTS
pins on the PC side.

On my E55 only port 0 (first connector) is used for the serial console.

With friendly regards
Christoph P.


Jussi Mäki wrote:
> 
> > Hello, I am back from vacation.
> >
> > In the moment, I have no valid kernel image (lifimage), as I hack
> > around with the E55 device findings. But if it not a problem for
> > you to have very much output in the kernel booting, you can use it !
> > (To say it again: The image is really original and good, it only
> > generates many lines of output while detecting the devices !!!).
> 
> I've had problems connecting the E45 console to my pc, currently i've only
> managed to use it with the 700/96 HP console, i'll look into that today.
> 
> I'll mail you the boot output if/when i get it working.

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
