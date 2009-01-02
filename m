From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 2 Jan 2009 10:08:03 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0901021006150.5086@localhost.localdomain>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231105425.9ccac21d.akpm@linux-foundation.org> <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu>
 <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain> <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain> <20090102174641.GA27287@elte.hu> <alpine.LFD.2.00.0901020953280.5086@localhost.localdomain> <20090102180110.GA7425@elte.hu>
 <alpine.LFD.2.00.0901021004440.5086@localhost.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Miller <davem@davemloft.net>, akpm@linux-foundation.org,
	rdreier@cisco.com, ian.campbell@citrix.com,
	jeremy.fitzhardinge@citrix.com, deller@gmx.de,
	rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	sam@ravnborg.org, dave@hiauly1.hia.nrc.ca
To: Ingo Molnar <mingo@elte.hu>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759342AbZABSIt@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0901021004440.5086@localhost.localdomain>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Fri, 2 Jan 2009, Linus Torvalds wrote:
> 
> What I tried to tell you was that we don't care - nobody can have it 
> anyway. If somebody tried to compile the kernel with it, we've already 
> refused for the last 2+ years. So there are no old users out there. And 
> there certainly aren't any new ones.

.. but we cetrtainly can add the check back easily enough if you really 
want to, of course. I just don't think there is much point.

			Linus
