Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA18375
	for <parisc-linux@puffin.external.hp.com>; Sat, 14 Oct 2000 01:49:49 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 14 Oct 2000 07:51:00 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA15659;
	Sat, 14 Oct 2000 18:50:46 +1100
Date: Sat, 14 Oct 2000 18:50:46 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Brian Poole <raj@cerias.purdue.edu>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Troubles following the 'recipe'
In-Reply-To: <Pine.SOL.4.10.10010132356161.22986-100000@basm.cerias.purdue.edu>
Message-ID: <Pine.LNX.4.21.0010141708500.10656-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 14 Oct 2000, Brian Poole wrote:

> find some header files. Specifically it errors out while compiling
> iogetline.c, complaining that it can't find errno.h (from
> ../../../gcc/libio/libioP.h:30:19), _G_config.h 
> (../../../gcc/libio/libio.h:30:23) and string.h 
> (../../../gcc/libio/iogetline.c:27:20). The errors are the same for each
> machine. I downloaded all of the files today, October 13th.

Can you show the command line that failed here?  If you followed the
recipe, then you should have configured gcc with --prefix=$DEST, and have 
$DEST/include/errno.h on your system.

-- 
Linuxcare.  Support for the Revolution.
