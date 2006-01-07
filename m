From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-hppa64 compilers
Date: Sat, 7 Jan 2006 11:55:20 -0500 (EST)
Message-ID: <200601071655.k07GtKmF019459__38105.8220672005$1416623980$gmane$org@hiauly1.hia.nrc.ca>
References: <200601071606.24320.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200601071606.24320.deller@gmx.de> from "Helge Deller" at Jan 7, 2006 04:06:22 pm
List-ID: <linux-parisc.vger.kernel.org>

> On Friday 06 January 2006 20:27, Kyle McMartin wrote:
> > On Fri, Jan 06, 2006 at 03:54:40AM +0100, Matthias Klose wrote:
> > > Which gcc-X.Y-hppa64 variants are still needed for Debian sid/etch?
> > > Currently compilers are built for 3.3, 3.4, 4.0 and 4.1, the latter
> > > one for experimental. Is it time to drop some of these?
> > >
> > 
> > Please don't remove gcc-3.4-hppa64. I use it on many machines
> > for kernel builds. 3.3 and 4.0 can go, imnsho, but I'll defer to the
> > experts. 
> 
> I'm for removing 3.3 and 4.0 as well.

Personally, I would take 4.0 over 4.1 at the moment.  Although 4.1
is getting there, it's taking more time than expected to eliminate
most of the regressions.  For example, the ada testsuite is pretty
clean in 4.0, but there are a lot of problems in 4.1.  I'm aware of
one optimization issue affecting floating point code.  This problem
is present in all versions, but exposed by the "improvements" in 4.x.

The newer GCC versions require more memory and are slower.  You might
find that 4.x is too slow on PA 1.1 machines.  The GCC build and check
time on a 735 is up to about five days.

It takes quite a bit of time to find and fix bugs.  For example, there
are still a number of libc problems caused by the move to 4.0.  So, I
wouldn't rush to use the newer versions unless they fix a crucial bug.

> BTW, what does it take to drop hppa64-compiler in favour of a "-m64" compiler flag (as on x86_64) to hppa-gcc as well ?

Quite a bit of work is involved.  Some of the work involves adding new
target hooks to the core code.  The problem is that there are different
sets of macro defines for 32 bit/64 bit/gas/HP as/GNU ld/HP ld/etc and these
conditionally change the behavior of other macros defined in the core code.
In the past, Jeff Law stated that this wasn't worth doing.  At the moment,
my primary focus is on fixing bugs and regressions, and getting libjava
working under hpux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
