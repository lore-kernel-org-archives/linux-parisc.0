Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F54E482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Jun 2001 06:45:31 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id B3B0CB007; Sun, 10 Jun 2001 13:41:30 +0100 (BST)
Date: Sun, 10 Jun 2001 13:41:30 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Michael S . Zick" <mszick@pflash.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mike Werneke <mikewerneke@hotmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Apollo 735/99 hangs after booting from CDROM
Message-ID: <20010610134130.A16532@linuxcare.com>
References: <20010608155249.T16532@linuxcare.com> <01060810451304.00472@wolf01.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01060810451304.00472@wolf01.my.home>; from mszick@pflash.com on Fri, Jun 08, 2001 at 10:41:08AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 08, 2001 at 10:41:08AM -0500, Michael S . Zick wrote:
> Richard
> 
> Congrat's (early) -
> 
> You may have spotted the problem -
> 
> There isn't any "CONFIG_FB_STI" in the config file shipped
> with V0.9 iso image.

Yes I know, I created those config files ;)

CONFIG_STI_CONSOLE and CONFIG_FB_STI do not both have to be selected.
CONFIG_STI_CONSOLE was developed first, and gives you just a standard
text-style interface, CONFIG_FB_STI gives frame buffer support.

CONFIG_STI_CONSOLE works on more machines that CONFIG_FB_STI at the
moment, so we shipped the 0.9 release with CONFIG_STI_CONSOLE.  As an
example, CONFIG_FB_STI doesn't work on my B180, but CONFIG_STI_CONSOLE
does.  I believe both work on 712.

Richard
