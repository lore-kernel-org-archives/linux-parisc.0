From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: binutils change break glibc build
Date: Fri, 18 Feb 2011 09:39:01 -0500 (EST)
Message-ID: <20110218143901.B1ADB4E51@hiauly1.hia.nrc.ca>
References: <AANLkTikL=ANnoEE6=orNbqkinW4-pEngWKh6UkBLWx5v@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	James.Bottomley@hansenpartnership.com, linux-parisc@vger.kernel.org
To: vapier@gentoo.org (Mike Frysinger)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTikL=ANnoEE6=orNbqkinW4-pEngWKh6UkBLWx5v@mail.gmail.com> from "Mike Frysinger" at Feb 18, 2011 00:32:36 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, Feb 16, 2011 at 8:09 PM, John David Anglin wrote:
> > On Wed, 16 Feb 2011, John David Anglin wrote:
> >> I would like to apply the following binutils change to align data
> >> segments to a page boundary. =A0However, it breaks building glibc.
> >> Problem occurs in call_init trying to run constructors for new
> >> libc.so.6.
> >
> > It's probably not a glibc issue:
> >
> > /home2/dave/debian/glibc/eglibc-2.11.2/build-tree/hppa-libc/libc.so.6: =
> =A0 =A0 file
> > format elf32-hppa-linux
> >
> > Contents of section .init_array:
> > =A0159008 ffffffff 0015bee2 00000000 =A0 =A0 =A0 =A0 =A0 ............
> 
> glibc-2.12 and earlier (and perhaps 2.12.[12] too) are known to be
> miscompiled by binutils versions newer than 2.21.50.xxx.  the issue
> has been fixed in glibc-2.13 though ...
> 
> http://bugs.gentoo.org/351177

While this is probably the same issue, there is no debugging of the segv
in the above bug report or in the referenced bugzilla report:
http://sourceware.org/bugzilla/show_bug.cgi?id=12379

I filed this report last night:
http://sourceware.org/bugzilla/show_bug.cgi?id=12499

My analysis indicates the segv is a binutils issue.  It was likely
introduced by the following change:

2010-12-15  H.J. Lu  <hongjiu.lu@intel.com>

        * Makefile.am (GENSCRIPTS): Add @enable_initfini_array@.

	* NEWS: Mention SORT_BY_INIT_PRIORITY.

	* configure.in: Add AC_CANONICAL_BUILD.
	Add --enable-initfini-array.

	* genscripts.sh (ENABLE_INITFINI_ARRAY): New.
	...

Binutils should not merge the special function pointers used to mark
the start and end of the .ctors/.dtors lists.  This could be tested
for in libc, but this is inefficient.  On architectures that use
function descriptors, function pointer comparisons are messy.  Do
we want to call the infamous cffc in the dynamic loader?  Casts of
function pointers to integer types are implementation defined and
pointer sizes can vary.  So, the simple hack could break.

In my opinion, binutils should be fixed to work with old glibc
versions.  There is a work around in my binutils PR.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
