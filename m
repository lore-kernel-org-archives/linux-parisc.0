Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E7AD4832
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 May 2003 10:43:36 -0600 (MDT)
Message-Id: <200305141643.h4EGhX8X012117@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] more on canonicalize_funcptr_for_compare
To: willy@debian.org (Matthew Wilcox)
Date: Wed, 14 May 2003 12:43:33 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030514134650.GC6859@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at May 14, 2003 02:46:50 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > if ((int) fptr == -1 || (unsigned int) fptr < 4096 || !((int) fptr & 2))
> >     return (unsigned int) fptr;
> > 
> > so, why doesn't that match the second || case and exit?  (gdb
> > disassmbly shows that the code tries to dereference the fptr argument
> > and segfaults)
> 
> Even if this were fixed, it seems like a quality of implementation issue.
> Basically, we're saying that if none of these conditions are met, it's
> safe to dereference this pointer, and I'm sure we'll find people stuffing
> other magic values into pointers.

The magic values were arbitrarily chosen to be the same as under hpux.

> I see three options:
> 
> 1) Continue with this, accepting that some badly written software won't
>    run.

I'm not going to lose sleep on this one.  Obviously, using implementation
dependent features of function pointers is not portable.

> 2) Install a signal handler that handles the segfault (we can lose two of
>    the tests this way, so it'll be faster in the common case)
> 
> 3) Change the ABI.  Make it so we always have unique PLabels.  Recompile
>    anything necessary.

It would be nice to have the 32 and 64 bit ABIs the same in this
respect.  However, this requires non trivial changes to the dynamic
loader and linker.  I'm not sure what the extra overhead would be.
Function pointer comparisons aren't done very often in user code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
