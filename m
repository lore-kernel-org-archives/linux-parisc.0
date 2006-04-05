From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Wed, 5 Apr 2006 08:50:05 +0200
Message-ID: <200604050850.06058.deller@gmx.de>
References: <IX008E$FF5F5C221189CADA64719030F0E34D37@scarlet.be>
	<20060403012831.GB12037@colo.lackof.org>
	<1144152354.3425.21.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: parisc-linux@lists.parisc-linux.org
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1144152354.3425.21.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tuesday 04 April 2006 14:05, James Bottomley wrote:
> On Sun, 2006-04-02 at 19:28 -0600, Grant Grundler wrote:
> > Unfortunately not. Not unless you want to disable IO Port space access.
> > Each PCI bus controller routes 64MB of GMMIO space to 64KB of IO port space.
> > The first 4 bytes of each page maps to a unique 4 byte in IO Port space.
> > 
> > On Astro platforms, we can use 64KB in LMMIO space to access
> > IO Port space for all busses. The difference is Astro only
> > has one SBA and IOC. N-class has two. There's more to this
> > and I'm not sure of all the details at the moment.
> > 
> > 240MB is clearly not going to be enough on that machine.
> > Even on a "normal" machine, a couple of graphics cards
> > would exhaust the 240MB.  A single infiniband card could
> > exhaust the 240MB space we have now.
> 
> OK, could someone explain what we're trying to do and why?
> 
> The original PA implementation of ioremap actually had I/O space and
> memory space separated (this is almost essential on 32 bit machines with
> lots of memory).

Yes.
 
> The new implementation is trying to map our I/O space directly into
> memory.  Because of the way PA is implemented: no highmem, entire memory
> offset mapped at 0x1000000; that means the only space we have for kernel
> VM is 0-0x10000000 (On 32 bits, this offset mapping loses us the top
> 256k on 4GB machines, but that's f space anyway).  However, our vmalloc
> space is very squeezed at 240k (remember, all modules have to be in
> vmalloc space), so trying to share it with I/O mappings looks to be a
> bit of a non-starter.

Yes (240MB). 
 
> I suggest that on 32 bits, we really shouldn't alter the current scheme
> (i.e. keep the separated I/O and  memory mappings).  On 64 bits, we
> could allocate a far different VM range to vmalloc (somewhere up beyond
> the maximum possible physical memory) and thus make it far bigger, which
> would allow us to keep a mapped ioremap implementation.

Might work, although it makes the sources pretty ugly again.
The biggest problem with 64bit kernel and seperated I/O and memory mappings was, that you wasn't able to export I/O-memory via mmap() to 32bit userspace applications.
Biggest affected application was X11, who tried to mmap() the 64bit f-space region of the graphics RAM into 32bit-userspace.
This might maybe be maybe solveable with your proposal, since e.g. X11 on 32bit Kernel worked already somehow and 64bit could be solved with the mapping.

Another proposal could be to keep the current implementation on 32bit and as such not make the sources ugly again.
If a user then runs on a big iron like N4k he should use a 64bit kernel instead, which then would implement your 64bit-changes proposal.
 
> Oh, and just before anyone suggests it, we'd have incredible difficulty
> moving __PAGE_OFFSET because of the absolute<->virtual equivalence
> requirements.

Yes, that's the reason I never proposed that :-)

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
