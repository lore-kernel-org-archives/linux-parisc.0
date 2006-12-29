From: Ingo Molnar <mingo@elte.hu>
Subject: [parisc-linux] Re: [patch] remove MAX_ARG_PAGES
Date: Fri, 29 Dec 2006 23:20:31 +0100
Message-ID: <20061229222031.GA23724__27509.6589386978$1416624244$gmane$org@elte.hu>
References: <65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com>
	<1160572460.2006.79.camel@taijtu>
	<65dd6fd50610111448q7ff210e1nb5f14917c311c8d4@mail.gmail.com>
	<65dd6fd50610241048h24af39d9ob49c3816dfe1ca64@mail.gmail.com>
	<20061229200357.GA5940@elte.hu>
	<20061229204904.GI20596@flint.arm.linux.org.uk>
	<Pine.LNX.4.64.0612291322150.4473@woody.osdl.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andrew Morton <akpm@osdl.org>,
 linux-arch@vger.kernel.org,
 Russell King <rmk+lkml@arm.linux.org.uk>,
 Peter Zijlstra <a.p.zijlstra@chello.nl>,
 Andi Kleen <ak@muc.de>,
 linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org,
 Ollie Wild <aaw@google.com>,
 Ulrich Drepper <drepper@redhat.com>,
 parisc-linux@lists.parisc-linux.org,
 Arjan van de Ven <arjan@infradead.org>
To: Linus Torvalds <torvalds@osdl.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.64.0612291322150.4473@woody.osdl.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


[Cc:-ed Ulrich too]

* Linus Torvalds <torvalds@osdl.org> wrote:

> On Fri, 29 Dec 2006, Russell King wrote:
> > 
> > Suggest you test (eg) a rebuild of libX11 to see how it reacts to 
> > this patch.
> 
> Also: please rebuild "xargs" and install first. Otherwise, a lot of 
> build script etc that use "xargs" won't ever trigger the new limits 
> (or lack thereof), because xargs will have been installed with some 
> old limits.

yeah, and i think the default chunking of xargs should still remain 
128K.

If it's fine for a script to get chunked input, and if the script has no 
security relevance (xargs is fundamentally unsafe if any portion of the 
VFS namespace it gets used is untrusted), then there's no problem for 
the xargs limit to stay at 128K.

> Perhaps more worrying is if compiling xargs under a new kernel then 
> means that it won't work correctly under an old one.

xargs has its limit hardcoded AFAICS, it's based on:

#define ARG_MAX       131072    /* # bytes of args + environ for exec() */

i'd not change that just yet. The sysconf(3) manpage says it's generally 
unreliable:

  BUGS
       It is difficult to use ARG_MAX because it is not specified how much  of
       the  argument  space  for  exec() is consumed by the user's environment
       variables.

but ... as it is with every limit, it is always possible to write an 
application that hardcodes a larger limit and then doesnt work when 
running with the lower limit. Would that have been a correct argument 
against say raising the user stack limit from the historic 1MB?

right now some of my (more stupid) scripts occasionally break if any 
random portion of my VFS namespace grows over the silly 128K limit. (and 
it rarely has the tendency to shrink, sadly) I think that is just as 
much of a legitimate problem as any naive newly written script not 
working on an older kernel on a huge VFS namespace. (in fact i could 
argue for it to be a more legitimate problem than other stupid scripts 
not being backwards compatible, not the least because it is a problem 
with /my/ scripts ;-)

we could try something like adding an ARG_MAX rlimit, but i think that 
would be overdoing it ... we could also do a sysctl as a global limit - 
equally pointless because distros will likely tweak it up anyway, and in 
any case neither measure really prevents the writing of stupid scripts.

	Ingo
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
