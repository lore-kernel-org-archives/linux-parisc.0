Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA03627
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 08:18:42 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 16 Jan 2001 15:22:23 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14IXwB-0002Ye-00; Tue, 16 Jan 2001 15:22:19 +0000
Date: Tue, 16 Jan 2001 15:22:19 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Aleksandr Konstantinov <sanjak@tipas.lt>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100
Message-ID: <20010116152219.D20275@parcelfarce.linux.theplanet.co.uk>
References: <3A636BE1.EE2DBF87@tipas.lt> <20010115221749.A28689@parcelfarce.linux.theplanet.co.uk> <3A64530D.CD78EFD2@tipas.lt>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A64530D.CD78EFD2@tipas.lt>; from sanjak@tipas.lt on Tue, Jan 16, 2001 at 03:56:29PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jan 16, 2001 at 03:56:29PM +0200, Aleksandr Konstantinov wrote:
> Matthew Wilcox wrote:
> > 
> > On Mon, Jan 15, 2001 at 10:30:09PM +0100, Aleksandr Konstantinov wrote:
> > > Can anybody explain me how to get console NOT on serial link ?
> > 
> > activate CONFIG_STI and use `console=tty0' instead of `console=ttyS0'.
> Do You mean CONFIG_STI_CONSOLE ? I have it, and CONFIG_SERIAL_CONSOLE
> too.
> Palo also sets console=tty0 .  Booting goes till "Switching from PDC
> console"
> and then welcome message from palinux cdrom appears on serial link.

then that's a bug.  i shan't be able to fix it until i have access to an
STI-capable machine, which is a few weeks away yet.

-- 
Revolutions do not require corporate support.
