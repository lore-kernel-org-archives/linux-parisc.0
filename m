Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA08862
	for <parisc-linux@puffin.external.hp.com>; Tue, 22 Jun 1999 04:05:34 -0600
Date: Tue, 22 Jun 1999 12:05:29 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>, larry_dwyer@hp.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX binary compatibility
Message-ID: <19990622120529.W30362@mencheca.ch.genedata.com>
References: <19990622114518.U30362@mencheca.ch.genedata.com> <E10wNB1-0006vf-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E10wNB1-0006vf-00@the-village.bc.nu>; from Alan Cox on Tue, Jun 22, 1999 at 10:49:10AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 22, 1999 at 10:49:10AM +0100, Alan Cox wrote:
> > I'm not entirely sure what to do about signals.  Linux has only one signal
> > which HP/UX does not -- SIGSTKFLT.  As I said, I reused _SIGGFAULT as
> > we don't have a use for it in Linux (yet?).  What do you think is the
> 
> I don't think we use SIGSTKFLT either do we ...

Oh, you're right.

mrw@mencheca:/usr/src/parisc/linux$ find . -type f |xargs grep SIGSTKFLT
./include/asm-arm/signal.h:#define SIGSTKFLT    16
./include/asm-i386/signal.h:#define SIGSTKFLT   16
./include/asm-m68k/signal.h:#define SIGSTKFLT   16
./include/asm-parisc/signal.h:#define SIGSTKFLT 36
./include/asm-ppc/signal.h:#define SIGSTKFLT    16

So not only don't we currently use it, the alpha, mips, sparc and sparc64
ports don't have it.  Would a patch to remove it from all architectures
be accepted, do you think?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
