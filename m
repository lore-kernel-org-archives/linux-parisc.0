Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA01361
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Nov 2000 00:31:12 -0700
Content-Type: text/plain;
  charset="iso8859-1"
From: Helge Deller <deller@gmx.de>
To: bame@riverrock.org, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] kernel merge
Date: Mon, 13 Nov 2000 08:32:54 +0100
References: <m13v9Eo-001Vp3C@chalet>
In-Reply-To: <m13v9Eo-001Vp3C@chalet>
MIME-Version: 1.0
Message-Id: <00111308325401.00396@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Monday 13 November 2000 03:20, bame@riverrock.org wrote:
> = 
> = Helge noticed SCSI fails (B160L, 712, I think it's ok on c3k)
> = after the -test10 merge.
> 
> Fixed.
> 
> >From test6 to test10 the SCSI host registration method changed.
> Updated sim700.c, lasi7xx.h, zalon7xx.h
> 
> 	-P

Thanks Paul,

sim700 (53c710) now works again, but the second built-in controller (ncr/sym 
53c8xx) still doesn't.

Greetings,

	Helge
