Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5620F482A
	for <parisc-linux@parisc-linux.org>; Fri,  1 Jun 2001 05:03:19 -0600 (MDT)
Sender: marteaut@esiee.fr
Message-ID: <3B177932.235F76E4@esiee.fr>
Date: Fri, 01 Jun 2001 13:14:58 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Nicolai Leymann <n.leymann@berkom.de>,
	"parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] palinux 0.9 on 715/64 STI
References: <NDBBKPOMPCLCKIFPPHMNKEBKCOAA.n.leymann@berkom.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Nicolai,

> I've downloaded the palinux 0.9 STI image and tried to install
> it on my 715/64 (the 0.6.1 STI release runs fine). But during
> booting from the CD the system hangs with the following messages:
> 
>   Warning: unable to open an initial console
>   loop: enabling 8 loop devices
Here, I tested the serial version of 0.9. That's why we said that
715/Mirage were working!
I gonna look at it...

Be careful, Richard Hirst detected that the narrowsti.conf is bugged!
You have to modify the path (narrow -> sti). Perhaps, here is athe
explanation!

I gonna publish the fixed version on the ESIEE site, stay tuned, Thomas
ESIEE Team
http://www.esiee.fr/puffin
