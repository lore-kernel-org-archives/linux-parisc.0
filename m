Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 562FF482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 03:00:58 -0600 (MDT)
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] Fast-Wide Diff. SCSI on a 735
Message-ID: <1022748512.3cf5e760c85db@nyepost.start.no>
Date: Thu, 30 May 2002 10:48:32 +0200 (CEST)
From: Andy Walker <squawker@start.no>
Cc: parisc-linux@lists.parisc-linux.org
References: <200205291104.AA315359834@mail.centraltx.com> <20020529201334.8C23C482A@dsl2.external.hp.com> <1022707216.3cf54610c5ee8@nyepost.start.no> <20020530081452.GS3471@sleepie.demon.co.uk>
In-Reply-To: <20020530081452.GS3471@sleepie.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Quoting Richard Hirst <rhirst@linuxcare.com>:
> 
> Specs for Outfield are available now, look for hardball_ers.pdf on the
> web site.

Actually I saw that - so I'll print 'em out and start digesting the info
this evening. Haven't hacked on a SCSI driver since the earliest 1.1.x
BusLogic days, but I can at least try to understand what's going on.

> Other 53c720 interfaces (e.g. bluefish) are supported via the
> ncr53c8xx.c driver, but that doesn't work for outfield because the 735
> is not cache coherent.

If you remember Richard, I was having all sorts of trouble with a Bluefish
card in a 725/100 a while back. Think I got the same results in a C110 too.
Recognized as Zalon, but hung up with SCSI timeouts if there was a disk
attached. HP-UX booted happily off the same controller & disk.

> My next idea was to add basic 53c720 support to the 53c700 driver, as
> that works older hardware.  Ryan was interested in looking at that a while
> back, but I don't know what happened.  My excuse is that I don't have 735
> h/w to test on so it is no fun - but that's a poor excuse really as I could
> use my bluefish card to get 53c700 working with 53c720.
> 
> 53c700.c would drive the 53c720 chip in 53c700 mode, so would be
> relatively low performance (more interrupts than you would need if you
> made the most of the 53c720 features), and it would be 8 bit only.
> Those issues could perhaps be fixed in time, and it would be better
> than nothing, anyway.
> 
> Richard

Well, I've got a 735, a Bluefish card, a B132L with Zalon onboard, and no
current hacking project at home. Unfortunately I also have a wife, two kids
and a reasonable social life, so no wild promises ;-)

-Andy

------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/
