Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23B1B4A1C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 16:55:41 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA19117;
	Sat, 17 Mar 2001 10:52:45 +1100
Date: Sat, 17 Mar 2001 10:52:45 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <matthew@wil.cx>, alan_meyer@hp.com,
	taggart@carmen.fc.hp.com, randolph@tausq.org, bdale@gag.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: new debs built, c++ is broken
In-Reply-To: <200103162007.PAA18059@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0103171012070.4658-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 16 Mar 2001, John David Anglin wrote:

> You might have to make a case but I note the following recent patch:
> 
> 2001-03-15  Steve Ellcey  <sje@cup.hp.com>

Aye, but isn't ia64 "flavour of the month"?  :-)

As far as I can see, the difficulties with getting hppa-linux in are:

a) In order to support hppa-linux cleanly without duplicating lots on
header file defines, I split out various things in existing config/pa
headers.  That means there is potential for HPUX breakage.  HPUX support
doesn't break, but that's almost beside the point.

b) Some patches I made really attacked symptoms rather than causes.  I'd
need to remove these before support as a whole can go in.  Of course, we'd
need to be sure that our compiler isn't broken if I remove the bandaids.

c) Having time to do it.

Alan
-- 
Linuxcare
