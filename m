From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel
 modules (take 4)
Date: Wed, 31 Dec 2008 13:22:53 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain>
References: <4959346E.7060600@gmx.de> <200812310915.41693.rusty@rustcorp.com.au> <495B5806.3080505@gmx.de> <alpine.LFD.2.00.0812310926450.5086@localhost.localdomain> <ada63l0qmba.fsf@cisco.com> <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain>
 <20081231105425.9ccac21d.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>,
	Ian Campbell <ian.campbell@citrix.com>,
	Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>,
	Helge Deller <deller@gmx.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081231105425.9ccac21d.akpm@linux-foundation.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Wed, 31 Dec 2008, Andrew Morton wrote:
> 
> Adrian claimed that it was gcc-4.1.0 and 4.1.1 only.  He proposed
> banning them: http://lkml.org/lkml/2008/8/5/444

If it really is just those releases, then yes, considering the number of 
cases we apparently have, and considering how ugly it is in some cases to 
move the weak function anywhere else, maybe banning those versions is the 
proper thing to do.

It probably won't hurt very many people - yeah, some people will be forced 
to upgrade, but I have this memory of early 4.1 having had other bugs 
anyway, so it's probably a good idea.

		Linus
