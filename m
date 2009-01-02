From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 02 Jan 2009 20:14:58 +0100
Message-ID: <87mye9jz9p.fsf@basil.nowhere.org>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain>
	<20081231105425.9ccac21d.akpm@linux-foundation.org>
	<alpine.LFD.2.00.0812311318420.5086@localhost.localdomain>
	<20081231.141408.60544902.davem@davemloft.net>
	<20090102115547.GB3027@elte.hu>
	<alpine.LFD.2.00.0901020844070.5086@localhost.localdomain>
	<alpine.LFD.2.00.0901020933370.5086@localhost.localdomain>
	<20090102175737.GA5818@uranus.ravnborg.org>
	<alpine.LFD.2.00.0901021000020.5086@localhost.localdomain>
	<20090102185148.GI28946@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@elte.hu>,
	David Miller <davem@davemloft.net>,
	Andrew Morton <akpm@linux-foundation.org>, rdreier@cisco.com,
	ian.campbell@citrix.com, jeremy.fitzhardinge@citrix.com,
	deller@gmx.de, rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	dave@hiauly1.hia.nrc.ca
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090102185148.GI28946@ZenIV.linux.org.uk> (Al Viro's message of "Fri, 2 Jan 2009 18:51:48 +0000")
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Al Viro <viro@ZenIV.linux.org.uk> writes:
>
> FWIW, I'm using 4.3 on all targets at the moment.  See
> git://git.kernel.org/pub/scm/linux/kernel/git/viro/toolchain.git/
> for fedora-based variant of that sucker.  And yes, it does include
> cross-to-sparc; all but sh/sh64, in fact (sh had serious compiler
> breakage around 4.3.0 and backporting from -HEAD was far beyond
> what I considered reasonable at that point).

The full opensuse distribution also has a couple of spec files for
generating cross compilers from recent versions. These are for
icecream, but can be relatively easily adapted (or the binaries
reused)

In general I don't think building cross compilers is as hard
as it used to be, so it can be reasonably done without any support
scripts too.

Really no excuse to still use the old crosstool crap :)

-Andi

-- 
ak@linux.intel.com
