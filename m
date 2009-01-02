From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 2 Jan 2009 12:18:02 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0901021217390.3179@localhost.localdomain>
References: <20081231105425.9ccac21d.akpm@linux-foundation.org> <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu> <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain>
 <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain> <20090102174641.GA27287@elte.hu> <alpine.LFD.2.00.0901020953280.5086@localhost.localdomain> <20090102180110.GA7425@elte.hu> <alpine.LFD.2.00.0901021004440.5086@localhost.localdomain>
 <20090102195417.GB5038@1wt.eu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Ingo Molnar <mingo@elte.hu>, David Miller <davem@davemloft.net>,
	akpm@linux-foundation.org, rdreier@cisco.com,
	ian.campbell@citrix.com, jeremy.fitzhardinge@citrix.com,
	deller@gmx.de, rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	sam@ravnborg.org, dave@hiauly1.hia.nrc.ca
To: Willy Tarreau <w@1wt.eu>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090102195417.GB5038@1wt.eu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Fri, 2 Jan 2009, Willy Tarreau wrote:
> 
> Yes some people (including me) still have them and are happy that there
> is a check to prevent accidental builds with an inappropriate compiler.

Heh, ok. If people really do actively have that version, let's add the 
check back in.

		Linus
