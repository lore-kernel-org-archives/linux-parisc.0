Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A2954840
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Dec 2003 22:06:59 -0700 (MST)
Message-Id: <200312160506.hBG56wnD015891@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Question about cache flushing and fork
To: randolph@tausq.org
Date: Tue, 16 Dec 2003 00:06:57 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20031216044033.GT533@tausq.org> from "Randolph Chung" at Dec 15,
	2003 08:40:33 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Hi,
> 
> Can someone please explain why it is necessary to flush the cache 
> during fork()? (i.e. call to flush_cache_mm() in dup_mmap)

I have a different cache question.  GCC uses a stack trampoline
to call nested functions.  This trampoline is on the stack and
has to be flushed before being used.  A few weeks ago a trampoline
testcase was added.  This testcase failed under hppa64-hpux.  It
turned out that the code assumed that the PA 2.0 cache line was
32 bytes (it was apparently derived from the original PA 1.1 code).

According to my understanding, all PA 2.0 machines use a 64 byte
cache line.  On the otherhand, the PA 2.0 documentation states that
a cache line on a PA 2.0 machine can be 16, 32 or 64 bytes if I
remember correctly.

After I changed the cache line to 64 bytes, the GCC testcase passed
under hpux 11.11 on the A500 that I have.  However, I noticed
recently that it still fails on a C200 running 11.00.  It dies
with an illegal insn (it's a mfia) about the 5th time through
one of the trampolines that the code creates.  The mfia insn is
the entry to the trampoline and it's 16 bytes from the start of
the trampoline data.  If I copy the C200 binary to the A500, it
executes without error.  So, there appears to be a subtle hardware
or OS dependence involved.

I believe that code follows the stated rules for self-modifying code.
The code looks fine when examined with gdb.

Anybody have have any ideas what might be going on?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
