Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA19758
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 14:13:42 -0700
Sender: plattner@dns2.dot.at
Message-ID: <3A6F45A4.2613587@dot.at>
Date: Wed, 24 Jan 2001 22:14:12 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: Christoph Plattner <christoph.plattner@alcatel.at>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] One more step: Interruption (trap) 18 on 9000/720
References: <200101241650.IAA20897@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello, again.

What does this `SPIFI' mean?
Is this a name of a person, or a technical expression, ... ?

I read something at the E55 of "undocumented drivers" and so
on, but I hoped somebody has a solution, and I myself am interested
in helping writing drivers for that E55, as I really want to use
it inclusive all 8 serial ports and SCSI !

With friendly regards
	Christoph




Grant Grundler wrote:
> 
> Christoph Plattner wrote:
> > Further, can you tell me, how to use and where I can find
> > the kernel debugger stuff.
> 
> There is no kernel debugger (yet). I started working on one last year
> based on "KWDB" from HPUX. I've added the kernel hooks (CONFIG_KWDB).
> But I (a) didn't get it working and (b) didn't get permission to publish
> the KWDB base. My advice is for someone to take the SGI KDB and make it
> work for parisc-linux and changing CONFIG_KWDB to CONFIG_KDB.
> 
> ...
> > And now a very important question:
> > ---------------------------------
> >
> > You seem to be the right man asking this. I also have an
> > E55 server (9000/856) with those propriatary HP interfaces.
> > For me the SCSI controller and the 8-port serial multiplxer
> > (used for serial console on port-0) are the important
> > key points. Is there no possibility to get them running ??
> > Is there really no documentation, etc...
> 
> This is explained in the FAQ or HWDB "introduction" someplace.
> Someone *in* HP has to care enough to review the documentation
> and get it past the lawyers. I don't. Search the parisc-linux
> mail archive for "SPIFI" if you want more...
> 
> grant
> 
> Grant Grundler
> Unix Systems Enablement Lab
> +1.408.447.7253
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
