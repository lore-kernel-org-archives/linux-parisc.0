Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951CBCB.dip.t-dialin.net [217.81.203.203])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7FC6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Jun 2001 16:13:48 -0600 (MDT)
Date: Thu, 7 Jun 2001 23:20:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Mike Werneke <mikewerneke@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Apollo 735/99 hangs after booting from CDROM
Message-ID: <20010607232003.B2308@solo.franken.de>
References: <F214YiMCIqtQvAauNjV0001bb18@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <F214YiMCIqtQvAauNjV0001bb18@hotmail.com>; from mikewerneke@hotmail.com on Thu, Jun 07, 2001 at 03:51:22AM -0000
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jun 07, 2001 at 03:51:22AM -0000, Mike Werneke wrote:
> --snip
> CPU(s): 1 x PA7100 (PCX-T) at 99.000000 MHz
> Kernel command line: HOME=/ TERM=linux root=/dev/ram console=tty0 sti=0 
> sti_font=VGA8x16
> Console: colour dummy device 80x25
> snip--
> 
> and then hangs.  Could this be a bad iso image? Or is this a known issue? 

no, you are running the sti console kernel on a not supported frame buffer.
Use the 32serial image.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
