Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99F49482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 06:06:18 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Fast-Wide Diff. SCSI on a 735
Message-ID: <1022759664.3cf612f0449a0@nyepost.start.no>
Date: Thu, 30 May 2002 13:54:24 +0200 (CEST)
From: Andy Walker <squawker@start.no>
Cc: Andy Walker <squawker@start.no>,
	Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
References: <200205291104.AA315359834@mail.centraltx.com> <20020529201334.8C23C482A@dsl2.external.hp.com> <1022707216.3cf54610c5ee8@nyepost.start.no> <20020530081452.GS3471@sleepie.demon.co.uk> <1022748512.3cf5e760c85db@nyepost.start.no> <20020530124826.W10366@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020530124826.W10366@parcelfarce.linux.theplanet.co.uk>
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

Quoting Matthew Wilcox <willy@debian.org>:

> On Thu, May 30, 2002 at 10:48:32AM +0200, Andy Walker wrote:
> > If you remember Richard, I was having all sorts of trouble with a
> Bluefish
> > card in a 725/100 a while back. Think I got the same results in a C110
> too.
> > Recognized as Zalon, but hung up with SCSI timeouts if there was a
> disk
> > attached. HP-UX booted happily off the same controller & disk.
> 
> Hmm.. Bluefish in a 725 should also fail due to non-coherent DMA.
> But a C110 has the ccio chip in it, so Bluefish should work fine.

Okay, don't quote me on the C110 thing. I could be remembering it wrongly.
I'd test it, but my C110 Linux box is in another part of the building
here at work. Maybe test it on the B132 tonight.

While we're talking Bluefish, what is the meaning of the GPI0-3 dip
switches?

-Andy

------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/
