Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 503A74829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Mar 2003 11:50:03 -0700 (MST)
Message-Id: <200303021850.h22Io1wm007358@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: xam@cs.ucc.ie (M. Grabert)
Date: Sun, 2 Mar 2003 13:50:01 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0303020911230.24978-100000@sal.ucc.ie> from "M. Grabert" at Mar 2, 2003 09:24:58 am
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

> Does this also imply that gcc/g++-3.3 will be the new default compiler
> for unstable then? What (kind of) existing broken applications will be
> fixed by recompiling with gcc-3.3?

I can't be very specific as to what's fixed as most of the fixes have
come about from fixing failures in the GCC and binutils testsuites.

The passing of small structs by value mainly affects C++ code.  It's
rather uncommon to pass structs by value in C.  I'm not aware of any
impact on glibc or hpux libc, for example.

The comparison of function pointers in dynamic applications was
broken.  This was found in the binutils testsuite.  It potentially
affects signal handlers, running of initializers and finalizers, etc.
The PA has a rather unique way of handling function pointers.  A function
pointer points to a function descriptor when the plabel bit is set,
otherwise it points directly to the entry point of the function.
The dynamic loader does the initial setup of the function descriptors.
The first call to any function actually transfers to the routine
fixup in the dynamic loader.  It resolves the address of the function
to call.  Function pointer comparison also requires that the function
address be resolved.  In GCC 3.0.4, we just compared the function
descriptor pointers.  However, there can be multiple function decriptors
pointing to the same function.  So, this wasn't reliable.  When the
dynamic loader design was done a couple of years ago, this appears
to have been overlooked.  HP-UX 11 has what they call official procedure
descriptors which are unique.  Because it's not that common to pass
function pointers around from one dynamic object to another and compare
them with pointers from another object, the problem doesn't arise that
frequently.

The dwarf2 EH implementation was done mainly for compatibility with
other linux ports.  It's probably more efficient the using sjlj
exceptions.  Potentially, it's something that ada can use.  I believe
that ACT is using dwarf2 EH in their commercial ada distribution
under hpux.  It may also be useful for gdb.  However, I don't think
there is a difference in GCC testresults.

The pthread design in glibc also is potentially an ABI breaker.

These are the PA specific ABI issues that I recall, but there might
be more.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
