Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90EAB482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Jun 2001 11:51:16 -0600 (MDT)
Message-Id: <200106261750.LAA16595@puffin.external.hp.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP9000 - 822 - a gift? 
In-Reply-To: Your message of "Tue, 26 Jun 2001 00:36:02 MDT."
             <200106260636.AAA12924@udlkern.fc.hp.com>
Date: Tue, 26 Jun 2001 11:50:23 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

John Marvin wrote:
...
> > Not linux, but HP-UX should work.  I can't recall if 11.00
> > will run on it, but certainly earlier versions will.
> 
> As far as HP-UX goes, there is a difference between whether or not it
> works and whether or not it is officially supported.  When HP drops
> official support it just means that the engineers are free to make design
> decisions on newer HP-UX releases that don't need to take into account
> support of the older boxes.  We don't have a policy of removing the old
> code (see bloat reference below :-)), although that usually happens over
> time as the "owners" of various files modify them.

Yup - I see it the same way.

> For example, I believe
> that 11.0 dropped official support for PARISC 1.1a cpu's,

AFAIK, 712's are officially supported on 11.0 and 11.11.

> but I believe it
> still worked.  Official support for PARISC 1.0 cpu's was dropped at an
> earlier date, but I don't know when HP-UX might have stopped working on
> those earlier machines (for all I know it may still work).

I think it was the same time that CIO bus support was dropped since
both (CPU/Bus type) was the same class of machines.

> However, HP-UX, in its attempt to try to meet required features for a wide
> variety of customers, continues to bloat.  The size increase from 9.0 to
> 10.x and from 10.x to 11.x has been significant.  So, if you really want
> to get that 822 running reasonably well, I'd try to get as old a version
> of HP-UX that you can.  A 9.0 based release will probably give you the
> best compromise between features and size.

Again John is right. I'd reccomend 9.04 since that had the most
support for the 9.x releases.

> John Marvin
> jsm@fc.hp.com
> 
> P.S.  Perhaps there are other ways you can use that 822.  Do you own a
> boat? :-)

The same thought crossed my mind. And we probably still have a
few 712's or 715's to give away to folks interested in doing
developement - either applications or kernel.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
