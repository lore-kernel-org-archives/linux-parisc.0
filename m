From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] parisc: fix kernel crash when unwinding a userspace
	process
Date: Tue, 25 Nov 2008 12:03:56 -0500
Message-ID: <20081125170356.GB30056@bombadil.infradead.org>
References: <200811202258.56561.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	Kyle Mc Martin <kyle@hera.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randolph Chung <randolph@tausq.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200811202258.56561.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Nov 20, 2008 at 10:58:56PM +0100, Helge Deller wrote:
> Any user on existing parisc 32- and 64bit-kernels can easily crash
> the kernel and as such enforce a DSO.
> A simple testcase is available here: 
> 	http://gsyprf10.external.hp.com/~deller/crash.tgz
> 
> The problem is introduced by the fact, that the handle_interruption()
> crash handler calls the show_regs() function, which in turn tries
> to unwind the stack by calling parisc_show_stack().
> Since the stack contains userspace addresses, a try to unwind 
> the stack is dangerous and useless and leads to the crash.
> 
> The fix is trivial: For userspace processes
> a) avoid to unwind the stack, and
> b) avoid to resolve userspace addresses to kernel symbol names.
> 
> While touching this code, I converted print_symbol() to %pS 
> printk formats and made parisc_show_stack() static.
> 
> An initial patch for this was written by Kyle McMartin back in August:
> http://marc.info/?l=linux-parisc&m=121805168830283&w=2
> 
> Compile and run-tested with a 64bit parisc kernel.
> Patches for -stable series will follow shortly.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 

Sorry, I've been sick for the last few days. I see this has already been
applied, cool.

Anyway, acked-by me.
