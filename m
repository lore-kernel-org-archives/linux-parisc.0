Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA06387
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Dec 1999 13:56:38 -0700
Date: Sat, 4 Dec 1999 21:35:42 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Frank Rowand <frowand@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] bad news, good news, unkown (Temp CR used as permanent storage)
Message-Id: <19991204213542.C19280@mathe.stud.uni-erlangen.de>
References: <199912032052.MAA02894@xsvr4.cup.hp.com> <199912032215.RAA01366@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199912032215.RAA01366@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> On the subject of things possibly getting clobbered in PDC/IODC calls,
> I think the variable real_routine can get clobbered since it is used
> for more than one type of call.

Fixed by now.

> The good news is that I have made some improvement to the PDC/IODC
> console.  I have eliminated the double lines, 

How ?  There are quite a lot of ways to solve the two-consoles-which-are-
really-the-same problem, some of them just aren't very clean.  (Probably
the cleanest is to merge arch/parisc/kernel/pdc_cons.c and drivers/video/
iodccon.c into one file).

> and when the IODC console is configured, the system can now successfully
> print all stored messages and open /dev/console.

This was there before, wasn't it ?

> However, in making changes to iodccon.c, I realized that the IODC console
> is a really bad video console since you can't do cursor addressing.
> I think it would better to use the serial
> driver.

Sure it would, and I encourage everyone with a box using serial console to
clean up drivers/char/serial.c (it already should do everything you want,
it's just not clean) and use that.  The problem is there are boxes with
graphical consoles as well.

> Thoughts?

Where's the patch ;) ?


	Philipp Rumpf
