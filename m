Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id EAB91482A
	for <parisc-linux@parisc-linux.org>; Sun, 24 Jun 2001 21:32:49 -0600 (MDT)
To: Andrew Shugg <andrew@neep.com.au>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: Your message of "Mon, 25 Jun 2001 09:36:27 +0800."
             <20010625093622.A31834@neep.com.au>
References: <200106241614.KAA25733@puffin.external.hp.com> <20010624121401.A1717@woot.net>  <20010625093622.A31834@neep.com.au> 
Date: Sun, 24 Jun 2001 21:35:37 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010625033537.09C1D37D2C@carmen.fc.hp.com>
Subject: [parisc-linux] Re: Headless workstation?
List-ID: <linux-parisc.vger.kernel.org>

Andrew Shugg writes...

> For the keyboard problem, you can either find another PS2 keyboard and
> plug that in, or buy/make a PS/2 loopback connector which will
> effectively make the PS/2 port think there is a keyboard attached.

I heard an interesting story once...

A large retailer used 712s as a central server of each store. Because they
didn't want the local employees meesing with the system and the serial
console hack wasn't published at the time they used a PS/2 loopback
connector. The only other connections to the system were power and 10bt. If
the central office ever had problems connecting to the system they'd call
the local manager up and ask him to cycle the soft-power switch. If it still
didn't respond they swap the box out :)

Having soft-power under linux would be really cool, but I'm not sure what
state its in currently.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
