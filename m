Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c007.snv.cp.net (c007-h012.c007.snv.cp.net [209.228.33.219])
	by dsl2.external.hp.com (Postfix) with SMTP id 6F4C2482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 31 Jul 2001 22:58:09 -0600 (MDT)
Sender: chuck@dsl2.external.hp.com
Message-ID: <3B678CC7.6AC58107@telocity.com>
Date: Wed, 01 Aug 2001 00:59:51 -0400
From: caslivkoff@telocity.com
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Errors trying to compile 2.4.6-pa22
References: <3B64F11B.DC4EEF75@telocity.com> <20010730143254.A25867@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> On Mon, Jul 30, 2001 at 01:31:07AM -0400, caslivkoff@telocity.com wrote:
> > Hi list,
> >
> > I've been trying to compile a new kernel on my 712/80 (128MB RAM) while
> > running 2.4.0-pa25. I downloaded linux-latest.tar.gz (2.4.6-pa22),
> 
> > drivers/char/char.o: In function `read_port':
> > drivers/char/char.o(.text.read_port+0x6c): undefined reference to `inb'
> 
> You turned off CONFIG_PCI.  This is not currently supported; but we were
> discussing how to fix it yesterday.  For the moment, enable it.

Thanks, that got it to build.

But, when I booted from this kernel, the STI console was unusable. 
Unfortunately, the network did not come up either (using dhcp), so I was
forced to pull the plug and boot the older kernel.

The only signficant thing I noticed was that the PS/2 mouse port was
active, but no device attached. I attached mouse (old Logitech) &
rebooted.
The keyboard was still unusable, but since gpm did start OK, I was able
to
carefully select/paste to login. I did get a look at the process table
and
the gettys were running, but dhcpcd was not. I suppose I could have
tried
to start it, but I didn't recall the syntax. 

Any ideas/suggestions/thoughts?
