Return-Path: <lamont@mmjgroup.com>
Received: from mmjgroup.com (mmjgroup.com [192.34.35.33])
	by dsl2.external.hp.com (Postfix) with ESMTP id 881A34866
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Dec 2003 09:03:04 -0700 (MST)
Date: Tue, 16 Dec 2003 09:03:01 -0700
From: LaMont Jones <lamont@mmjgroup.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Question about cache flushing and fork
Message-ID: <20031216160301.GC25535@mmjgroup.com>
References: <20031216044033.GT533@tausq.org>
	<200312160506.hBG56wnD015891@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200312160506.hBG56wnD015891@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Dec 16, 2003 at 12:06:57AM -0500, John David Anglin wrote:
> According to my understanding, all PA 2.0 machines use a 64 byte
> cache line.  On the otherhand, the PA 2.0 documentation states that
> a cache line on a PA 2.0 machine can be 16, 32 or 64 bytes if I
> remember correctly.

Correct.  I believe that PDC_CACHE returns the actual size (among other
things.)

> After I changed the cache line to 64 bytes, the GCC testcase passed
> under hpux 11.11 on the A500 that I have.  However, I noticed
> recently that it still fails on a C200 running 11.00.  It dies
> with an illegal insn (it's a mfia) about the 5th time through
> one of the trampolines that the code creates.  The mfia insn is
> the entry to the trampoline and it's 16 bytes from the start of
> the trampoline data.  If I copy the C200 binary to the A500, it
> executes without error.  So, there appears to be a subtle hardware
> or OS dependence involved.

If the C200 is genuinely a PA2.0 machine, then that's, umm, interesting,
since the arch document doesn't say that it's hversion dependent...  The 
instruction is undefined(*) on PA1.1 - you must bl .+8,<register>, which
will get you the address of .+8 (regardless of where you branch.)

lamont

(*) undefined is defined as resulting in any CPU state, with the sole
requirement that there is some defined set of instructions, operating at
the same privilege level that results in the same CPU state.
