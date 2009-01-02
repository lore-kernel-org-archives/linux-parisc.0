From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 2 Jan 2009 18:46:41 +0100
Message-ID: <20090102174641.GA27287@elte.hu>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231105425.9ccac21d.akpm@linux-foundation.org> <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu> <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain> <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain>
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
In-Reply-To: <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> 
> 
> On Fri, 2 Jan 2009, Linus Torvalds wrote:
> > 
> > I think this is wrong.
> > 
> > Just move the check into <linux/compiler-gcc4.h>
> 
> In fact, looking at that whole mess, I redid it all. It was disgusting 
> how conditionals in gcc4.h needed to double-check that __GNUC__ really 
> was 4 (rather than something bigger), which largely negated the whole 
> nice clean compiler version separation.
> 
> I pushed out my preferred version, which fixes up the whole thing. The 
> gcc4 header file now only gets included for __GNUC__ == 4, and when we 
> ever see a __GNUC__ of 5, it will automatically DTRT and try to include 
> <linux/compiler-gcc5.h> instead of #4.
> 
> And then the check in gcc4.h for 4.1.0 and 4.1.1 is much simplified.  
> The two patches I pushed out add functionality, but don't actually add 
> any new lines (the first simplification patch removes more lines than it 
> adds, and the second one that adds the __weak bug test adds as mahy 
> lines as the cleanup removed).
> 
> And it all looks more logical too, imho.

yeah, agreed, much cleaner.

The gcc3 check for gcc 3.0 and 3.1 can be pushed into gcc3 as well - not 
sure whether you fixed that. (i fixed it in the patch i just sent - but i 
didnt notice the gcc5 mess in gcc4.h that you fixed)

	Ingo
