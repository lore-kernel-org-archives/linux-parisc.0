From: "rubisher" <rubisher@scarlet.be>
Subject: ccio_clear_io_tlb() and __raw_write() more question?
Date: Wed, 16 Jan 2008 13:53:25 +0100
Message-ID: <JUQMH1$0E837D5F7A1526B30DCF5BF1A8BE2816@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "Grant Grundler" <grundler@parisc-linux.org>
To: "linux-parisc" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello all,

I would try to explain my worry about this function.

It is:
static CCIO_INLINE void
ccio_clear_io_tlb(struct ioc *ioc, dma_addr_t iovp, size_t byte_cnt)
{
        u32 chain_size = 1 << ioc->chainid_shift;

        iovp &= IOVP_MASK;      /* clear offset bits, just want pagenum */
        byte_cnt += chain_size;

        while(byte_cnt > chain_size) {
                __asm__ __volatile__ ("# ccio_clear_io_tlb-in");
                WRITE_U32(CMD_TLB_PURGE | iovp, &ioc->ioc_regs->io_command);
                __asm__ __volatile__ ("# ccio_clear_io_tlb-out");
                iovp += chain_size;
                byte_cnt -= chain_size;
        }
}

Without doc I guess that this call to WRITE_U32() is supposed to do what it
name says: i.e purge a TLB entry?

In details:
#define WRITE_U32(value, addr)  __raw_writel((value), (addr))

and finaly:
static inline void __raw_writel(unsigned int b, volatile void __iomem *addr)
{
        __asm__ __volatile__ ("# __raw_writel-in");
        *(volatile unsigned int __force *) addr = b;
        __asm__ __volatile__ ("# __raw_writel-out");
}

I just added __asm__ to see excatly how __raw_write() is assembled:

        # __raw_writel-in
#NO_APP
        stw %r19,48(%r28)
#APP
        # __raw_writel-out

Otoh, ioc->ioc_regs is set in:
static int __init ccio_probe(struct parisc_device *dev)
{
[snip]      
        ioc->ioc_regs = ioremap_nocache(dev->hpa.start, 4096);
[snip]
};

and according to __ioremap comment:
/*
 * Remap an arbitrary physical address space into the kernel virtual
 * address space.
 *
[snip]
 */

ioc_regs contains well a virtual address (what seems to me coherent with paper
on iommu design previously mentioned)?

puting all those stuff togther: for CPU, WRITE_U32 (aka __raw_writel), just
write something at some virtual address, right?

So my worry is that this data write could be cached and btw the actual
CMD_TLB_PURGE operation could be delay untill this entry would be purged?

What's your opinion?
What would be the best way to actualy do this write (back) to the io ctrlr?

Tx again,
  r.
---
Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
http://www.scarlet.be/
