Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA00657
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 15:15:58 -0700
Date: Tue, 5 Dec 2000 23:18:24 +0100 (CET)
From: Daniel Engstrom <danne@telia.com>
To: parisc-linux@thepuffingroup.com
cc: 5116@telia.com
Message-ID: <Pine.LNX.4.21.0012052307320.8673-100000@zaphod.halden.lillfab.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Recent CVS kernel: boot failure on 715/50 & inb() undefined
List-ID: <linux-parisc.vger.kernel.org>

Since about yesterday CVS kernels seems to stop booting after the
traps_init message.

Hardware: 715/50, serial console. I can remeber this happening before 
but it was 'fixed' by disabling support for PCI chipsets.

Also: I had to tweak the kernel a bit so it would link, because inb()
and outb() was undefined (referenced in driverd/cher/mem.c and
drivers/char/serial.c). 

I could see that the code in mem.c had some '#if !defined(__mc68000__)'
around them, perhaps there should be a CONFIG_PORT_IO #define to test for
which could be undefined on machines such as the 715 without a wax driver.

Or maybe inb() and outb() should always be defined?

/Daniel  

-- 
