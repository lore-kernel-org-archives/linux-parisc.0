Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web14802.mail.yahoo.com (web14802.mail.yahoo.com [216.136.224.218])
	by dsl2.external.hp.com (Postfix) with SMTP id 2C1C7482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Oct 2001 23:29:22 -0600 (MDT)
Message-ID: <20011018052921.50103.qmail@web14802.mail.yahoo.com>
Date: Wed, 17 Oct 2001 22:29:21 -0700 (PDT)
From: paul lee <wbm111us@yahoo.com>
Subject: Thanks - Re: [parisc-linux] Help - Serial console problem
To: Christoph Plattner <christoph.plattner@gmx.at>,
	Grant Grundler <grundler@puffin.external.hp.com>
Cc: paul lee <wbm111us@yahoo.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3BCCA573.8419CD4@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Thank you all very much! The problem has been solved: 
I re-wire  the serial cable as Christoph said and it
works very well.


--- Christoph Plattner <christoph.plattner@gmx.at>
wrote:
> Hello,
> 
> I think the problem has to do with the hardware
> handshake.
> The silly M$ OS has the problem, that it expects
> correct
> settings of the hardware handshake lines, although
> hardware
> handshake is not used. The same is true for the
> default BIOS
> (int 14h) driver. On Linux, for example, this
> problem is
> not present.
> 
> The PC under any Microsoft system or under BIOS (int
> 14h)
> control does not send any character, if the CTS line
> (pin
> 5 on the D-SUB-25) is active. A linux PC used via
> serial
> console on a Win2000 system is working, as the Linux
> PC
> activates the lines, although it is not using them. 
> 
> So sum up: Windows expects on the input side an
> active
> CTS to send. Linux does not require this line
> active,
> but activates the output for a machine on the other
> side,
> who needs the output active. 
> 
> The HP workstation and server (so my HP 55E
> 9000/856) do
> not activate the handshake line, so the CTS pin on
> the
> Win2000 side is inactive. Is was not possible for my
> to
> activate the handshake lines on the HP server via
> `stty'.
> 
> The most simple method to get it working:
> Make a special cable with a 3-wire conection to the
> HP
> machine (TXD, RXD, GND) and solder two bridges on
> the
> Win2000 side in the connector:
> 	for 25-pin:  	4 <-> 5
> 			6 <-> 20
> 
> 	for 9-pin:	7 <-> 8
> 			4 <-> 6
> 
> This should work then ....
> 
> 
> With friendly regards
> 	Christoph P.
> 
> 
> Grant Grundler wrote:
> > 
> > paul lee wrote:
> > > I could not access a C200 workstation via serial
> > > console. Could someone please give me some
> insight?
> > > I use hyperterminal on Win 2000. The settings
> are
> > > VT100, 9600, 8-N-1 and Xon/Xoff.
> > 
> > The settings are correct.
> > It's possible the serial cable isn't wired
> correctly
> > or the C200 isn't trying to use serial port1.
> > 
> > grant
> > 
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> >
>
http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
> -- 
>
-------------------------------------------------------
> private:	christoph.plattner@gmx.at
> company:	christoph.plattner@alcatel.at
> 


__________________________________________________
Do You Yahoo!?
Make a great connection at Yahoo! Personals.
http://personals.yahoo.com
