Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA22284
	for <parisc-linux@puffin.external.hp.com>; Sun, 13 Feb 2000 09:46:53 -0700
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m12K1BJ-0027bTC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Sun, 13 Feb 2000 16:43:29 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Date: Sun, 13 Feb 2000 16:43:00 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: willy@thepuffingroup.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] MAKE initrds FAST
Message-ID: <20000213164300.A2008@alpha.franken.de>
References: <20000212225102.D9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000212225102.D9944@thepuffingroup.com>; from willy@thepuffingroup.com on Sat, Feb 12, 2000 at 10:51:02PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Feb 12, 2000 at 10:51:02PM -0500, willy@thepuffingroup.com wrote:
> 
> An interesting project someone might want to take on:

it's sure an interesting project, but there already is a solution for your 
problem in the current cvs. It's called NFS root:-)

Right now sash is running on my A180 started from a NFS mounted root.

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
