Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA04753
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 18:48:40 -0700
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m12ILEb-0027mDC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Wed, 9 Feb 2000 01:43:57 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Date: Wed, 9 Feb 2000 01:41:27 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Michael Ang <mang@subcarrier.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] files still needing manual merging
Message-ID: <20000209014127.C2377@alpha.franken.de>
References: <Pine.BSF.4.10.10002081631440.11091-100000@cuzea.pair.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.10.10002081631440.11091-100000@cuzea.pair.com>; from Michael Ang on Tue, Feb 08, 2000 at 04:33:06PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 08, 2000 at 04:33:06PM -0500, Michael Ang wrote:
> `drivers/block/rd.c'

so far that's the only one in my tree, which is left. To get a kernel
compiled, I've just used the 2.3.42 version of that file (haven't commited
it yet). I can't say whether it works, because I'm now at the point, where 
I get unresolved symbols:

ld: Unsatisfied symbols:
   init_ext2_fs (code)
   up_read (code)
   uts_sem (data)
   get_task_struct (code)
   up_write (code)
   pcibios_enable_device (code)
   down_write (code)
   down_read (code)

I've commited all the stuff, I've fixed to get it compiled. I'm going
to look into the problems with the unresolved symbols tomorrow, if
the issues are still unsolved.

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
