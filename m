Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D8514829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Apr 2003 15:07:27 -0700 (MST)
Date: Fri, 4 Apr 2003 17:07:45 -0500
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Applications in 64 bits userspace
Message-ID: <20030404220745.GA32125@systemhalted>
References: <20030404180841.GP7542@systemhalted> <200304041848.h34Imwkv026421@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200304041848.h34Imwkv026421@hiauly1.hia.nrc.ca>
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

> This sounds like a configuration mixup but I would have to see
> a real bug report to be sure.  Regarding disabling fpregs, this
> might not be a good idea.  

It's currently the only solution for getting the rtld code working, since
the floating point code was trying to load a non-existant linkage table pointer...

> Integer multiplication uses the xmpyu
> instruction.  There is millicode support for 32-bit multiplication
> but not for 64-bit multiplication.  On the 64-bit port, loop
> unrolling can cause a multiply instruction to emitted after
> virtual registers are instantiated.  If fpregs are disabled,
> the multiply requires a libcall.  Emitting a libcall, requires
> setting the arg pointer using the virtual outgoing args register.
> There is a small chance that we might not have reserved enough
> space for the outgoing arguments when this is done after virtual
> register instantiation.  You need -nostdlib when linking as
> various functions in libgcc uses the xmpyu instruction.

I'll enable it again for the 64-bit static port and see what happens :)

> > How so? -static and -nostdlib and add all the bits yourself?
> 
> No.  The dynamic loader is still required to resolve some special
> symbols.  I also think the file format is not quite right for
> a static executable.  I'm sure that it would be possible to generate
> a truly static binary but I'm not sure how much work is involved.

Special symbols?

c.
