Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E6470484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 11:20:33 -0700 (MST)
Date: Mon, 26 Jan 2004 19:20:26 +0100
Message-ID: <40153110000001C0@ocpmta2.freegates.net>
In-Reply-To: <20040126172505.GQ11844@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] A fix for B2k and CONFIG_PDC_CONSOLE pb
To: "Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Christoph Plattner <christoph.plattner@gmx.at>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



> +	if ((PAGE0->mem_cons.cl_class != CL_DUPLEX) && !PAGE0->mem_kbd.iodc_io)
>  		return 0;
Right Matthew this case is nearly impossible (may be excepted if disconected
the usb kbd during the boot), it would means that my pdc_console is not a
serial one (ie graphic([01])) but no usb kdb found, so in that case pdc would
switch console automaticaly to serial.

I would just still check the case when I have an usb kbd (I would have to
recover one) but the pdc console is setup to serial port (eg no graphic screen
available) just for an output screen without input kbd? 

Thanks for your attention and remarks,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
