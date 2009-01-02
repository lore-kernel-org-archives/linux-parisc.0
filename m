From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 2 Jan 2009 18:51:48 +0000
Message-ID: <20090102185148.GI28946@ZenIV.linux.org.uk>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231105425.9ccac21d.akpm@linux-foundation.org> <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu> <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain> <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain> <20090102175737.GA5818@uranus.ravnborg.org> <alpine.LFD.2.00.0901021000020.5086@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@elte.hu>,
	David Miller <davem@davemloft.net>,
	Andrew Morton <akpm@linux-foundation.org>, rdreier@cisco.com,
	ian.campbell@citrix.com, jeremy.fitzhardinge@citrix.com,
	deller@gmx.de, rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	dave@hiauly1.hia.nrc.ca
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0901021000020.5086@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 02, 2009 at 10:04:27AM -0800, Linus Torvalds wrote:
> 
> 
> On Fri, 2 Jan 2009, Sam Ravnborg wrote:
> > 
> > Bugger....
> > Now I cannot do cross compile for: alpha, arm, m68k and sparc.
> > 
> > Not that I actually try to run these beasts but just being able
> > to do cross compile has served me well.
> 
> We _could_ make a "CONFIG_COMPILE_ONLY" check, but wouldn't it be even 
> nicer to make sure the cross-compiles are something that might actually be 
> expected to work?
> 
> I realize that cross-tools tend to lag a bit - the pressure to maintain 
> them tends to be much lower - but I was sure we had somebody who did a 
> reasonable cross-compiler toolchain. Is gcc-4.1 really the most modern 
> thing that is easily available?

FWIW, I'm using 4.3 on all targets at the moment.  See
git://git.kernel.org/pub/scm/linux/kernel/git/viro/toolchain.git/
for fedora-based variant of that sucker.  And yes, it does include
cross-to-sparc; all but sh/sh64, in fact (sh had serious compiler
breakage around 4.3.0 and backporting from -HEAD was far beyond
what I considered reasonable at that point).
