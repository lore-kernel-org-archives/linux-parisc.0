From: Ingo Molnar <mingo@elte.hu>
Subject: [parisc-linux] Re: [patch] remove MAX_ARG_PAGES
Date: Fri, 29 Dec 2006 22:57:14 +0100
Message-ID: <20061229215714.GA21694__15892.9848032587$1416624243$gmane$org@elte.hu>
References: <65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com>
	<1160572460.2006.79.camel@taijtu>
	<65dd6fd50610111448q7ff210e1nb5f14917c311c8d4@mail.gmail.com>
	<65dd6fd50610241048h24af39d9ob49c3816dfe1ca64@mail.gmail.com>
	<20061229200357.GA5940@elte.hu>
	<20061229204904.GI20596@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andrew Morton <akpm@osdl.org>,
 linux-arch@vger.kernel.org,
 Peter Zijlstra <a.p.zijlstra@chello.nl>,
 Andi Kleen <ak@muc.de>,
 linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org,
 Linus Torvalds <torvalds@osdl.org>,
 Ollie Wild <aaw@google.com>,
 parisc-linux@lists.parisc-linux.org,
 Arjan van de Ven <arjan@infradead.org>
To: Russell King <rmk+lkml@arm.linux.org.uk>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061229204904.GI20596@flint.arm.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


* Russell King <rmk+lkml@arm.linux.org.uk> wrote:

> On Fri, Dec 29, 2006 at 09:03:57PM +0100, Ingo Molnar wrote:
> > FYI, i have forward ported your MAX_ARG_PAGES limit removal patch to 
> > 2.6.20-rc2 and have included it in the -rt kernel. It's working great - 
> > i can now finally do a "ls -t patches/*.patch" in my patch repository - 
> > something i havent been able to do for years ;-)
> 
> How do the various autoconf stuff react to this?  Eg, I notice the 
> following in various configure scripts:
> 
> checking the maximum length of command line arguments... 32768

yes, that's how libtool works, it goes from 32K downwards to figure out 
a maximum. I dont see a problem there.

you can find a few other variants at:

  http://www.google.com/codesearch?q=%22checking+the+maximum+length+of+command+line+arguments%22&hl=en&btnG=Search+Code

worst-case the test-command would get a segfault from the default stack 
limit. (8MB on Fedora)

	Ingo
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
