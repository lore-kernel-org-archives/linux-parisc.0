Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA11322
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 09:40:26 -0600
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m11eKL1-0027XWC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Thu, 21 Oct 1999 16:41:11 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Date: Thu, 21 Oct 1999 17:13:23 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Magne_=D8stlyngen?= <magne@spacetec.no>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] So you wanna get to a prompt, eh?
Message-ID: <19991021171323.A17549@alpha.franken.de>
References: <Pine.LNX.4.10.9910191607110.10378-100000@localhost.localdomain> <380EEA0B.F5E469DB@spacetec.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: =?iso-8859-1?Q?=3C380EEA0B=2EF5E469DB=40spacetec=2Eno=3E=3B_from_Magne_?=
 =?iso-8859-1?Q?=D8stlyngen_on_Thu=2C_Oct_21=2C_1999_at_12:25:15PM_+0200?=
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 21, 1999 at 12:25:15PM +0200, Magne Østlyngen wrote:
> Of course, I don't get further than 'Transferring control to kernel'..
> :(
> I thought I had a 715, but no, it was a 710 (Bushmaster), and that seems
> to make a big difference.

the cvs version from friday did only work on the A-class for me. My 715/33
panic very early in the boot process. I only did a quick look and I guess
it's caused by the serial console changes. I've no idea whether this is 
already fixed.

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
