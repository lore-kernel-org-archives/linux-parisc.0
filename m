From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 2 Jan 2009 19:27:35 +0100
Message-ID: <20090102182735.GC5905@uranus.ravnborg.org>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231105425.9ccac21d.akpm@linux-foundation.org> <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu> <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain> <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain> <20090102175737.GA5818@uranus.ravnborg.org> <alpine.LFD.2.00.0901021000020.5086@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Ingo Molnar <mingo@elte.hu>, David Miller <davem@davemloft.net>,
	Andrew Morton <akpm@linux-foundation.org>, rdreier@cisco.com,
	ian.campbell@citrix.com, jeremy.fitzhardinge@citrix.com,
	deller@gmx.de, rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	dave@hiauly1.hia.nrc.ca
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Vegard Nossum <vegard@kernel.org>
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

Asked google and it found following page:

    http://www.kernel.org/pub/tools/crosstool/

Architecuter   OK?    gcc version
--------------------------------- 
alpha          No     gcc 4.0.2
arm            Yes    gcc 3.4.5
ia64           Yes    gcc 3.4.5
m68k           Yes    gcc 3.4.5
mips           Yes    gcc 3.4.5
sh4            Yes    gcc 3.4.5
sparc          Yes    gcc 3.4.5
sparc64        Yes    gcc 3.4.5
x86_64         Yes    gcc 3.4.5


So from this list of tool chains we can continue to do cross builds
of all except alpha.
But the gcc version is getting ancient..

Why it shall be so hard to do cross build toolchains is above my
imagination but then I also never looked at what it involes.

Added Vegard that maintain these pages.

	Sam
