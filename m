Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3ED76482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Apr 2001 01:08:54 -0600 (MDT)
Sender: christoph.plattner@alcatel.at
Message-ID: <3ACAC867.25327463@alcatel.at>
Date: Wed, 04 Apr 2001 09:08:23 +0200
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Christoph Plattner <christoph.plattner@dot.at>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New kernel on 720 + Pa-Linux-0.5: Breakpoint ?
References: <3AC90274.4687ED7C@dot.at> <20010403001743.G9198@linuxcare.com> <3AC973D3.F1453A4C@alcatel.at> <20010403223441.A11435@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello,

Matthew Wilcox wrote:
> 
> On Tue, Apr 03, 2001 at 08:55:15AM +0200, Christoph Plattner wrote:
> > With the file system of ESIEE, I always have the problem, that
> > my machine hangs, before init does any output !
> >
> > I also have selfmade stuff, I will see, what will run on that
> > machine.
> 
> have you looked at all the followups to the esiee announcement noting
> the problems with it?  i suspect it's switching to STI console.

Although I definitely write

	console=ttyS0

as kernel parameter ?

Cheers
	Christoph P.

> 
> --
> Revolutions do not require corporate support.

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955
