Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from merulo.debian.org (merulo.external.hp.com [192.25.206.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id BEFBC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 10:44:11 -0600 (MDT)
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by winfree.gag.com (Postfix) with ESMTP id 8835E24F03
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 10:44:09 -0600 (MDT)
Sender: bdale@rover.gag.com
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 712/60 boots fine
References: <andreas@malcolm.in-chemnitz.de>
	<200109211603.KAA01633@puffin.external.hp.com>
From: Bdale Garbee <bdale@gag.com>
Date: Fri, 21 Sep 2001 10:42:51 -0600
In-Reply-To: <200109211603.KAA01633@puffin.external.hp.com>
 (grundler@puffin.external.hp.com's message of "21 Sep 2001 10:06:08
 -0600")
Message-ID: <87g09gpkac.fsf@rover.gag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

grundler@puffin.external.hp.com (Grant Grundler) writes:

> =?iso-8859-1?Q?Andreas_H=E4rtel?= wrote:
> > It is difficult to understand for a newbie, that PALO needs file system type
>> 'F0' but this type is unknown by fdisk.
>> Or the 2. mistake, the partition where vmlinux is located must be lower or
>> equal 2 GByte.
>
> Both issues are documented in the palo documentation.

Clearly, then, "just" having them documented is insufficient.

I noted when doing an install from the 0.9.2 CD myself the other day that we
paint a splash screen before disk partitioning explaining that there needs to
be a palo partition, but that splash screen doesn't mention the 2G issue.  
Perhaps it could be updated with some additional text?

Also, since cfdisk is the default partitioning tool called by the Debian install
process, if the definition of partition type F0 isn't already part of the 
list of partition types displayed by cfdisk when you pick the command to change
the partition type, perhaps it should get added?  It might well be disconcerting
to a new user without much Debian or hppa experience to have to type in a 
partition type that's not on the menu.

I think those two steps would improve the probability that folks are successful
installing.

Finally, it sounds as though the user-space palo executable is not checking all
of these constraints to warn the user about problems, though I haven't tried to
test that and so don't really know what it does or does not do.  It certainly
seems prudent for palo to do so... and give the user some guidance through
appropriate warning/error text about what to do to fix the problem.

In summary, I think we ought to be thinking about how to help the user get this
right beyond "just" making sure the constraints are documented.

Bdale
