From: Thibaut VARENE <varenet@parisc-linux.org>
Subject: Re: C8000 serial port
Date: Fri, 23 Apr 2010 14:17:26 +0200
Message-ID: <k2t7d01f9f01004230517v902702f7x160de554d75c707f@mail.gmail.com>
References: <20100423122701.259de41e@borg.bxl.tuxicoman.be>
	<v2h7d01f9f01004230400v9ec94077s722e677ee890d02a@mail.gmail.com>
	<20100423131546.6276c469@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100423131546.6276c469@borg.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Apr 23, 2010 at 1:15 PM, Guy Martin <gmsoft@tuxicoman.be> wrote:
>
> Hi Thibaut,
>
> Thanks for the pointer but I'm not having an issue booting the box. I
> used fbdev for that and I succeeded to install gentoo on it.
>
> However I'd like to have this port working now and I cannot get the
> kernel to recognize the serial port at all.
>
> When I load the 8250 module, the only thing I get is this :
> Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
>
> Are the serial ports on the C8000 just not supported for now ?
> I couldn't find any specifications for that hardware.

Oh I see. Dunno about the hardware itself. I've been told it's pretty
new. What does lspci say? Also check lsparisc.

HTH
