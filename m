Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA18616
	for <parisc-linux@puffin.external.hp.com>; Fri, 21 Jan 2000 13:15:20 -0700
Sender: adevries@thepuffingroup.com
Message-ID: <3885E8FC.5800EA9@thepuffingroup.com>
Date: Wed, 19 Jan 2000 11:40:28 -0500
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Kirk Bresniker <kirkb@chrome.rose.hp.com>
CC: Matthew Wilcox <willy@thepuffingroup.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Minutes
References: <200001150016.QAA16991@chrome.rose.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Kirk Bresniker wrote:
> | 4. Martin has cleaned up the serial and console code.  He will commit his
> |    changes tomorrow after he's tested it.
> 
> In testing the 2.3 kernel on my D320/1 with an Access Port (AP) card as
> the console, printk() appeared to be broken.  The mprint() statements in
> the boot loader seem to function correctly, and the pdc_putc('.')  at
> the end of realmode_setup() works, but the printk() at the start of
> iodc_con_init() never outputs.  The chassis codes sent out in
> realmode_setup() do appear properly on the AP console.

I'm curious as to exactly what's in a D320, could you add this to the
hardware database at http://www.thepuffingroup.com/parisc/hw.html?

The console problems you're having are actually global to every machine,
not just yours.  I think we've solved several console problems, so you
may want to try again.

> Now the interesting thing in a D-Class with an AP card installed is that
> the RS-232 connector on the back of the machine is dis-connected from
> the LASI serial hardware and connected to the AP card hardware. Because
> of this, regardless of what console path is stored on the machine, the
> AP card console is what is used, so that there will always be console
> outptu. 

That's true of console output, since we can just use PDC calls. 
However, it's difficult or impossible to do console input with PDC
because we'd have to poll for new characters using PDC_CIN, which is a
bit of a pain.

- Alex

-- 
Alex deVries
Director of Professional Services
The Puffins at Linuxcare
