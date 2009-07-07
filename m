From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: HPPA and Squeeze
Date: Tue, 07 Jul 2009 09:11:17 -0500
Message-ID: <1246975877.4522.9.camel@mulgrave.site>
References: <20090707014710.EF3975022@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Kyle McMartin <kyle@mcmartin.ca>, carlos@systemhalted.org,
	randolph@tausq.org, deller@gmx.de, kurt@roeckx.be,
	pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090707014710.EF3975022@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2009-07-06 at 21:47 -0400, John David Anglin wrote:
> > If I remember correctly, there's still some issues with the L2 cache on
> > pa8800 that we haven't quite bothered to work out yet, since it's "good
> > enough" for now. James probably knows more. It would be interesting to
> > see if you could reproduce it with a UP 64-bit kernel on your C3750 to
> > discount the L2 problems.
> 
> Googling, I see Grant had trouble with RCU_TORTURE_TEST=y.  Probably,
> I should test current kernel to see if the problem is still present.
> 
> I guess you are referring to this change:
> http://fossplanet.com/linux.debian.devel.kernel.cvs/thread-4378354-r7141-patches/
> 
> I'm thinking we must be missing a flush...  Maybe in clear_user_page
> as for copy_user_page?

Clear user page is very clever and doesn't need a flush.  What it does
is clear the page through the users cache rather than the kernel's ...
what it actually does is place zeros in the cache above the physical
page, so the user can only access the zeros ... they eventually get
cleaned back to the page as the cache empties.

> Do the problematic debian buildd machines have pa8800/pa8900 processors?

No boxes outside of the cupertino test ring and a few giveaways (you,
kyle and t-bone, I think) have pa88/8900 cpus.

> My sense is that some change (probably to the core memory management
> code) made the coherence issue worse post 2.6.22.x.

So if I characterise the problem you think you're seeing: on mmap of a
file at a memory location to be determined by the kernel, a sequential
set of reads of the mapped location eventually turns up a zero where
there should be data?  Yes, it does sound like a caching issue.

James


