Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2A93482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Jun 2001 05:46:32 -0600 (MDT)
Date: Mon, 4 Jun 2001 06:47:40 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Failed boot on D310
In-Reply-To: <20010604113948.W25745@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0106040644370.18856-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 4 Jun 2001, Richard Hirst wrote:
> On Sun, Jun 03, 2001 at 05:44:33PM -0500, djweis@sjdjweis.com wrote:
> > On Sun, 3 Jun 2001, Richard Hirst wrote:
> > > On Sun, Jun 03, 2001 at 12:41:46PM -0500, djweis@sjdjweis.com wrote:
> > > > On Sun, 3 Jun 2001, Richard Hirst wrote:
> > > > > On Sun, Jun 03, 2001 at 08:33:23AM -0500, djweis@sjdjweis.com wrote:
> > > > > > I've got a D310 with a 100mhz processor and 128 megs of RAM. I tried to
> > > > > > boot the ISO version 0.9 last night, but it crashed on boot. I can get the
> > > > > > exact error messages, it looked like a register dump. 
> > > Ah, I'd assumed it got as far as starting the kernel and then the
> > > kernel crashed.  In this case I think it has failed reading the
> > > CD.  Can you read the CD on some other system to check it burned
> > > ok?  Are you confident that the CD drive is P5 and is working?
> > 
> > Okay, I managed to get bootp and tftp set up enough to get an image over
> > the wire. It did get into the kernel after a while and here are the boot
> > messages:
> 
> I've untangled the formatting to make them more readable:
> 
> RAMDISK: Compressed image found at block 0
> Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI end
> ttyS00 at iomem 0xffe02800 (irq = 121) is a 16550A

Good news, I noticed after a few boots that the hd access lights were
sequentially lighting up. It does make it into userspace because...

> I wonder whether the serial driver has done something which killed
> the serial port.  My approach would be to set up a cross-compile
> environment to build kernels with printk debugging to see where
> it actually stops.  Don't know if you fancy doing that though...

Already have it going. I grabbed nfsroot-small from the ftp server and it
does mount successfully. It kind of looks like it may be a mismatch
between my console= line for palo and the actual /dev tree. There was
another message to the list on the same thing earlier this AM. I'll try to
play with it tonite again.

Thanks for the help

dave


-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison
