Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A1C54829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 17:02:33 -0700 (MST)
Message-Id: <200304040002.h3402U4u020233@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Applications in 64 bits userspace
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Thu, 3 Apr 2003 19:02:29 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, rodrigo@tteng.com.br,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030403225228.GI7542@systemhalted> from "Carlos O'Donell" at Apr 3, 2003 05:52:28 pm
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

> Why was a 64-bit linker written for HPUX, couldn't the normal HPUX
> linker have been used?

I can't answer that.  Presumably, HP funded the development.  Possibly,
they were considering using the GNU linker but then decided to go with
a different port.  I do most of my 64-bit testing now with the HPUX
linker.  There were some rough edges in using the HP linker with GCC
a few months ago but these have been resolved.

The HP linker is not compliant with the sysv ELF ABI in its handling
of weak symbols.  Undefined weak symbols are supposed to resolve
to a value of 0, and the linker is not supposed to search archive
libraries for undefined weaks.  I tried hacking GNU ld to see if
this could be fixed but this isn't possible since the dynamic loader
has the same behavior.  Basically, weak symbols appear to behave
like secondary definition symbols with the SOM runtime.  The lack
of proper weak support impacts GCC thread support.

HP doesn't support DT_INIT and DT_FINI.  They also used a non
standard implementation for DT_ARRAY_INIT and DT_ARRAY_FINI.
Their section flags for these are non compliant and we needed an
assembler hack to handle initializers and finalizers.

Finally, the HP linker doesn't know about gnu linkonce sections but
I haven't hit any situation where it causes a functional problem.
Probably, it only affect program startup time.

> As for function descriptors, I think that I'll be reworking that code 
> (glibc) in the next few months.... following somewhat what H.J.Lu 
> has suggested and ia64 / PowerPC64 implement. This should make things 
> easier to work with.

I presume you are talking about the implementation for lazy linking.
I know the ia64 implementation of function descriptors differs from
what is done for the 32-bit hppa ports.

> Not true 64-bit since leaving the kernel doesn't mean the processor
> stays in wide mode. I need to make some more kernel patches to
> enable the start of a static 64-bit userspace.

Ok.  I should note that the current 64-bit GNU ld doesn't know how
to do a true static link.

> I think that before a 64-bit userspace gets started, I'm going to
> be working at getting glibc to pass "make -k check" without failure,
> followed by lots of TLS work so we keep up with the changes in glibc
> for our 32-bit userspace :)

I certainly agree with that plan.  64-bit code is always going to
be slower than 32-bit code, so it shouldn't be used unless really
needed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
