From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: parisc: fix io accessors for generic byteorder.h
Date: Sun, 07 Dec 2008 22:09:55 -0800
Message-ID: <1228716595.5998.3.camel@brick>
References: <20081208044317.GB9092@bombadil.infradead.org>
	 <1228712159.5998.2.camel@brick>
	 <20081208045829.GF9092@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208045829.GF9092@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2008-12-07 at 23:58 -0500, Kyle McMartin wrote:
> On Sun, Dec 07, 2008 at 08:55:59PM -0800, Harvey Harrison wrote:
> > On Sun, 2008-12-07 at 23:43 -0500, Kyle McMartin wrote:
> > > These were using __fswabX which is marooned in <linux/byteorder/swab.h>
> > > instead we'll just use the __arch_swabX defines from <asm/byteorder.h>
> > > 
> > 
> > Sorry I missed this usage :-/
> > 
> > Any reason not to just use __swab16 __swab32 __swab64?  I'd like to keep
> > the __arch helpers confined to swab.h only.
> > 
> 
> Not particularly, I believe the idea of using fswabX was to Make Damned
> Sure(tm) that gcc wouldn't eliminate the expression by being too smart
> for its own good. It's probably fine now, though I have half a mind to
> just fold it in.

By fold it in, I take it to mean, write them as static inlines rather
than macros, if so, I definitely approve.

Harvey

