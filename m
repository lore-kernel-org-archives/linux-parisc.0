Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 73BA0482E
	for <parisc-linux@parisc-linux.org>; Mon,  4 Aug 2003 10:08:12 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h74G82I22159;
	Mon, 4 Aug 2003 12:08:02 -0400
Subject: Re: [parisc-linux] backport bitops.h stuff
From: James Bottomley <James.Bottomley@steeleye.com>
To: LaMont Jones <lamont@hp.com>
Cc: Joel Soete <jsoe0708@tiscali.be>, parisc-linux@parisc-linux.org
In-Reply-To: <20030804151449.GS18508@security.hp.com>
References: <20030801171426.GA18508@security.hp.com>
	<3F29178A00000A99@ocpmta7.freegates.net>
	<20030804151449.GS18508@security.hp.com>
Content-Type: text/plain
Date: 04 Aug 2003 11:08:01 -0500
Message-Id: <1060013284.1983.32.camel@fuzzy>
Mime-Version: 1.0
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

Let me try to clarify, since there are two differently defined macros in
the kernel (off by one) that would appear to have the same interface,
but which in fact have different semantics (I know, recipe for
disaster):  ffs and ffz (meaning find first set and find first zero).

Both tend to have machine code implementations for architectures that
support them.  The difference is that ffz counts bit zero as zero, but
ffz counts bit zero as one.

They also have different requirements for the error case (no bit set for
ffs and no bit zero for ffz).  For ffs, this is defined to be 32.  For
ffz, this is undefined.

The reason for all of this is that on x86 there is an instruction bsfl
that actually finds first set bit (but counting from zero, not one), but
the O(1) scheduler needed to find clear bits for the arrays, so ffz was
implemented as the complement of this.

ffs has been around a long time (inherited from BSD).  The differing
semantics are because "damnit, computers count from zero not one for
fast operations".

i.e.

ffs(0) == 0
ffz(0) == 0

ffs(1) == 1
ffz(~1) == 0  (same as above ffz, bit zero clear)

ffs(2) == 2
ffz(~3) == 1

[...]

ffs(0x8000000) == 32
ffz(0x7ffffff) == 31

ffz(0xffffffff) == could be anything

Some machine architectures have an __ffs() (usually mirroring a machine
instruction) whose semantics are identical to ffs() except that it also
is undefined in the error case (so ffs can simply be implemented as if
not error case, do __ffs()).

James
