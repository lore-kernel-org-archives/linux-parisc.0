Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep16-int.chello.at (viefep16-int.chello.at [213.46.255.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B097482A
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 16:50:47 -0700 (MST)
Message-ID: <3C2FA844.91DF575E@gmx.at>
Date: Mon, 31 Dec 2001 00:50:28 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: Tom <palinux@alaskatech.org>,
	PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Serial console settings?
References: <Pine.LNX.4.33.0112300925420.11391-100000@goliath.alaskatech.org> <20011230214546.C2E0E37E86@carmen.fc.hp.com>
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

.. Further the serial console speed has to be set, if Linux does
not use the PDC console (new feature for E55 and other machines with
proprietary hardware). The speed setting is done via kernel command
line parameter like

	console=ttyS0,38400

For more details at this point see under
linux/Documentation/serial-console.txt

Bye
Christoph P.


Matt Taggart wrote:
> 
> Tom writes...
> 
> > Maybe I'm missing somethign here... I set up a serial console on the C180,
> > which works great at 9600. Want to speed it up, so I changed the settings
> > to rs232_1.38400.n.8 (or whatever the exact syntax is - the PDC is happy
> > with it). Power-cycle, reset terminal to 38400 and nothing. Reset terminal
> > to 9600 and there's the screen... Doesn't seem to matter what I set the
> > console speed to in the PDC - it always runs at 9600. Is there some way I
> > have to "push" this, or otherwise save it?
> 
> Are you saying that the firmware doesn't display properly or the Linux
> console?
> 
> If its the firmware my only advice is to try several different settings and
> see if you can get anything other than 9600 to work. If you can then you
> can try turning it up.
> 
> If you're referring to the Linux console, you'll need to edit the serial
> terminal lines(they start with "T") in /etc/inittab and change the speed
> there to match firmware.
> 
> HTH,
> 
> --
> Matt Taggart        Linux Development Lab
> taggart@fc.hp.com   HP Linux Systems Operation
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
