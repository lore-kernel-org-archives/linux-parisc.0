Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA11607
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 11:33:57 -0600
Date: Mon, 28 Jun 1999 19:34:04 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Anyone got a few moments?
Message-ID: <19990628193404.I30362@mencheca.ch.genedata.com>
References: <19990628172141.G30362@mencheca.ch.genedata.com> <199906281709.KAA03215@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199906281709.KAA03215@milano.cup.hp.com>; from Grant Grundler on Mon, Jun 28, 1999 at 10:09:16AM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 28, 1999 at 10:09:16AM -0700, Grant Grundler wrote:
> Matthew Wilcox wrote:
> > 
> > Which of the people involved in this project know PA-RISC assembler?
> > 
> > We need xchg() written (in include/asm-parisc/system.h) before the
> > networking will compile.  We're going to need other stuff written too of
> > course; I know ARM assembler, so I guess I could probably learn PA-RISC
> > asm if no-one else wants to.
> 
> What does xchg() do?

/*
 * Atomic [test&set] exchange
 *
 *      void *xchg_u32(void *ptr, unsigned long val)
 * Changes the memory location '*ptr' to be val and returns
 * the previous value stored there.
 */

It's atomic with respect to interrupts and other CPUs.

PA-RISC 2.0 seems to have LDC{W,D}, but that's going to make implementation
a real pain.

> If it's a byte swapper, look at "PA-RISC 2.0 Architecture", by Gerry Kane
> from HP Professionl books, page I-6. That's "Programming Notes" section.
> Gives examples for "Endian byte swapping" for 32 and 64-bit quantities.
> They work - HP-UX is using them.

thanks for the tip.  No-one's written those yet; I'll do those next.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
