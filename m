Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA25758
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 10:35:19 -0700
Message-ID: <3A652259.9359CA7C@tipas.lt>
Date: Wed, 17 Jan 2001 05:40:57 +0100
From: Aleksandr Konstantinov <sanjak@tipas.lt>
MIME-Version: 1.0
To: Helge Deller <deller@gmx.de>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100
References: <3A636BE1.EE2DBF87@tipas.lt> <20010115221749.A28689@parcelfarce.linux.theplanet.co.uk> <3A64530D.CD78EFD2@tipas.lt> <01011618464403.01122@P100.helgenet.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> > Do You mean CONFIG_STI_CONSOLE ? I have it, and CONFIG_SERIAL_CONSOLE
> > too.
> > Palo also sets console=tty0 .  Booting goes till "Switching from PDC
> > console"
> > and then welcome message from palinux cdrom appears on serial link.
>
> Try to enable just one of both: CONFIG_STI_CONSOLE _or_ CONFIG_SERIAL_CONSOLE

 I tried it and got following behavior:

  While kernel starts/initializes screen stays black. When it suddenly fills with
scattered characters (I could
read few words on screen: TCP, UDP RARP, Init and even something, that looks like
Welcome).



A.K.
