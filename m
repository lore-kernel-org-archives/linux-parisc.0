Return-Path: <rollei@tiscalinet.it>
Received: from smtp0.libero.it (smtp0.libero.it [193.70.192.33])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EBFB491F
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 10:08:34 -0700 (MST)
Received: from tiscalinet.it (151.41.157.136) by smtp0.libero.it
	(7.0.020-DD01) (authenticated as zuse@libero.it)
	id 401D53C7009154A5 for parisc-linux@lists.parisc-linux.org;
	Sun, 22 Feb 2004 18:08:33 +0100
Sender: multix@dsl2.external.hp.com
Message-ID: <4038E400.427F0528@tiscalinet.it>
Date: Sun, 22 Feb 2004 18:16:48 +0100
From: Riccardo <rollei@tiscalinet.it>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Hanging with kernels >= 2.4.22
References: <20040218235225.GA1623@calypso>	<20040219062907.GC13916@colo.lackof.org>	<20040221075849.GA1642@calypso>
	<20040221170508.GB14198@baldric.uwo.ca>
	<4038C0B0.F7D1708A@tiscalinet.it> <4038CB15.5060507@tiscali.be>
Content-Type: text/plain; charset=us-ascii
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

pre-scriptum: I am sending this to the list because when trying to send
an email directly to Joel I get his MTA answering I have invalid headers
(tried two times)
Joel Soete wrote:

> > I would set the tag queue as default to 8 and not to 16, to stay on the
> > safe side. Couldn't it be made configurable from the kernel
> > configuration menu?
> >
> Good idea.
It is not me that can make changes there, but it seems to me that 8 is
reasonable. Also, a kernel config option would make this parameter
obvious to everybody. I had only a small preformance decrease from 16 to
8 tags (well, disk IO sucks anyway under linux-pa and my old box). While
2 is pure sufference :)

> And you are sure that scsi id are well different and scsi chain well terminated, I supose.
Yes, the internal chain is terminated with the original HP terminator
and I removed the disk internal ones.
In fact substituing the original HP disk with another one removed the
problem (strangely enough, with the older IBM drive as a second drive I
had sometimes freezes but this problem did not appear).


> hmm, I leaved the same experience but with two external disks of exactly the same type (same supplier: hp, same manufactor:
> seagate, same product reference) but with a small firmware revision difference. Unfortunately, this pb only occured under linux
> :(. Now the disk is broken again; so no chance to test it with more recent kernel 2.4 or 2.6 :(

I used a failry recent kernel for there test, I believe 2.4.23.

The scsi code doesn't seem to be so stable and performing as compared to
hp-ux....

-Ric
