Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA17281
	for <parisc-linux@puffin.external.hp.com>; Sat, 5 Feb 2000 09:18:07 -0700
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m12H6uF-0027X2C@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Sat, 5 Feb 2000 16:13:51 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Date: Sat, 5 Feb 2000 15:37:59 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Michael Ang <mang@subcarrier.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] State Of The Port
Message-ID: <20000205153759.A538@alpha.franken.de>
References: <Pine.BSF.4.10.10002042255350.8742-100000@cuzea.pair.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.10.10002042255350.8742-100000@cuzea.pair.com>; from Michael Ang on Fri, Feb 04, 2000 at 11:17:33PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Feb 04, 2000 at 11:17:33PM -0500, Michael Ang wrote:
>         Thomas Bogendorf

look it up in the From: line:-)

>     Expects to have it working by this weekend. Lack of endianess
>     support is the main problem.  2.2.14 is the "latest" tulip.c
>     but has no big endian support.

the 2.2.14 tulip.c driver has big endian support as well as Donald's latest 
alpha version.

> Willy mentioned that we will have to think about running on 64bit at some
> point.

IMHO, it's way too early to even think about it. Of course 64bit is sexy,
but without a working 32bit userland it's a too big can of worms to open
right now. Linux/MIPS64 hasn't started before a reasonable distribution
existed, and I'm sure this wasn't a bad descision then.

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
