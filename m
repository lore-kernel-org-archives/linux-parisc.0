Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA13322
	for <parisc-linux@puffin.external.hp.com>; Sat, 3 Jun 2000 14:42:04 -0600
Received: from user677.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.34.166)
  by mailserv2.iuinc.com with SMTP; 3 Jun 2000 20:42:33 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id E607FB007; Sat,  3 Jun 2000 21:42:15 +0100 (BST)
Date: Sat, 3 Jun 2000 21:42:15 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ttyS00 reported twice
Message-ID: <20000603214215.F953@linuxcare.com>
References: <20000531164102.L2253@linuxcare.com> <200006020604.XAA05048@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200006020604.XAA05048@milano.cup.hp.com>; from grundler@cup.hp.com on Thu, Jun 01, 2000 at 11:04:08PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jun 01, 2000 at 11:04:08PM -0700, Grant Grundler wrote:
> Richard Hirst wrote:
> ...
> > The solution might be to make register_serial() aware of whether rs_init()
> > has yet been called.  If it hasn't, register_serial() just queues the
> > struct_serial that was passed in and returns success.  At the end of
> > rs_init() we call register_serial() again for each item in the queue.
> > This is similar to what happens with the net devices.
> 
> Richard,
> For lack of visible discussion, I'd say just do it.

I have taken a different approach, and made rs_init() call probe_serial_gsc()
after calling probe_serial_pci().  We no longer attempt to register serial
drivers from busdevices_init().  I also removed a few gsc specific hacks
from serial.c, as they don't appear to be necessary any more.

Richard
