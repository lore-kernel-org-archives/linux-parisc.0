Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA27923
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Oct 1999 11:22:12 -0600
Date: Tue, 19 Oct 1999 19:22:58 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com,
        Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
Subject: Re: [parisc-linux] LASI and serial port initialization
Message-ID: <19991019192258.A27572@suse.de>
References: <99101821580101.00297@P100> <199910191630.JAA27454@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199910191630.JAA27454@milano.cup.hp.com>; from Grant Grundler on Tue, Oct 19, 1999 at 09:30:45AM -0700
List-ID: <linux-parisc.vger.kernel.org>

> 3) buffer the output instead of calling IODC.

This is what Linux does (have a look at kernel/printk.c)
