From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] mmap and GCC precompiled headers
Date: Fri, 16 Jul 2004 12:44:35 -0400 (EDT)
Message-ID: <200407161644.i6GGiao5022969@hiauly1.hia.nrc.ca>
References: <20040716062213.GJ546@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: tausq@debian.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040716062213.GJ546@tausq.org> from "Randolph Chung" at Jul 15,
	2004 11:22:13 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > However, when GCC tries to remap the PCH file to this location, it
> > sometimes fails.  This is currently a fatal error (i.e., it does not
> > fallback as described above).  This needs looking at.  Almost all
> > the libstdc++ tests failed in the last build that I did.  I think if
> > it successfully loads the PCH file and finds that it's not valid,
> > it does fallback.
> 
> do you mean that, when the pch file is created, it was mmaped to some
> address, and that address is written to the file. when the pch file is
> read later on for another compile, it tries to mmap it to the same
> location, and if it cannot, then it fails?

Yes.  I believe that it has to map it to the same address as when
it was created because the file contains pointers to addresses in
the PCH data that otherwise need adjustment.

The initial address is one selected by the kernel in a call to mmap
with START=0.  This is used to generate the PCH file.  Then, when
the program tries to read the pch file using the START address
returned by the kernel when the PCH file was built, the kernel
sometimes doesn't honor this start address.

I'm thinking that the current code should use or fallback to
trying MAP_FIXED when it tries to read the PCH file as it
currently fails with a fatal error if the region doesn't map
successfully.  If it's possible for there to be pages mapped
in the region needed for the PCH data, then the mmap call to
map the PCH file just isn't going to be reliable.  I doubt
that's actually happening.

What I think is happening is that the kernel doesn't try very
hard to honor START without MAP_FIXED.  There may be some subtle
issues dependent on the size of the file.  There is a configure
test in libstdc++ which attempts to see whether to enable
generating a PCH header file for libstdc++.  This started in
GCC 3.4.  The configure test always passes on both linux and
hpux.  However, I recently had on v3 testsuite run in which
all the tests failed because the libstcd++ PCH file couldn't
be read back.

As I noted previously, the downside to using MAP_FIXED is any
previous mapping get replaced.  Replacing a previous mapping
could lead to all kinds of wierd problems.  GCC makes rather
extensive use of mmap, so I can understand why the code tries
to avoid using MAP_FIXED.  It would be a significant overhead
to keep track of all mmapped regions.

> there's obviously a performance penalty, but is this an option (not very
> sure it will work, but i think it might)?
> 
> 1. mmap the file to addr1, where addr1 is any address returned by the
>    kernel
> 2. do a MAP_PRIVATE anonymous mmap to the desired location addr2 (this 
>    is more likely to be honoured by the kernel....)

It already uses MAP_PRIVATE.  Are anonymous mmaps more likely to
honor the START parameter?  If so, then we could use mmap to allocate
the region and just read the data into the region.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
