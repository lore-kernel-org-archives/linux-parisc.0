Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA05783
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 10:45:05 -0700
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Aleksandr Konstantinov <sanjak@tipas.lt>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100
Date: Tue, 16 Jan 2001 18:46:44 +0100
References: <3A636BE1.EE2DBF87@tipas.lt> <20010115221749.A28689@parcelfarce.linux.theplanet.co.uk> <3A64530D.CD78EFD2@tipas.lt>
In-Reply-To: <3A64530D.CD78EFD2@tipas.lt>
MIME-Version: 1.0
Message-Id: <01011618464403.01122@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

On Tuesday 16 January 2001 14:56, Aleksandr Konstantinov wrote:
> Matthew Wilcox wrote:
> > On Mon, Jan 15, 2001 at 10:30:09PM +0100, Aleksandr Konstantinov wrote:
> > > Can anybody explain me how to get console NOT on serial link ?
> >
> > activate CONFIG_STI and use `console=tty0' instead of `console=ttyS0'.
>
> Do You mean CONFIG_STI_CONSOLE ? I have it, and CONFIG_SERIAL_CONSOLE
> too.
> Palo also sets console=tty0 .  Booting goes till "Switching from PDC
> console"
> and then welcome message from palinux cdrom appears on serial link.

Try to enable just one of both: CONFIG_STI_CONSOLE _or_ CONFIG_SERIAL_CONSOLE

Greetings,
         Helge
