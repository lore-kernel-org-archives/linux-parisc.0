Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA01604
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 15:31:19 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 5 Dec 2000 22:33:09 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 143Qds-0007ER-00; Tue, 05 Dec 2000 22:32:56 +0000
Date: Tue, 5 Dec 2000 22:32:56 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Daniel Engstrom <danne@telia.com>
Cc: parisc-linux@thepuffingroup.com, 5116@telia.com
Subject: Re: [parisc-linux] Recent CVS kernel: boot failure on 715/50 & inb() undefined
Message-ID: <20001205223256.F12682@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.21.0012052307320.8673-100000@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0012052307320.8673-100000@zaphod.halden.lillfab.se>; from danne@telia.com on Tue, Dec 05, 2000 at 11:18:24PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Dec 05, 2000 at 11:18:24PM +0100, Daniel Engstrom wrote:
> Also: I had to tweak the kernel a bit so it would link, because inb()
> and outb() was undefined (referenced in driverd/cher/mem.c and
> drivers/char/serial.c). 

OK, this is Alan Cox's fault :-)  He insists that inb et al should not
have dummy defines, but the drivers should be fixed instead.  please send
your .config.

> I could see that the code in mem.c had some '#if !defined(__mc68000__)'
> around them, perhaps there should be a CONFIG_PORT_IO #define to test for
> which could be undefined on machines such as the 715 without a wax driver.

possibly, it's difficult to say wihout knowing exactly what's going wrong.

-- 
Revolutions do not require corporate support.
