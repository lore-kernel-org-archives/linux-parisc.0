Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 8FEBC4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 17:49:27 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: "M. Grabert" <xam@deathsdoor.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP9000/730 problems
Date: Tue, 6 Feb 2001 01:48:26 +0100
References: <Pine.LNX.4.21.0102050015450.385-100000@sgate.charlysworld.de>
In-Reply-To: <Pine.LNX.4.21.0102050015450.385-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Message-Id: <01020601482600.01149@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

On Monday 05 February 2001 00:29, M. Grabert wrote:
> BTW, ASP Parallel Port driver is still broken (can't boot with it,
> but can boot without it).

Yes, I thought I fixed it a few weeks back, but .... :-(
I would like to fix that problem, but since I don't have such a machine where 
this bug happens I will need your help. If you could send me your bootlog I 
can give it another try.

> STI console is also broken (many characters are not printed or substitued
> by spaces). The problems occur of course AFTER "switching console" !

I believe, that you used the old STI code. Please try again the code I 
checked into CVS yesteray.
But the main problem why you just see some characters is, that the HP STI rom 
code doesn't includes all characters - and the new code will not fix this 
yet. But my long term goal is to switch the STI code to use the 
framebuffer-fonts from the linux-tree (which really seems possible).

> But serial console works fine :)
Yes of course. It doesn't uses the font tables of STI ROM.

Greetings,

	Helge Deller
