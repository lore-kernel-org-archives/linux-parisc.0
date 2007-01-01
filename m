From: Pavel Machek <pavel@ucw.cz>
Subject: [parisc-linux] Re: [patch] remove MAX_ARG_PAGES
Date: Mon, 1 Jan 2007 17:28:03 +0000
Message-ID: <20070101172803.GC4214__38363.4056583562$1416624245$gmane$org@ucw.cz>
References: <65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com>
	<1160572460.2006.79.camel@taijtu>
	<65dd6fd50610111448q7ff210e1nb5f14917c311c8d4@mail.gmail.com>
	<65dd6fd50610241048h24af39d9ob49c3816dfe1ca64@mail.gmail.com>
	<20061229200357.GA5940@elte.hu>
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
To: Ingo Molnar <mingo@elte.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061229200357.GA5940@elte.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi!

> FYI, i have forward ported your MAX_ARG_PAGES limit removal patch to 
> 2.6.20-rc2 and have included it in the -rt kernel. It's working great - 
> i can now finally do a "ls -t patches/*.patch" in my patch repository - 
> something i havent been able to do for years ;-)
> 
> what is keeping this fix from going upstream?

+1

I like this. I've been running with MAX_ARG_PAGES raised to insane
value, and I'd love to get rid of that hack.

							Pavel
-- 
Thanks for all the (sleeping) penguins.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
