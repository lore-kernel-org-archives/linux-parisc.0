Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns2.dot.at (dns2.dot.at [212.9.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id D41FD4A19
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Feb 2001 07:39:55 -0700 (MST)
Sender: plattner@dns2.dot.at
Message-ID: <3A7D69B4.896F63D6@dot.at>
Date: Sun, 04 Feb 2001 15:39:48 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: penfold@customware.com.au, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] _working_ rbootd for redhat
References: <200102041048.VAA00309@customware.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello !

For the SCSI I have nothing fixed !
It works out of the box.

I have not sent any patch. I only tried it and it works.
So to all PA-RISC hackers, add the TRAP 18 there in the main stream !!

Ok, wonderful that your machine is also booting that way...

With friendly regards
	Christoph



penfold@customware.com.au wrote:
> 
> Hi there,
> 
> > I had already success with rbootd !
> brilliant.  It's pretty striaghtforward (when you know how!!)
> 
> > Here the kernel I always boot, and I can see the scsi disk !
> 
> excellent! thanks for this.
> What needed fixing to get scsi to work?
> have the patches to fix the scsi been comitted ?
> 
> co-incidently as of about 10 minutes ago I finally got the box to boot! (yay!)
> with a kernel I built after adding the case 18: to trap.c
> 
> Do you know why this has not been comitted?
> I added the extra case 18: to my linux-20010117.tar.gz and it works,
> but I checked out the latest source archive and the fix is not in there.
> 
> thanks again,
> 
> Damian
> penfold@customware.com.au

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
