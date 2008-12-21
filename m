From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Mon, 22 Dec 2008 00:08:47 +0100
Message-ID: <494ECC7F.2010702@gmx.de>
References: <20081221225837.1D1404F19@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: kyle@infradead.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081221225837.1D1404F19@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>>> -	mtsp(space, 3);
>>> +	load_context(space);
>> I came to the similar conclusion and tried exactly this patch earlier
>> today. It didn't fixed the problem (although I had the feeling that the
>> bug didn't appeared as often then).
> 
> Ok, then maybe load_context needs to be atomic.  This is a bit tricky
> because we may have to ensure that no tlb misses are triggered (relied
> upon translation) during the update.

I'll try tomorrow.

What makes me wondering:

a) the bug always triggers AFAICS with applications which uses threads
(for the ruby1.9 problem it's always the miniruby process). Maybe the
problem happens to something being wrong in the signal handler with
threadened applications, e.g. arch/parisc/kernel/signal.c:648 ?

b) maybe stupid question: In the case it's a generic processor problem,
would e.g. changing the kernel to use sr4 instead of sr3 for
userspace-accesses change something? What does HPUX uses? At least one
could try...?


Helge
