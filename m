Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0E1F482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 13:43:46 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 15rljy-0001WV-00
	for parisc-linux@lists.parisc-linux.org; Thu, 11 Oct 2001 21:43:34 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15rlhj-0007d2-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 21:41:15 +0200
Date: Thu, 11 Oct 2001 21:41:15 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCXS fixes
Message-ID: <20011011214115.A29321@dogbert.localdomain>
References: <200110030832.CAA10917@udlkern.fc.hp.com> <20011006104130.A18068@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011006104130.A18068@dogbert.localdomain>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

Hello parisc,

Has anyone given any thought to how one would go about solving the
problem outlined below? I am quite anxious to get my 720/50 working
properly. :-)

Keep up the good work, hackers!

Regards,

Albert

On Sat, 06 Oct 2001, Albert Strasheim wrote:

> Hello,
> 
> On Wed, 03 Oct 2001, John Marvin wrote:
> 
> <snip>
> 
> > However, ls still hangs randomly (actually it is not random, it depends on
> > which directory the ls is done in).  It gets stuck in a ldcw loop due to
> > the lock word not being 16 byte aligned.  The problem is that we fixed the
> > alignment problems for static and dynamic allocations, but the align
> > attribute is ignored for automatic (stack) allocations. Note that
> > although ldcw requires 16 byte alignment for correct function, it does
> > not cause an unaligned fault if the address is not aligned, it just
> > doesn't work correctly!
> > 
> > Here are some suggested fixes:
> > 
> >     1) Fix the compiler to honor the aligned attribute for stack
> >     allocations. I'm not sure how difficult this would be. I'm
> >     not a compiler person, so someone else would have to do this.
> >     I would guess that this problem is in the machine independent
> >     part of the compiler. I'm not sure whether or not it would
> >     be considered a bug. It might be worth writing a test for
> >     the 386 version of gcc, and if it fails, report the "bug" and
> >     see what happens ...
> > 
> >     2) Change the lock structure to have 4 contiguous lock words, each
> >     initialized to 1.  Then the lock code can round the address up to the
> >     nearest 16 byte aligned address and use that for the semaphore.  If we
> >     choose this solution we can just get rid of the aligned attribute,
> >     since it would no longer serve any purpose.
> 
> As anyone decided on what do here? What would the test that John
> mentions entail? How difficult is the second solution to implement?
> 
> Regards,
> 
> Albert
