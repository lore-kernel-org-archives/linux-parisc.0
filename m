Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ccd.cargoclaimsdirect.com (unknown [62.6.162.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0EC35482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Jul 2001 19:43:51 -0600 (MDT)
Date: Mon, 9 Jul 2001 02:41:27 +0100
From: Scott Ashcroft <scott.ashcroft@talk21.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.6-pa5 crashes on B160L
Message-ID: <20010709024127.B22458@cargoclaimsdirect.com>
References: <3B487A78.45BA70AB@talk21.com> <20010708221012.N6103@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010708221012.N6103@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jul 08, 2001 at 10:10:12PM +0100, Matthew Wilcox wrote:
> On Sun, Jul 08, 2001 at 04:21:28PM +0100, Scott Ashcroft wrote:
> > Kernel Fault: Code=26 regs=10554600 (Addr=1025d080)
> > 
> >      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00000000000001001111111000001111
> > r0-3     00000000 10294810 102a4980 10291010
> > r4-7     102917c4 102e4348 102e4404 10000080
> > r8-11    1028e748 0000004d 0004000e 1029ccd4
> > r12-15   00000001 00000001 000000fd f0100000
> > r16-19   f0000c30 f0000174 00000020 1025d080
> > r20-23   1028d26c 10294cf4 10294810 00000002
> > r24-27   102659e8 102954c8 102917c4 1026e010
> > r28-31   00000000 102e9810 10554840 102d7810
> > sr0-3    00000000 00000000 00000000 00000000
> > sr4-7    00000000 00000000 00000000 00000000
> > 
> > IASQ: 00000000 00000000 IAOQ: 102a4990 102a4994
> >  IIR: 0e601200    ISR: 00000000  IOR: 1025d080
> >  ORIG_R28: 0004000e
> > 
> > What else is needed to debug this? Is there a ksymoops equivalent?
> > I can supply .config, System.map on request.
> 
> I tend to look it up by hand -- 102a4990 is the most interesting address,
> (IAOQ) and r2 is sometimes also interesting (not in this case, it
> would seem).

102a494c ? probe_serial_pci

would seem to be the one.

> It'd also be helpful to show where the kernel got to before it did the
> stack dump -- might help track it down.

Forgot to say it was right at the start of booting.

Cheers,
Scott
