From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] The new iomap interface
Date: Fri, 17 Sep 2004 13:46:12 +0100
Message-ID: <20040917124612.GS642@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Shortly after 2.6.9-rc2, Linus introduced a new way of accessing IO devices
called iomap.  This gives us the opportunity to overhaul our device IO
accessors.  Let's go over how this works:

There are various ways to get hold of an iomem cookie, such as calling
pci_iomap() or ioport_map().  One then passes this cookie to a different
set of functions ioread8(), ioread16(), ioread32(), iowrite8(),
iowrite16() and iowrite32().  When one is done with it, one calls something
like pci_iounmap() or ioport_unmap().

There are several cases we have to be able to handle.  Obviously,
we have to handle PCI/EISA/ISA io memory and PCI/EISA/ISA io ports.
It'd also be good to handle native PA io memory.  I'd like to resurrect
the USE_HPPA_IOREMAP code that Helge worked on at one point (it's really
time to do away with the rsm/mtsm around byte loads/stores).

So here's the hardware constraints.  All the EISA and PCI adapters map
IO memory space into PA memory space, but we have to do byte swapping.
The EISA adapter maps IO port space into PA memory space, but does so in
such a convoluted way that we may not be able to fulfill a request for
a contiguous chunk of ports.  The Dino PCI adapter requires reads and writes
to control registers to access port space.  Astro-based systems have a
dense mapping for IO ports into memory ... but sometimes require
additional hacks to work around bugs.  PAT-based systems have a sparse
mapping for IO ports into memory, but require an additional read to flush
the write.

Phew.  OK.  How to make that lot work?  Well .. looks to me like we want:

/*
 * Technically, this should be 'if (VMALLOC_START < addr < VMALLOC_END),
 * but that's slow and we know it'll be within the first 2GB.
 */
#define INDIRECT_ADDR(addr)     (((unsigned long)(addr) & 0x80000000) != 0)

static inline int ioread16(void __iomem *addr)
{
        if (unlikely(INDIRECT_ADDR(addr)))
                return __ioread16(addr);
        return le16_to_cpup((u16 *)addr);
}

This should be a test, a non-executed branch and a load in the direct-load
case.

Then __ioread16() can look something like ... 

struct iomem_ops {
        int (*read8)(void __iomem *addr);
        int (*read16)(void __iomem *addr);
        int (*read32)(void __iomem *addr);
        void (*write8)(u8, void __iomem *addr);
        void (*write16)(u16, void __iomem *addr);
        void (*write32)(u32, void __iomem *addr);
};

struct iomem_ops *iomem_ops[8]; 

#define ADDR_TO_REGION(addr)    (((unsigned long)addr >> 28) & 7)

int __ioread16(void __iomem *addr)
{
        return iomem_ops[ADDR_TO_REGION(addr)]->read16(addr);
}

That gives us 256MB of io space in each handler, and 8 possible handlers.
Anything that can be directly mapped like PCI io memory will be, and therefore
much quicker than the current io port ops mess.  We'll need handlers for:

0 -- ISA/EISA port space that isn't contiguous
1 -- PCI port space for Dino
2 -- PCI port space for Astro w/Elroy < 2.2
3 -- PCI port space for PAT PDC
4 -- Non-byteswapped GSC IO memory
7 -- Legacy drivers that are passing an old-style readX() cookie to the
     new-style ioreadX() functions.  Doh.

Note that these interfaces give us the opportunity to do much more work
at IO map time, and much less mucking around at IO access time.  The
design here is clearly 32-bit centric, but the macros can be ifdeffed to
work differently on 64-bit.

Comments, suggestions, alternative designs?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
