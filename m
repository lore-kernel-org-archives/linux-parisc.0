Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54317482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 08:56:37 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 58701B007; Fri,  8 Jun 2001 15:52:49 +0100 (BST)
Date: Fri, 8 Jun 2001 15:52:49 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Michael S . Zick" <mszick@pflash.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mike Werneke <mikewerneke@hotmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Apollo 735/99 hangs after booting from CDROM
Message-ID: <20010608155249.T16532@linuxcare.com>
References: <20010607232003.B2308@solo.franken.de> <01060809163401.00472@wolf01.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01060809163401.00472@wolf01.my.home>; from mszick@pflash.com on Fri, Jun 08, 2001 at 09:15:02AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 08, 2001 at 09:15:02AM -0500, Michael S . Zick wrote:
> Note to all -
> 
> The problem exists (on my 720) WITHOUT the frame buffer code
> in the image.

Well, with CONFIG_STI_CONSOLE and CONFIG_FB_STI both unset your kernel
can't be hanging after "Console: colour dummy device 80x25", can it?
So at this point I don't think we know it is the same problem on
735+sti as it is on your 720+serial.

Richard

> Mike
> 
> On Thu, 07 Jun 2001, Thomas Bogendoerfer wrote:
> > On Thu, Jun 07, 2001 at 03:51:22AM -0000, Mike Werneke wrote:
> > > --snip
> > > CPU(s): 1 x PA7100 (PCX-T) at 99.000000 MHz
> > > Kernel command line: HOME=/ TERM=linux root=/dev/ram console=tty0 sti=0 
> > > sti_font=VGA8x16
> > > Console: colour dummy device 80x25
> > > snip--
> > > 
> > > and then hangs.  Could this be a bad iso image? Or is this a known issue? 
> > 
> > no, you are running the sti console kernel on a not supported frame buffer.
> > Use the 32serial image.
> > 
> > Thomas.
