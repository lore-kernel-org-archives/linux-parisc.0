From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Sun, 21 Dec 2008 19:07:45 -0500 (EST)
Message-ID: <20081222000745.B9C6F4E99@hiauly1.hia.nrc.ca>
References: <494ECC7F.2010702@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <494ECC7F.2010702@gmx.de> from "Helge Deller" at Dec 22, 2008 00:08:47 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> John David Anglin wrote:
> >>> -	mtsp(space, 3);
> >>> +	load_context(space);
> >> I came to the similar conclusion and tried exactly this patch earlier
> >> today. It didn't fixed the problem (although I had the feeling that the
> >> bug didn't appeared as often then).
> > 
> > Ok, then maybe load_context needs to be atomic.  This is a bit tricky
> > because we may have to ensure that no tlb misses are triggered (relied
> > upon translation) during the update.
> 
> I'll try tomorrow.

Another thing that I'm wondering about is the following.  The tlb miss
handlers assume the following:

	* cr24 contains a pointer to the kernel address space
	* page directory.
	*
	* cr25 contains a pointer to the current user address
	* space page directory.
	*
	* sr3 will contain the space id of the user address space
	* of the current running thread while that thread is
	* running in the kernel.

Possibly, load_context needs to update cr25 as well.  Assume cr24
never changes.

> What makes me wondering:
> 
> a) the bug always triggers AFAICS with applications which uses threads
> (for the ruby1.9 problem it's always the miniruby process). Maybe the
> problem happens to something being wrong in the signal handler with
> threadened applications, e.g. arch/parisc/kernel/signal.c:648 ?

In my gcc builds, it's bash and make that experience the majority of
unexplained segvs.  There is an issue with the signal handler and bash
that causes a loop, however I think the initial fault was caused by a
tlb issue.

> b) maybe stupid question: In the case it's a generic processor problem,
> would e.g. changing the kernel to use sr4 instead of sr3 for
> userspace-accesses change something? What does HPUX uses? At least one
> could try...?

Personally, it's not clear to me that this is just a problem with kernel
userspace accesses.  If sr3 is corrupt in the kernel, sr7 will be corrupt
in userspace.  Think the only thing special about sr3 is that the kernel
changes it for cache flushes, forks, etc.

Your comment that it's sr3 that's wrong suggests a problem with context
switches, particularly since the corrupt value is close to the correct
value.  If sr3 and cr8 are still inconsistent after the patch to
flush_user_cache_page_non_current, we must be missing a mechanism that
updates sr3.  One thought is to load cr8 before sr3 in load_context and
see what happens.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
