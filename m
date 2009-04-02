From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: can't compile kernel for parisc
Date: Thu, 2 Apr 2009 11:55:04 -0400
Message-ID: <20090402155504.GD14159@bombadil.infradead.org>
References: <a4423d670903180455u20ead146k919426a1fb7276c6@mail.gmail.com> <20090318140026.7F06C4FA9@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Alexander Beregalov <a.beregalov@gmail.com>,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090318140026.7F06C4FA9@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Mar 18, 2009 at 10:00:26AM -0400, John David Anglin wrote:
> > ld: arch/parisc/kernel/built-in.o(.text+0xc84): cannot reach
> > 000000b2_b2:46+4068, recompile with -ffunction-sections
> > ld: arch/parisc/kernel/built-in.o(.text+0xc84): cannot handle
> > R_PARISC_PCREL12F for .text
> > 
> 
> -ffunction-sections won't work because GCC doesn't generate calls
> with instructions that would use a R_PARISC_PCREL12F relocation.
> This is some kind of conditional branch.  Probably, it's in some
> kernel assembly code.
> 
> You need to use nm, objdump and/or readelf to determine which file
> contributing to built-in.o contains the branch.  I looked in one of
> my builds and didn't see this relocation.
> 

This is... somewhat special. I've never seen this either. Possibly I
should install a Gentoo machine so I can reproduce with their toolchain?

objdump -dr arch/parisc/kernel/built-in.o | grep PCREL12F should tell
you where the problem is. I agree with JDA, judging by the fact that
it's the kernel/built-in.o, I would guess it's assembler as well.

(Sorry for taking so long to get to this thread, I must have missed it
 while I was in Boston.)

regards, Kyle
