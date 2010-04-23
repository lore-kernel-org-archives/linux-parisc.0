From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: C8000 serial port
Date: Fri, 23 Apr 2010 13:15:46 +0200
Message-ID: <20100423131546.6276c469@borg.bxl.tuxicoman.be>
References: <20100423122701.259de41e@borg.bxl.tuxicoman.be>
	<v2h7d01f9f01004230400v9ec94077s722e677ee890d02a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Thibaut VARENE <varenet@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <v2h7d01f9f01004230400v9ec94077s722e677ee890d02a@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi Thibaut,

Thanks for the pointer but I'm not having an issue booting the box. I
used fbdev for that and I succeeded to install gentoo on it.

However I'd like to have this port working now and I cannot get the
kernel to recognize the serial port at all.

When I load the 8250 module, the only thing I get is this :
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled

Are the serial ports on the C8000 just not supported for now ?
I couldn't find any specifications for that hardware.

  Guy

On Fri, 23 Apr 2010 13:00:19 +0200
Thibaut VARENE <varenet@parisc-linux.org> wrote:

> On Fri, Apr 23, 2010 at 12:27 PM, Guy Martin <gmsoft@tuxicoman.be>
> wrote:
> >
> > Hi team,
> >
> > I recently bought a C8000 and I just can't get the serial ports to
> > work. What modules should be used ? The normal 8250 modules don't
> > work.
> >
> > I'm currently running 2.6.33.2.
> 
> This has been recently discussed on debian-hppa.
> 
> See this thread
> http://lists.debian.org/debian-hppa/2010/03/msg00023.html
> 
> HTH
> 

