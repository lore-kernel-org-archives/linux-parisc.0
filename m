Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 9 Dec 2002 11:41:25 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: Randolph Chung <tausq@debian.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>, carlos@baldric.uwo.ca,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Trap handler
Message-ID: <20021209184125.GC6635@dsl2.external.hp.com>
References: <20021208232601.GH21187@tausq.org> <200212082355.gB8NtUAe010825@hiauly1.hia.nrc.ca> <20021209051214.GK21187@tausq.org> <20021209061913.GM21187@tausq.org> <20021209125416.F20336@parcelfarce.linux.theplanet.co.uk> <20021209180316.GA6635@dsl2.external.hp.com> <20021209182033.L20336@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021209182033.L20336@parcelfarce.linux.theplanet.co.uk>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Dec 09, 2002 at 06:20:33PM +0000, Matthew Wilcox wrote:
> On Mon, Dec 09, 2002 at 11:03:16AM -0700, Grant Grundler wrote:
> > > Judging from the use of cli & sti in the x86 asm, I would venture to
> > > suggest that the I bit should be cleared.  It makes sense anyway --
> > > you can't expect interrupts to be disabled over a page fault.
...
> i misremembered the sense of the I bit

As jsm agreed, if interrupts were disabled when we took the fault,
we can't re-enable them while handling a page fault.
Where x86 disables interrupts seems ok to me.

But the 2.4.20 parisc code (entry.S) re-enables interrupts at
intr_return label (ssm insn). Should parisc *not* be re-enabling
interrupts at all or at least not until after intr_check_resched
code block?

I'm trying to align x86/parisc implementations.
And "misaligned trap handler" is one difference I suspect
the x86 code doesn't have to handle.

thanks,
grant
