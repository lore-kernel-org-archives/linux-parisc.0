Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76FFB4852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 10:05:50 -0700 (MST)
Date: Sat, 21 Feb 2004 12:05:09 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] Hanging with kernels >= 2.4.22
Message-ID: <20040221170508.GB14198@baldric.uwo.ca>
References: <20040218235225.GA1623@calypso>
	<20040219062907.GC13916@colo.lackof.org>
	<20040221075849.GA1642@calypso>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040221075849.GA1642@calypso>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Thanks! Changing NCR_700_MAX_TAGS to 1 in drivers/scsi/53c700.h did the
> trick. Will I now have poor disk performance? If so, might I get away
> with setting it to something higher, like 2 or 4, maybe?

I could never run IO stably at anything higher than 1. The drives don't
seem to handle it properly, the error recovery mechanisms seem less
than perfect, and the box just hangs.
 
> I've not heard of tagged command queues before - the idea seems to be to
> transfer data to the drive as early as possible, but make decisions as
> to what should be written first at a later stage. Is that correct?
> 
> http://lists.parisc-linux.org/pipermail/parisc-linux/2002-February/015465.html
> says that no tagged queue is a bad thing. Why is that?

You misunderstand, I *removed* the tag-queue code from the driver and
*that* was bad. We're only asking that you reduce the queue size to 1 or
2. Infact higher numbers might be okay, but 16 is definately too high.

> That's a good idea. Where should I send the entry? Here?

You can checkout the entire website via CVS from cvs.parisc-linux.org,
there are CVS instructions on www.parisc-linux.org. The CVS file your
are particularly interested in is:

http://cvs.parisc-linux.org/web/src/faq/index.x?rev=1.40&content-type=text/vnd.viewcvs-markup

Generate a diff against that file, which includes your new entry, and 
voila you've added an entry to the FAQ, praise will rain down on you,
and you will never be forgotten :)

Many thanks,

c.
