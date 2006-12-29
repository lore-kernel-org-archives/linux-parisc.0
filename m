From: Linus Torvalds <torvalds@osdl.org>
Subject: [parisc-linux] Re: [patch] remove MAX_ARG_PAGES
Date: Fri, 29 Dec 2006 13:23:35 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0612291322150.4473__8052.46854802153$1416624243$gmane$org@woody.osdl.org>
References: <65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com>
	<1160572460.2006.79.camel@taijtu>
	<65dd6fd50610111448q7ff210e1nb5f14917c311c8d4@mail.gmail.com>
	<65dd6fd50610241048h24af39d9ob49c3816dfe1ca64@mail.gmail.com>
	<20061229200357.GA5940@elte.hu>
	<20061229204904.GI20596@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: Andrew Morton <akpm@osdl.org>,
 linux-arch@vger.kernel.org,
 Peter Zijlstra <a.p.zijlstra@chello.nl>,
 Andi Kleen <ak@muc.de>,
 linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org,
 Ollie Wild <aaw@google.com>,
 Ingo Molnar <mingo@elte.hu>,
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



On Fri, 29 Dec 2006, Russell King wrote:
> 
> Suggest you test (eg) a rebuild of libX11 to see how it reacts to
> this patch.

Also: please rebuild "xargs" and install first. Otherwise, a lot of 
build script etc that use "xargs" won't ever trigger the new limits (or 
lack thereof), because xargs will have been installed with some old 
limits.

Perhaps more worrying is if compiling xargs under a new kernel then means 
that it won't work correctly under an old one.

		Linus
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
