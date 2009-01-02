From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Sat, 03 Jan 2009 09:27:33 +1100
Message-ID: <1230935253.15389.99.camel@pasglop>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain>
	 <20081231105425.9ccac21d.akpm@linux-foundation.org>
	 <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain>
	 <20081231.141408.60544902.davem@davemloft.net>
	 <20090102115547.GB3027@elte.hu>
	 <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain>
	 <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain>
	 <20090102175737.GA5818@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@elte.hu>,
	David Miller <davem@davemloft.net>, akpm@linux-foundation.org,
	rdreier@cisco.com, ian.campbell@citrix.com,
	jeremy.fitzhardinge@citrix.com, deller@gmx.de,
	rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	dave@hiauly1.hia.nrc.ca
To: Sam Ravnborg <sam@ravnborg.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090102175737.GA5818@uranus.ravnborg.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


> 
> Bugger....
> Now I cannot do cross compile for: alpha, arm, m68k and sparc.
> 
> Not that I actually try to run these beasts but just being able
> to do cross compile has served me well.
> 
> Last I looked (only few days ago) crosstool-ng did not support sparc :-(

There are also various variants of 4.1.1 around with the fix for
that inline bug backported (I think that's the case of the compiler
that ships with the Cell SDK for example).

What a f. mess :-(

Cheers,
Ben.

