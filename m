Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost (monolith.eradicator.org [64.81.135.24])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFDA94A19
	for <parisc-linux@parisc-linux.org>; Fri,  9 Mar 2001 10:12:40 -0700 (MST)
To: Bruno IGLESIAS <iglesiab@esiee.fr>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Bug 72 ( Floating point problems )
References: <20010309164348.93224D15C5@mail.esiee.fr>
From: David Huggins-Daines <dhd@eradicator.org>
Date: 09 Mar 2001 12:11:59 -0500
In-Reply-To: Bruno IGLESIAS's message of "Fri, 09 Mar 2001 17:43:48 +0000"
Message-ID: <87g0gmzx28.fsf@monolith.eradicator.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Bruno IGLESIAS <iglesiab@esiee.fr> writes:

> 	The test of the Seti@client reveals lots of problems. When the       
> calculation doesn't result in an illegal instruction (cf A500), the   
> results are false. The kernel running was compiled on a B132L and the 
> xc seems to be an old one. We now try with an newer kernel and xc.    

That's likely to be either:

 1) a compiler bug.
 2) a problem with saving/restoring floating point state in the kernel.
 3) a consequence of the mostly non-existant floating point completion
    handler in the kernel. (see FIXME in arch/parisc/kernel/traps.c)

...in increasing order of likeliness.

A whole bunch of instructions are supposed to be trapped and emulated
in software, most notably the rounding instructions.  We catch
co-processor traps and handle exceptions, but we don't (yet) emulate
anything, so the results of these instructions are undefined.

Part of the problem is that the details of which instructions are to
be emulated are not in the architecture manuals, but rather in the
chip manuals, and we only have these for the 7100 and 7300LC, as far
as I know.

What probably needs to be done is someone needs to take small pieces
of numeric code and track down all the operations that are throwing
traps or giving incorrect results, and fix them all individually :(

> 	The calculation time for the test is 56 hours. Under HPUX, it is     
> about 30 hours.                                                       

That's probably to be expected for floating-point code.  HP/UX has
lots of extra, super-optimized millicode to handle various low-level
FP operations.

-- 
David Huggins-Daines              -                     dhd@pobox.com
                      http://www.pobox.com/~dhd/
