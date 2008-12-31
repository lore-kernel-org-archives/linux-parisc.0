From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel
 modules (take 4)
Date: Wed, 31 Dec 2008 14:14:08 -0800 (PST)
Message-ID: <20081231.141408.60544902.davem@davemloft.net>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain>
	<20081231105425.9ccac21d.akpm@linux-foundation.org>
	<alpine.LFD.2.00.0812311318420.5086@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: akpm@linux-foundation.org, rdreier@cisco.com, mingo@elte.hu,
	ian.campbell@citrix.com, jeremy.fitzhardinge@citrix.com,
	deller@gmx.de, rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	sam@ravnborg.org, dave@hiauly1.hia.nrc.ca
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 31 Dec 2008 13:22:53 -0800 (PST)

> On Wed, 31 Dec 2008, Andrew Morton wrote:
> > 
> > Adrian claimed that it was gcc-4.1.0 and 4.1.1 only.  He proposed
> > banning them: http://lkml.org/lkml/2008/8/5/444
> 
> If it really is just those releases, then yes, considering the number of 
> cases we apparently have, and considering how ugly it is in some cases to 
> move the weak function anywhere else, maybe banning those versions is the 
> proper thing to do.
> 
> It probably won't hurt very many people - yeah, some people will be forced 
> to upgrade, but I have this memory of early 4.1 having had other bugs 
> anyway, so it's probably a good idea.

I think this is probably the best way to handle this.
