Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 607904830
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 May 2002 11:47:45 -0600 (MDT)
Message-Id: <200205041747.g44Hlc70026886@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.? compiler for hppa (3.1, 3.1+dwarf2, 3.2cvs20020429?)
To: doko@cs.tu-berlin.de (Matthias Klose)
Date: Sat, 4 May 2002 13:47:37 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org
In-Reply-To: <15571.50195.280071.792305@gargle.gargle.HOWL> from "Matthias Klose" at May 4, 2002 01:20:51 pm
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

> While preparing gcc-3.1 packages I noticed many eh-related regressions
> fixed in the trunk, when dwarf2 support was added. With Dave's
> guidance I made a diff of the pa subdirectory from the trunk and
> applied it to the branch. Although many FAILS are gone, there are some
> new (diff below).

In general, option b has much better c++ results than a).  The c++
test results are essentially identical to those with 3.2.  However,
compared to the results that I have been posting for 3.2, we have
the following new failures:

gcc.c-torture/execute/ieee/rbug.c

g77.f-torture/execute/19990313-[0-3].f

20_util/allocator_members.cc execution test
22_locale/codecvt_members_char_char.cc execution test
22_locale/codecvt_members_wchar_t_char.cc execution test
22_locale/ctor_copy_dtor.cc execution test
22_locale/ctype_members_wchar_t.cc execution test
27_io/ostream_inserter_arith.cc execution test

It would probably be useful to compare test results for b and c.  It may
be that some of the above are glibc or system problems.  I am fairly
certain c will build on all platforms.  However, I know that there is
one c regression under hppa near the beginning of march.  There is another
at the beginning of May.

As a matter of release philosophy, I don't much like hybrids.  Option
b adds another permutation to maintain even if the new c++ capabilities
are very tempting.  My focus will be 3.2.  3.1 will only get small bug
fixes.  If we keep to the main releases, it much easier to verify and
resolve bugs.

So, I would say use a as the default.  This is the conservative choice
and well tested across a broad range of systems.  Option a can easily be
used to build c.  Maybe you could include c as well for experimental
development and building c++ packages that need the dw2 support under
parisc-linux.

> I would like to get feedback, on which alternative to base the gcc-3.1
> packages:
> 
> a) 3.1 as to be released (without dwarf2 support)
> b) 3.1 + dwarf2 support
> c) 3.2 CVS 20020429 plus/minus patches
> 
> Constraints: Make gcc-3.1 the default compiler for all Debian
> architectures in the near future, provided it builds on all of them.
> 
> a) is the default option to go with.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
