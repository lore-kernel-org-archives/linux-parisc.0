Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7DE3482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Oct 2001 10:09:34 -0600 (MDT)
Date: Mon, 15 Oct 2001 18:09:23 +0200
From: Thomas Bogendoerfer <tsbogend@elvis.franken.de>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Xfree86 failled with -pa57
Message-ID: <20011015180923.A14160@elvis.franken.de>
Reply-To: tsbogend@alpha.franken.de
References: <1003154375.3bcaebc713db3@webmail.tiscalinet.be> <20011015164903.X11105@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011015164903.X11105@linuxcare.com>; from rhirst@linuxcare.com on Mon, Oct 15, 2001 at 04:49:03PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 15, 2001 at 04:49:03PM +0100, Richard Hirst wrote:
> > (EE) No OS PCI support available
> 
> Do you have PCI support enabled in your kernel?

shouldn't matter. I bet the framebuffer runs in a different resolution than
it's configured in XF86Config. Since the current stifb doesn't support
mode switching, I've made the check very strict to not allow it. So
the boot time resolution and bpp must match that from XF86Config.

Thomas.
