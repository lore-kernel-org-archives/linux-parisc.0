Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA07217
	for <parisc-linux@puffin.external.hp.com>; Sun, 31 Oct 1999 11:36:22 -0700
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id TAA06732
	for <parisc-linux@thepuffingroup.com>; Sun, 31 Oct 1999 19:37:29 +0100
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id TAA276551
	for <parisc-linux@thepuffingroup.com>; Sun, 31 Oct 1999 19:37:25 +0100 (CET)
Received: by genedata.com
	via sendmail from stdin
	id <m11hzrI-00028LC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Sun, 31 Oct 1999 19:37:40 +0100 (CET)
Date: Sun, 31 Oct 1999 19:37:39 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991031193739.V516@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] xchg implementation
List-ID: <linux-parisc.vger.kernel.org>


As you can read below, I've been thinking about the implementation
of xchg again.  For those who are unfamiliar with this, it is used to
atomically swap the contents of a register with a location in memory.
It is defined to be atomic wrt other CPUs and interrupts on the same CPU.
PA-RISC's only atomic operation is load-and-zero.  A large proportion
of the cases where xchg is used, it is with zero, and we can use the
load-and-zero instruction.

This is a uniprocessor optimisation of the xchg() case where it's _not_
exchanging with zero.  What I need is a spare CR register.  As far as I
can see from the comments, CR28-30 are currently reserved; leaving CRs
24, 25 and 31 available.  Unless someone's using one of them without
documenting it somewhere...?  That really does need to be written down
somewhere.

----- Forwarded message from Matthew Wilcox <Matthew.Wilcox@genedata.com> -----

Date: Sun, 31 Oct 1999 19:02:34 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Ralf Baechle <ralf@uni-koblenz.de>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        Keith Owens <kaos@ocs.com.au>, linux-kernel@vger.rutgers.edu
Subject: Re: FD array expansion problem
X-Mailer: Mutt 0.95.3i
In-Reply-To: <19991031010842.H15510@uni-koblenz.de>; from Ralf Baechle on Sun, Oct 31, 1999 at 01:08:42AM +0200

On Sun, Oct 31, 1999 at 01:08:42AM +0200, Ralf Baechle wrote:
> On Sat, Oct 30, 1999 at 03:42:17PM +0200, Matthew Wilcox wrote:
> 
> > We don't have ll/sc instructions or compare-and-swap on pa-risc.
> > I'd really like to be able to do this without disabling interrupts,
> > but I don't think there's a way.
> 
> Actually there is a neat way for uniprocessor MIPSes to implement this.
> The two registers k0 and k1 are reserved for use of the kernel, for example
> in interrupt processing.  All exception handles will destroy the content
> of these registers and set it to a value != NULL which allows to implement
> an atomic increment for uniprocessors like:
> 
> 	move	k0, zero
> 1:	lw	old, addr
> 	sw	new, addr
> 	bnez	k0, 1b
> 
> Dunno if that'd hold for HPPA as well.

I don't think that works.  Look:

main code	interrupt
set k0 to zero
load A from addr
store B at addr
		set k0 to zero
		load B from addr
		store C at addr
		return (i assume this makes k0 non-zero)
k0 is non-zero, so loop again
load C from addr
store B at addr

And you've lost the original A.  I came up with a similar scheme while
taking a long walk today (many people seem to prefer the shower for their
good ideas.  I find Japanese stroll gardens are ideal, and a nice long
walk is almost as good.)

The idea is to flag whether we're in the middle of an xchg operation in
a register such as k0, then have the interrupt handler's exit routine fix
it up:

move k0, one
lw A, addr
sw B. addr
move k0, zero

would then be the typical non-interrupted case.

The modified interrupt code looks like:

int xchging = (k0 == 1);

... normal irq code ...

if (!xchging)
	return;
if (instruction we will return to is a store)
	return to addr - 4;
return;

This should work, and have a minimal cost per interrupt.
Now to find out whether we have a suitable register on PA-RISC..

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

----- End forwarded message -----

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
