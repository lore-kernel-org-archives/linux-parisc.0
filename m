Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA02108
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Sep 1999 11:07:51 -0600
Received: from postal.sr.hp.com (root@postal.sr.hp.com [15.4.46.173])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id NAA08009
	for <parisc-linux@thepuffingroup.com>; Wed, 1 Sep 1999 13:08:52 -0400 (EDT)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id KAA24668 for <parisc-linux@thepuffingroup.com>; Wed, 1 Sep 1999 10:08:44 -0700 (PDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id KAA00812 for parisc-linux@thepuffingroup.com; Wed, 1 Sep 1999 10:09:15 -0700 (PDT)
Message-Id: <199909011709.KAA00812@meow.sr.hp.com>
Subject: Re: [parisc-linux] HP3000 928LX Support? (fwd)
To: parisc-linux@thepuffingroup.com
Date: Wed, 1 Sep 1999 10:09:14 -0700 (PDT)
From: Bill Katz "\(William\)" <billk@sr.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
|Hugo van der Kooij wrote:
|> On Wed, 1 Sep 1999, Richard Muratti wrote:
|> 
|> > I have the opportunity to acquire a HP3000 928LX server
|> > and would like to know if it is supported.
|> 
|> HP3000 systems are not PA-RISC systems. They use the Motorola 68000 CPU
|> and you chould check the 68000 oport effort wether or not the unit may run
|> linux.
|
|[ I associate "HP3000" with the MPE products from CSY division]
|
|I can't speak for HP3000 products more than 5 years old.
|But recent HP3000 products are definitely PA-RISC.
|Firmware is different but many of the platform components
|are the same as K and T class machines.
|
|grant

HP3000s were NEVER 680x0 based.  They were based on a proprietary 16 bit
stack-based architecture until about 1986.  After that they were PA-RISC
systems.  I'm pretty sure all that are identified with a 9xx number are
PA-risc.  Earlier machines had 2 digit model numbers, i.e.. HP3000/68.

I saw recently in the news where HP was suing a used computer dealer that was
buying s800 HPUX machines, changing the bootROMS and making them into HP3000
s900 machines and selling them for more money.  

I know very little about 9xx bootROMS, but there is a chance that Linux
will boot on it, since it doesn't check anytihing in the bootROM to see
if the BootROM forbids it from booting.  MPE will not boot on s800s.

However the unit could be old enough that it has I/O cards based on the
CIO or NIO (aka HP -pricision) bus.  It is unlikely anyone will ever bother
writing Linux drivers for those cards.

	-Bill Katz
