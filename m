Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA03248
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 08:06:49 -0700
Sender: sanjak@tipas.lt
Message-Id: <3A64530D.CD78EFD2@tipas.lt>
Date: Tue, 16 Jan 2001 15:56:29 +0200
From: Aleksandr Konstantinov <sanjak@tipas.lt>
Mime-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100
References: <3A636BE1.EE2DBF87@tipas.lt> <20010115221749.A28689@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> On Mon, Jan 15, 2001 at 10:30:09PM +0100, Aleksandr Konstantinov wrote:
> > Can anybody explain me how to get console NOT on serial link ?
> 
> activate CONFIG_STI and use `console=tty0' instead of `console=ttyS0'.
Do You mean CONFIG_STI_CONSOLE ? I have it, and CONFIG_SERIAL_CONSOLE
too.
Palo also sets console=tty0 .  Booting goes till "Switching from PDC
console"
and then welcome message from palinux cdrom appears on serial link.




A.K.
