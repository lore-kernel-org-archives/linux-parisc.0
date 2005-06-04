From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [linux-usb-devel] Re: [parisc-linux] [PATCH] usb/input/hid-core.c
	extract() brain damage
Date: Sat, 4 Jun 2005 18:59:53 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0506041824180.15124-100000__15312.1504154571$1416624543$gmane$org@netrider.rowland.org>
References: <20050604174308.GA19823@colo.lackof.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: linux-usb-devel@lists.sourceforge.net,
 parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050604174308.GA19823@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 4 Jun 2005, Grant Grundler wrote:

> On Sat, Jun 04, 2005 at 11:06:52AM -0400, Alan Stern wrote:
> > In spite of the total overall number of changes required, wouldn't it be 
> > much simpler to have a suite of routines (inlines or macros) like:
> > 
> > 	get_16, put_16, get_le16, put_le16, get_be16, put_be16
> > 	get_32, put_32, get_le32, put_le32, get_be32, put_be32
> > 	get_64, put_64, get_le64, put_le64, get_be64, put_be64
> > 
> > 	in short, {get|put}_{|le|be}{16|32|64}
> 
> Sorry, no. The architectures that trap on misaligned accesses have to
> handle that in the kernel. And even though the implementations
> get simpler, a plethoria of interfaces just clutters up the general
> device driver API. For that reason alone I wouldn't want it.
> 
> The endian conversion (swap) macros are PITA already.
> I'll argue the swap API should be simplified to four macros:
> 	cpu_to_le(x), cpu_to_be(x), le_to_cpu(x), be_to_cpu(x)
> 
> and force the caller to cast to the right size. switch(sizeof(x)) would
> then select the right arch specific variant. I'll figure out how to
> pitch this to linux-arch...and then see how far it gets batted back. :^)

I don't really follow your argument.  For example, consider the swap API.  
There's nothing to stop you from defining, in your own code, those four 
macros.  Have them perform the appropriate conversion based on the type of 
x.  You don't have to use the full existing API if you don't want to.


The point I was driving at is that we currently have separate APIs for 
byte swapping and for unaligned access, and it would make a lot of sense 
to combine them into a single API.  Knowing that the bytes have to be 
swapped _and_ that the value isn't aligned correctly should allow us to 
use more efficient code (in some cases) than a simple unaligned access 
followed by a byte swap.

I also don't understand your point about architectures that trap unaligned 
accesses.  Let's put aside for one moment the question of whether it's 
better to manually load the pieces of an unaligned value versus incurring 
the overhead of a trap and a kernel fixup -- the arch-specific code is 
supposed to know which one is better so that programmers don't have to 
worry about it.  Given that unaligned accesses are implemented as traps, 
what's wrong with, for example

#define get_be16(p)	be_to_cpu((u16) get_unaligned((u16 *) (p)))

This is always a valid possibility for the arch-specific implementation of 
get_be16.  Another possibility is

static inline unsigned get_be16(void *p)
{
	u8 *q = (u8 *) p;

	return (((unsigned) q[0]) << 8) + ((unsigned) q[1]);
}

which should in fact be the generic implementation.  It will work 
regardless of whether unaligned accesses are trapped.


Is your main objection simply to the proliferation of access routines?  
It's a valid point, but better too many than too few.  Furthermore it's 
always possible to do as you said, just define get_be() and rely on the 
caller to cast the pointer to the appropriate type.


> > I realize this doesn't fit in very well with the current state of the API, 
> > but IMHO it would be a big improvement.
> 
> Not really. davem is right that it would clutter up certain parts
> of the code (e.g. networking stack).

How so?  I don't think "get_be32(p)" is more clutter-ful than 
"be32_to_cpu(get_unaligned(p))".  It's not even more clutter-ful than
"be32_to_cpu(*p)".  Certainly it's better than

	(p[0] << 24) + (p[1] << 16) + (p[2] << 8) + (p[3])

which occurs more often than I would like.


> Don't forget all the above is a NOP on 90% (x86) of the computers.

So what?  The x86-specific implementation will expand to a NOP.

> I'm annoyed that certain performance sensitive paths (e.g. TCP/IP) don't
> use macros to access unaligned data. It affects my work (ia64)
> and pet (parisc) architectures. But that's how it is and I don't
> see it changing anytime in the near future.

Then where the macros aren't used the code would remain unchanged -- until
someone decides to go in and clean it up.  That has nothing to do with the
question of whether this would be a better way to implement routines for
unaligned access.

Alan Stern

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
