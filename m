From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: parisc: add barriers to mmio accessors
Date: Tue, 3 Jun 2008 10:29:25 -0400
Message-ID: <20080603142925.GB31771@phobos.i.cabal.ca>
References: <20080603054212.GA31771@phobos.i.cabal.ca> <20080603124229.GA8434@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080603124229.GA8434@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 03, 2008 at 06:42:29AM -0600, Matthew Wilcox wrote:
> Are you sure this is correct?  Seems to me it should be:
> 
> 	q = ((unsigned long long)q_hi << 32) | q_lo;
> 
> I would have thought GCC would complain about a shift exceeding the
> width of the type.
> 

I probably fat fingered the braces.

> A third thing is that you're doing this to the __raw_ variants which
> don't have to be serialised.  How about we keep the current definitions of
> __raw_readX/__raw_writeX, define the regular readX/writeX to be the inline
> assembler you've just posted, and add new defines of __readX/__writeX
> as byteswapping versions of __raw_readX/__raw_writeX?
> 

I was just going to define them all in terms of this... since, well,
performance is mostly irrelevant.

> [For those who aren't on linux-arch, there's just been a long thread
> about the semantics of the different accessors and the above reflects my
> understanding of that thread.]
> 
> Should we add memory clobbers to gsc_readX/gsc_writeX?
> 

Yeah, I think so (although, I really hope GCC won't reorder serializing
instructions like rsm/ssm. ;-)

