Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA07891
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Jan 2001 20:57:18 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 27 Jan 2001 04:01:16 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14MM8a-0002Vp-00; Sat, 27 Jan 2001 03:34:52 +0000
Date: Sat, 27 Jan 2001 03:34:52 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CONFIG_SMP update
Message-ID: <20010127033452.C28987@parcelfarce.linux.theplanet.co.uk>
References: <200101270047.QAA24364@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101270047.QAA24364@milano.cup.hp.com>; from grundler@cup.hp.com on Fri, Jan 26, 2001 at 04:47:53PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jan 26, 2001 at 04:47:53PM -0800, Grant Grundler wrote:
> o problem is pbus_set_ranges() isn't defined.
> Looks like we picked up the new drivers/pci stuff anyway. *sigh*.
> I'll look at this first thing next week.

Wait, I figured it out. The new-style Makefile only includes setup-bus.c
if CONFIG_ARM or CONFIG_ALPHA is defined.  Soadding

obj-$(CONFIG_PARISC) += setup-bus.c

should do the trick.  i'll test that in a moment and if the 64-bit kernel
compiles, i'll commit it.

-- 
Revolutions do not require corporate support.
