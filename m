Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA21255
	for <parisc-linux@puffin.external.hp.com>; Sat, 5 Feb 2000 20:08:41 -0700
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m12HH4Q-0027YAC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Sun, 6 Feb 2000 03:05:02 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Date: Sun, 6 Feb 2000 03:03:11 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: willy@thepuffingroup.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: ELFness and 64bit
Message-ID: <20000206030311.A3412@alpha.franken.de>
References: <Pine.BSF.4.10.10002042255350.8742-100000@cuzea.pair.com> <20000205153759.A538@alpha.franken.de> <20000205132613.A30976@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000205132613.A30976@thepuffingroup.com>; from willy@thepuffingroup.com on Sat, Feb 05, 2000 at 01:26:13PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Feb 05, 2000 at 01:26:13PM -0500, willy@thepuffingroup.com wrote:
> We want to get people working on userland as soon as possible since this
> parallelises well with other people hacking on the kernel.  However, we
> need to go 64-bit inorder to support the L-class and similar machines.

sure, but there aren't enough people to split between even more machines.
I'd say let one person look into 64bit issues for now, and do the real
work, when 32bit is (more) solid.

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
