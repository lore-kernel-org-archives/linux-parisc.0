From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 2 Jan 2009 09:58:25 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0901020953280.5086@localhost.localdomain>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231105425.9ccac21d.akpm@linux-foundation.org> <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu>
 <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain> <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain> <20090102174641.GA27287@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Miller <davem@davemloft.net>, akpm@linux-foundation.org,
	rdreier@cisco.com, ian.campbell@citrix.com,
	jeremy.fitzhardinge@citrix.com, deller@gmx.de,
	rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	sam@ravnborg.org, dave@hiauly1.hia.nrc.ca
To: Ingo Molnar <mingo@elte.hu>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090102174641.GA27287@elte.hu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Fri, 2 Jan 2009, Ingo Molnar wrote:
> 
> The gcc3 check for gcc 3.0 and 3.1 can be pushed into gcc3 as well - not 
> sure whether you fixed that. (i fixed it in the patch i just sent - but i 
> didnt notice the gcc5 mess in gcc4.h that you fixed)

I just dropped it. Gcc 3.0 and 3.1 are so old that we simply don't care. 

Nobody who has compiled a kernel in the last two years can possibly have 
those versions: we've failed the build on them since December 2006. And 
there obviously won't be any new users either. So consider it a 
generational garbage collection event.

Of course, if we really want to check for old compiler versions, we can 
add the check back (to the gcc3 header file where it belongs), but it does 
seem to be entirely historical.

			Linus
