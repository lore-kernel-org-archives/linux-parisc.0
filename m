From: Kyle McMartin <kyle@infradead.org>
Subject: Re: Possible accelerated X on PA-RISC with kernel modesetting --
	anyone investigating?
Date: Sat, 14 Mar 2009 21:46:21 -0400
Message-ID: <20090315014621.GF3167@bombadil.infradead.org>
References: <b4198de60903141802p14f3d7f8ra33ba382ae6b8d85@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Matt Turner <mattst88@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <b4198de60903141802p14f3d7f8ra33ba382ae6b8d85@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Apologies for the wordiness of this mail, it's been a struggle to
remember some of the details, and I haven't really thought about this
since 2006 or early 2007. Also, apologies in advance for any incorrect
facts here, this stuff isn't very well documented and I've never worked
for HP so I don't have access to the confidential docs.

The short answer is, I don't think this will really work, but I don't
mean to phrase this in such a way to discourage anyone from trying.

On Sat, Mar 14, 2009 at 09:02:45PM -0400, Matt Turner wrote:
> Hi,
> 
> It hasn't been possible to use X on PA-RISC without unaccelerated
> fbdev to my knowledge.
> 
> Evidently [*], there is a possibility of this changing relatively soon
> via Radeon kernel modesetting.
> 
> Is anyone aware of this development? Is anyone interested in
> accelerated X on PA-RISC? Is anyone investigating what it will take to
> support PA-RISC?
> 
> R500 and R600 Radeon PCI cards are cheap, and will be supported. I
> guess the C8000 has larger performance problems to worry about, but
> the AGP slot it offers would open up the selection of graphics cards
> to include much faster R600-series cards, and future cards if they
> ever produce more AGP compatible ones.
> 
> I'd sure be nice to put an X1550 or 2400HD in my J6700 and have an
> accelerated desktop.
> 

[[ Glossary:
- rope: the thing which connects the IO controller (Astro) and the 
  IO adapter (Elroy), an elroy has a pci bus behind it.
  An elroy can be single roped, or double roped, which distributes
  an address range to the PCI bus behind the elroy. There's 8 ropes to
  an Astro/Pluto, they may not all point somewhere.
- LMMIO: less-than-4GB mmio (the limited (256MB - 16MB (iirc)) 32-bit
  IO space.
- GMMIO: greather-than-4GB mmio
- DAC: double address cycle, 64-bit pci BARs
- distributed range: a $n-MB IO-space divided evenly across all ropes
- directed range: limited $n-MB (0, or 8 to 64MB) directed at a single
  rope.]]

The problem with basically every modern graphics card is mapping the
framebuffer. PDC will give the finger to anything with a framebuffer
bar bigger than 128M (maybe even 128M on some models) and we don't have
anything near the infrastructure right now to reprogram the elroy and
astro range registers to route pci devices.

Ontop of that, it's actually extremely difficult to map 256MB
framebuffers with elroy because of the way distributed and directed
ranges work. I can't remember all the details, because of how long
it's been, but I believe:

LMMIO directed ranges (of which there are 3) are maximum 64MB in size,
which means we can map only 64MB*3 to one card, max, plus however
much distributed range (up to 64MB each rope) is allocated to that rope.

The basic means that each PCI bus behind an elroy gets at most 64MB,
plus up to 192MB of directed MMIO.

I don't know if the newer cards can do DAC, but if they can, then we
could at least use the distributed GMMIO (greater-than-4GB mmio)
range to map a wide swath to every rope, which /would/ work.

(My C8000 won't boot with a PCI r500 card in it, it fails during PDC
 init, sadly. I think it was a X1300 or something.)

I cannot off-hand recall the address map on Astro, but I believe
you have 3.75GB of memory, 16MB of PDC space, and 240MB of IO-space for
all cards. Because of the need for a distributed range (otherwise you
don't have enough directed ranges for all the ropes.) of at least 8MB
in size (so 1MB per rope), you only have 232MB of space left.

The reason for all of this is because Astro workstations are
fundamentally still 32-bit, so you want to maximize the amount of useful
RAM they had below 4GB.

On Pluto (aka: C8000) the zx1 address map gives us a full GB or two
of less than 32-bit address space, since all zx1 machines are proper
64-bit machines and can address RAM above 4GB.

On something like a J6000 you have 3 pci slots each behind their own
elroy, and thus, their own rope.

... Hmm, I should probably write this all up on the wiki or something.

I have (some) code that's capable of dropping all the ranges on my
C3000, and then reprogramming it in a somewhat more optimal way, but
I don't know where it's gone in the intervening 3 years or so. :/

Feel free to hit me up if you have any other questions. I'd appreciate
it if any current or former HP folks could correct anything I'd said
here that might be incorrect, since the public documentation is fairly
non-existant I've had to try to fill in the blanks where I can.

Thanks for listening, Kyle
