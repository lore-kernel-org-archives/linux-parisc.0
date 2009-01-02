From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 2 Jan 2009 19:01:10 +0100
Message-ID: <20090102180110.GA7425@elte.hu>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231105425.9ccac21d.akpm@linux-foundation.org> <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu> <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain> <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain> <20090102174641.GA27287@elte.hu> <alpine.LFD.2.00.0901020953280.5086@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: David Miller <davem@davemloft.net>, akpm@linux-foundation.org,
	rdreier@cisco.com, ian.campbell@citrix.com,
	jeremy.fitzhardinge@citrix.com, deller@gmx.de,
	rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	sam@ravnborg.org, dave@hiauly1.hia.nrc.ca
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0901020953280.5086@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> 
> 
> On Fri, 2 Jan 2009, Ingo Molnar wrote:
> > 
> > The gcc3 check for gcc 3.0 and 3.1 can be pushed into gcc3 as well - not 
> > sure whether you fixed that. (i fixed it in the patch i just sent - but i 
> > didnt notice the gcc5 mess in gcc4.h that you fixed)
> 
> I just dropped it. Gcc 3.0 and 3.1 are so old that we simply don't care.

we didnt support it for quite some time. If you look at that ugly version 
check you replaced:

 #if __GNUC__ >= 4 && !gcc41_inlining_bug
 # include <linux/compiler-gcc4.h>
 #elif __GNUC__ == 3 && __GNUC_MINOR__ >= 2
 # include <linux/compiler-gcc3.h>
 #else
 # error Sorry, your compiler is too old, too buggy or not recognized.
 #endif

it has a hidden 'gcc 3.0 / 3.1 is not supported' condition in it. So what 
i tried to point out that your patch causes a regression here - we dont 
filter out gcc 3.0/3.1 out anymore.

	Ingo
