Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA19525
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Feb 2000 02:28:53 -0700
Date: Thu, 10 Feb 2000 10:21:43 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CONFIG_SERIAL_GSC
Message-ID: <20000210102143.A1836@abacus.local>
References: <200002092100.NAA13944@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002092100.NAA13944@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Feb 09, 2000 at 01:00:00PM -0800
List-ID: <linux-parisc.vger.kernel.org>

> Can someone explain why "#define CONFIG_SERIAL_GSC" is in serial.h?

It shouldn't be.

> Users of asm/serial.h are:
> grundler <765>find . -name '*.[ch]' | xargs fgrep "asm/serial.h"
> ./arch/mips/baget/vacserial.c:#include <asm/serial.h>
> ./drivers/char/ip2main.c:#include <asm/serial.h>
> ./drivers/char/mac_SCC.h:/* MSch: gone to <asm/serial.h> */
> ./drivers/char/synclink.c:#include <asm/serial.h>

> ./drivers/char/serial.c:#include <asm/serial.h>
> ./drivers/gsc/lasi.c:#include <asm/serial.h>

These are the only two that concern us.

> I have the impression it's going to be difficult to build a "PCI"
> serial driver with CONFIG_SERIAL_GSC defined.

Wrong.  The serial driver is designed to handle several busses at the
same time.  That means you can have CONFIG_SERIAL (port based),
CONFIG_SERIAL_GSC, and PCI MMIO based serial all activated at the same
time and one serial port of each variation and everything should work.

All you need to do is call register_serial with a struct serial_struct *req
so req->io_type == SERIAL_IO_MEM and everything should work fine.

Of course newer boxes (c3k, j5k, c3600, j5600) don't have GSC at all, so
you'd like not do define CONFIG_GSC/CONFIG_SERIAL_GSC for those.  (Those
boxes seem to still have an HP-proprietary bus though, but I don't know
anything about that).

	Philipp Rumpf
