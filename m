Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.linuxcare.com (ottawa.linuxcare.com [216.208.98.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1F484A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 11:08:55 -0700 (MST)
Received: by localhost.linuxcare.com (Postfix, from userid 501)
	id BBFE6529; Tue, 20 Feb 2001 14:10:27 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by localhost.linuxcare.com (Postfix) with ESMTP
	id B53BCAB92; Tue, 20 Feb 2001 14:10:27 -0800 (PST)
Date: Tue, 20 Feb 2001 14:10:27 -0800 (PST)
From: dkennedy <dkennedy@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: 5116@telia.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int
 errupts?)
In-Reply-To: <200102201725.JAA16361@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0102201409280.981-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 20 Feb 2001, Grant Grundler wrote:

> 5116@telia.com wrote:
> > Yes, most ISA devices have a probe list which the use when they are
> > compiled in, and if I use modules or a kernel command line option I 
> > want to be able to say io=0x388 when I have set the jumppers on the card
> > for that address.
> 
> The probe list is the problem. We can fixup th command line before
> the driver sees it.

ISA device drivers use inb and outb.  Isn't it possible to provide a ISA
specific inb/outb macro that does the appropriate translation?

-- 
David Kennedy, Technical Account Manager, Linuxcare, Inc.
613.562.9594 tel, 613.562.9304 fax
dkennedy@linuxcare.com, http://www.linuxcare.com/
Linuxcare.  Putting open source to work.
