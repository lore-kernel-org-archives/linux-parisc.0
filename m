Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD9051D10.dip.t-dialin.net [217.5.29.16])
	by dsl2.external.hp.com (Postfix) with ESMTP id D122C482A
	for <parisc-linux@parisc-linux.org>; Mon, 25 Jun 2001 17:49:46 -0600 (MDT)
Date: Tue, 26 Jun 2001 01:49:37 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Yves Bodack <ybodack@stud.fh-heilbronn.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] XFree86, sti bmode/wmode merge
Message-ID: <20010626014937.B6551@solo.franken.de>
References: <20010617155807.A6530@solo.franken.de> <005d01c0fd8e$c29fcd90$1f96078d@stuwo.fhheilbronn.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <005d01c0fd8e$c29fcd90$1f96078d@stuwo.fhheilbronn.de>; from ybodack@stud.fh-heilbronn.de on Mon, Jun 25, 2001 at 05:51:25PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 25, 2001 at 05:51:25PM +0200, Yves Bodack wrote:
> I was just trying to set up an xserver on my 712/60, but i'm not too
> experienced in these things and failed. Could you give me some hints on what
> you have installed and what the tweaking was, you did? Or may be, there is a
> web ressource i havn't found yet.

you need:

xbase-clients
xfont-base
xserver-xfree86
xterm

and a window manager (since fvwm* wasn't avaiable, I took vtwm).

And then I took the XF86Config from my notebook, where I'm alreay running
XFree 4.0.2 (server only so far), put it in place (/etc/X11/XF86Config) and
defined a fbdev device. I've attached my current XF86Config from the 712.
To use this XF86Config you also need a new kernel with PS/2 mouse support.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
