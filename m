Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C3A54875
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Dec 2003 17:57:18 -0700 (MST)
Message-Id: <200312170057.hBH0vG4I002151@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Question about cache flushing and fork
To: James.Bottomley@steeleye.com (James Bottomley)
Date: Tue, 16 Dec 2003 19:57:16 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <1071621405.2080.160.camel@mulgrave> from "James Bottomley" at
	Dec 16, 2003 07:36:44 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> If we think the cache line is *smaller* than it actually is, all this
> does is issue more flushes than necessary to the cache lines, I don't
> understand how it results in an observable failure.

In the particular case at hand, I noticed that calls to nested functions
were broken on hppa64-hpux11.11.  Nested calls in GCC are done with a stack
trampoline.  The 64-bit trampoline was in fact 72 bytes long.  GCC
was using a line length of 32.  Because the trampoline has 16 byte alignment,
it was possible to hit an alignment situation were the stack code didn't
get flushed.

I changed the length to 64 on hppa64 to fix this problem.  I based this
on the following code in include/parisc/cache.h:

/*
 * PA 2.0 processors have 64-byte cachelines; PA 1.1 processors have
 * 32-byte cachelines.  The default configuration is not for SMP anyway,
 * so if you're building for SMP, you should select the appropriate
 * processor type.  There is a potential livelock danger when running
 * a machine with this value set too small, but it's more probable you'll
 * just ruin performance.
 */
#ifdef CONFIG_PA20
#define L1_CACHE_BYTES 64
#else
#define L1_CACHE_BYTES 32
#endif

After I made the GCC change, I noticed the trampoline-1.c test failed
on a C200 but not on the A500 that I did the original fix on.  It appears
the C200 has line length of 32 bytes.  As the C200 contains a PA 2.0
processor, the above comment would appear incorrect.  Probably, trying
to run a kernel built with CONFIG_PA20 defined on a C200 would fail
because the line length specified above is *larger* than the actual
line length.  On the otherhand, PDC_CACHE allows setting some cache
parameters.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
