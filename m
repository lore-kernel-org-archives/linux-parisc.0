From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: [parisc-linux] Re: [patch] remove MAX_ARG_PAGES
Date: Fri, 29 Dec 2006 20:49:04 +0000
Message-ID: <20061229204904.GI20596__20817.2061051757$1416624243$gmane$org@flint.arm.linux.org.uk>
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

On Fri, Dec 29, 2006 at 09:03:57PM +0100, Ingo Molnar wrote:
> FYI, i have forward ported your MAX_ARG_PAGES limit removal patch to 
> 2.6.20-rc2 and have included it in the -rt kernel. It's working great - 
> i can now finally do a "ls -t patches/*.patch" in my patch repository - 
> something i havent been able to do for years ;-)

How do the various autoconf stuff react to this?  Eg, I notice the
following in various configure scripts:

checking the maximum length of command line arguments... 32768

Suggest you test (eg) a rebuild of libX11 to see how it reacts to
this patch.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
