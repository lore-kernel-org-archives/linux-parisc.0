From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel
	modules (take 4)
Date: Wed, 31 Dec 2008 12:24:56 -0600
Message-ID: <1230747896.3408.112.camel@localhost.localdomain>
References: <4959346E.7060600@gmx.de>
	 <200812310915.41693.rusty@rustcorp.com.au> <495B5806.3080505@gmx.de>
	 <alpine.LFD.2.00.0812310926450.5086@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Helge Deller <deller@gmx.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0812310926450.5086@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2008-12-31 at 09:29 -0800, Linus Torvalds wrote:
> 
> On Wed, 31 Dec 2008, Helge Deller wrote:
> >
> > [PATCH 1/2] module.c: fix module loading failure of large kernel modules
> > 
> > When creating the final layout of a kernel module in memory, allow the
> > module loader to reserve some additional memory in front of a given section.
> > This is currently only needed for the parisc port which needs to put the
> > stub entries there to fulfill the 17/22bit PCREL relocations with large
> > kernel modules like xfs.
> > 
> > Differences of this patch to previous versions:
> > - added weak funtion arch_module_section_size()
> 
> This doesn't work.
> 
> We've had this bug several times now, and one of them just very recently.
> 
> Some gcc versions will inline weak functions if they are in scope - even 
> if there is a non-weak function somewhere else. So you MUST NOT have the 
> weak definition in the same file (or indirectly called through some inline 
> functions in a header file) as the call. Because if you do, then any user 
> with the wrong version of gcc will get the weak function semantics, even 
> if it was meant to be overridden by something else.

Um, but we got told to use all these weak functions instead of the
ARCH_HAS... defines.  They certainly litter the x86 boot code.  The
standard pattern was to put the weak function in the file where it was
used, which is what you're now saying will miscompile.

Which gcc versions are the problem?  Because it's going to be a bit
painful catching and killing all the problems ... it might be better
just to patch the master kernel makefile to refuse to build with the
offending gcc versions.

James


