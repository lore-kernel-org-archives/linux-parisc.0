From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Sat, 21 Oct 2006 00:19:44 -0600
Message-ID: <20061021061944.GA24732@colo.lackof.org>
References: <J6YR5K$1938FDCB7E5B1C4FE794753632F5E240@scarlet.be>
	<20061012010426.GA18624@colo.lackof.org>
	<4538BB5F.5040703@scarlet.be>
	<20061020155059.GB23094@colo.lackof.org>
	<453904E4.60608@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <453904E4.60608@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Oct 20, 2006 at 05:18:28PM +0000, Joel Soete wrote:
> >>> chainid_mask 0xfff80000
> >
> >This second chainid_mask is 13 bits wide.
> mmm sorry how do you compute this wide value?

Count the number of contiguous bits set to 1.
bit 31 to bit 19 is 13 bits.

> Btw I just discover an interesting comment in rope.h
> >/*
> >** IOC supports 4/8/16/64KB page sizes (see TCNFG register)
> >** It's safer (avoid memory corruption) to keep DMA page mappings
> >** equivalently sized to VM PAGE_SIZE.
> >**
> [snip]
> >**
> >** PAGE_SIZE could be greater than IOVP_SIZE. But not the inverse.
> >*/
> 
> and specialy:
> > ** It's safer (avoid memory corruption) to keep DMA page mappings
> > ** equivalently sized to VM PAGE_SIZE.
> 
> which was related to the original question I didn't reach to explain better.

The "avoid memory corruption" refers to the fact the we are likely
to map *more* address space than the device actually will DMA to.
If the device is doing DMA to 4K and we map 64k, than means there
is 60k more DMA address space the device can write to than it needs
permission to. The trade-off is between efficiency in creating
DMA mappings (reducing the number of mappings) and how much
address space we actually use.

> So even if I don't understand why, we have to limits the number of iotlb 
> entries to 256 (without doc I just accept it).

No. The number of IO TLB entries is implemented in HW.
The SW (e.g. ccio) only controls the number IO Pdir entries and
thus the total amount to DMA that can be mapped at the one time.

The size of a page (as seen from IO) is just much simpler to manage
when it's the same size of a page as seen by the CPU.
I need a really good reason to make things more complex.
And in this case I don't have a reason. I just want to enable
someone else to experiment if they have time or reason to do so.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
