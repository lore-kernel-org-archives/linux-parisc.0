Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60049482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Apr 2001 06:05:55 -0600 (MDT)
Sender: christoph.plattner@alcatel.at
Message-ID: <3AE6BD99.EF3D973@alcatel.at>
Date: Wed, 25 Apr 2001 14:05:45 +0200
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: Thomas Marteau <marteaut@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Bug in kernel: console support STI/serial
References: <3AE6ADF3.92D612FE@alcatel.at> <3AE6B5FB.5FB7D4FA@esiee.fr>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello,
	thanks for the prompt answer.

First of all Linux supports more than one console,
(defined with commans behind `console='), but this
is not the toppic here.

In a normal (iX86) linux kernel many console supports
can be activated (per config), but only one (!) of these
consoles are used !

So I compiled in support for serial and support for
STI, but I only use STI (default, no `console=' 
parameter used).

The output shows the usage of STI, too. So Linux decide
to use STI, but the output (and input) is done on the
serial console driver. This is really a bug.

The HELP button in for serial console support definitly
"says", that this only activates the support, but the 
serial console is only used, if `console=ttyS0' is
specified.

-----

BTW: Is there anyone who knows how to activate 
serial console on the 712/60 in the PDC console.
Normally "path console" or "path keyboard" can be
used. But not on 712/60 !!

-------

With friendly regards
	Christph Plattner


Thomas Marteau wrote:
> 
> Hi Christoph
> 
>         As far as I know, the kernel is not capable to manage two consoles. But, if you
> want to specify one precisely, you can try to give a console parameter to the
> kernel with "console=tty"
> > By the way: How can I set the 712/60 to use serial
> > PCD console (command `path' does not work for console !)
> >
> > Cheers
> >         Christoph P.
> >
> Good Luck, Thomas
> ESIEE Team

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955
