Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33F984829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 15:52:54 -0700 (MST)
Date: Thu, 3 Apr 2003 17:52:28 -0500
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>, rodrigo@tteng.com.br,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Applications in 64 bits userspace
Message-ID: <20030403225228.GI7542@systemhalted>
References: <20030403184513.GH29376@parcelfarce.linux.theplanet.co.uk> <200304032219.h33MJY6B020051@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200304032219.h33MJY6B020051@hiauly1.hia.nrc.ca>
From: Carlos O'Donell <carlos@baldric.uwo.ca>
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

John,

> With respect to the toolchain, you should be aware that there are
> two different GNU linkers.  The 64-bit linker was designed for HP-UX
> operation and was written more or less from scratch.  The 32-bit
> linker was ported I believe from the i386 port and is better
> suited to linux use.  It has had more testing.  If the 32-bit linker
> is ported to 64 bits, you will have to deal with the different
> handling of function descriptors (OPDs).  This is also an issue
> for the parisc specific code in glibc used for the dynamic loader.
> Code to handle various 64-bit relocations would need to be added
> to the 32-bit linker.  Management of stub groups might also be an
> issue although the 32-bit linker currently does a better job of this.
 
Why was a 64-bit linker written for HPUX, couldn't the normal HPUX
linker have been used?

As for function descriptors, I think that I'll be reworking that code 
(glibc) in the next few months.... following somewhat what H.J.Lu 
has suggested and ia64 / PowerPC64 implement. This should make things 
easier to work with.

> The current 64-bit linker is broken in a number of ways.  These
> problems might get fixed in the coming months but it would be nice 
> if we could dispense with having two different linkers.  If
> the current 64-bit linker is used for linux, then the problems
> with link-once sections, symbol overloading, symbol visibility,
> PHDRs, static links, etc., will need fixing.  Fixing these problems
> could be 2-3 months work, or more, for someone who knows their way
> around the linker.

I think extending the 32-bit linker would be a better use of resources. 

> What you need to do is to look at the parisc specific code in the
> kernel, binutils and glibc.  Carlos O'Donell <carlos@baldric.uwo.ca>
> did some hacking a few months ago to try to get a simple static linked
> application to run in 64-bit mode.

Not true 64-bit since leaving the kernel doesn't mean the processor
stays in wide mode. I need to make some more kernel patches to
enable the start of a static 64-bit userspace.

I've pulled glibc into cvs.parisc-linux.org again, and I'll be 
updating frequently and championing our patches back to libc-alpha 
in the next month.

I think that before a 64-bit userspace gets started, I'm going to
be working at getting glibc to pass "make -k check" without failure,
followed by lots of TLS work so we keep up with the changes in glibc
for our 32-bit userspace :)

c.
