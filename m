Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA13687
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 09:44:58 -0700
Message-Id: <200101241650.IAA20897@milano.cup.hp.com>
To: Christoph Plattner <christoph.plattner@alcatel.at>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] One more step: Interruption (trap) 18 on 9000/720 
In-reply-to: Your message of "Wed, 24 Jan 2001 10:54:19 PST."
             <3A6EA64B.5875D07A@alcatel.at>
Date: Wed, 24 Jan 2001 08:50:12 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Christoph Plattner wrote:
> Further, can you tell me, how to use and where I can find
> the kernel debugger stuff.

There is no kernel debugger (yet). I started working on one last year
based on "KWDB" from HPUX. I've added the kernel hooks (CONFIG_KWDB).
But I (a) didn't get it working and (b) didn't get permission to publish
the KWDB base. My advice is for someone to take the SGI KDB and make it
work for parisc-linux and changing CONFIG_KWDB to CONFIG_KDB.

...
> And now a very important question:
> ---------------------------------
> 
> You seem to be the right man asking this. I also have an
> E55 server (9000/856) with those propriatary HP interfaces.
> For me the SCSI controller and the 8-port serial multiplxer
> (used for serial console on port-0) are the important
> key points. Is there no possibility to get them running ??
> Is there really no documentation, etc...

This is explained in the FAQ or HWDB "introduction" someplace.
Someone *in* HP has to care enough to review the documentation
and get it past the lawyers. I don't. Search the parisc-linux
mail archive for "SPIFI" if you want more...

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
