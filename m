Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA23123
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jan 2000 18:14:24 -0700
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <200001150016.QAA16991@chrome.rose.hp.com>
Subject: Re: [parisc-linux] Minutes
To: willy@thepuffingroup.com (Matthew Wilcox)
Date: Fri, 14 Jan 2000 16:16:42 PST
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20000114172721.V11300@thepuffingroup.com>; from "Matthew Wilcox" at Jan 14, 100 5:27 pm
List-ID: <linux-parisc.vger.kernel.org>

FYI --

| 4. Martin has cleaned up the serial and console code.  He will commit his
|    changes tomorrow after he's tested it.

In testing the 2.3 kernel on my D320/1 with an Access Port (AP) card as
the console, printk() appeared to be broken.  The mprint() statements in
the boot loader seem to function correctly, and the pdc_putc('.')  at
the end of realmode_setup() works, but the printk() at the start of
iodc_con_init() never outputs.  The chassis codes sent out in
realmode_setup() do appear properly on the AP console.

Now the interesting thing in a D-Class with an AP card installed is that
the RS-232 connector on the back of the machine is dis-connected from 
the LASI serial hardware and connected to the AP card hardware. Because
of this, regardless of what console path is stored on the machine, the 
AP card console is what is used, so that there will always be console
outptu. When I changed the stored path from the LASI RS-232 path to the 
AP card RS-232 path, the printk() succeeds. So, there must be something 
in printk() which is getting confused between what console is actually
in use and what console is the stored path.

That aside, the kernel appears to hang at the first __put_user() macro
called in unsigned long create_som_tables(). Executing a TOC after the
hang consitently gives IIA space/offset = 0x00000000 0x00046234.

KMB
--
+============================================================+
|       Kirk Bresniker    	(916) 748-2393		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
