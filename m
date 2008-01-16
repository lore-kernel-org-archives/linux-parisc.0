From: "rubisher" <rubisher@scarlet.be>
Subject: ccio-dma.c: struct ioa_registers{} shouldn't be volatile?
Date: Wed, 16 Jan 2008 11:10:49 +0100
Message-ID: <JUQEY1$B4C92480AFB9CFEC8FC7ADE071B4DB88@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "linux-parisc" <linux-parisc@vger.kernel.org>,
	"dave" <dave@hiauly1.hia.nrc.ca>
To: "matthew" <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


> On Tue, Jan 15, 2008 at 11:29:37AM +0100, rubisher wrote:
> > Hello Dave,
> > 
> > Compiling p-l with gcc-4.2 I see new warning "discards qualifiers from pointer
> > target type":
> 
> Joel, this is a standard C question ... this list really isn't for
> teaching people how to program.
> 
mmm, it's not because you don't know how to translate your programming idea in
C that you don't know how to program, though ;-)

> > /SRCTREE/drivers/net/lib82596.c:388: warning: passing argument 2 of
> > 'dma_cache_sync' discards qualifiers from pointer target type
> 
> You're passing a volatile pointer to a function which is expecting a
> non-volatile pointer.  That's potentially dangerous, so gcc warns about
> it.
> 
> The normal way to fix this would be to add a volatile attribute to the
> argument in question:
> 
> dma_cache_sync(struct device *dev, volatile void *vaddr, size_t size,
>                enum dma_data_direction direction)
> 
So may be this ccio-dma.c structure:
struct ioa_registers {
        /* Runway Supervisory Set */
        int32_t unused1[12];
        u32     io_command;     /* Offset 12 */
        u32     io_status;      /* Offset 13 */
        u32     io_control;     /* Offset 14 */
        int32_t unused2[1];

        /* Runway Auxiliary Register Set */
        u32     io_err_resp;    /* Offset  0 */
        u32     io_err_info;    /* Offset  1 */
        u32     io_err_req;     /* Offset  2 */
        u32     io_err_resp_hi; /* Offset  3 */
        u32     io_tlb_entry_m; /* Offset  4 */
        u32     io_tlb_entry_l; /* Offset  5 */
        u32 unused3[1];
        u32     io_pdir_base;   /* Offset  7 */
        u32     io_io_low_hv;   /* Offset  8 */
        u32     io_io_high_hv;  /* Offset  9 */
        u32 unused4[1];
        u32     io_chain_id_mask;/* Offset 11 */
        u32 unused5[2];
        u32     io_io_low;      /* Offset 14 */
        u32     io_io_high;     /* Offset 15 */
};

a member of:

struct ioc {
        struct ioa_registers __iomem *ioc_regs;      /* I/O MMU base address */
        u8              *res_map;               /* resource map, bit == pdir
entry */
[snip]
};

"struct ioa_registers" I guess according to its name represent the layout of
internal ioa registers and should be 'qualified' as volatile to prevent gcc to
reorganize it?

e.g.
typedef volatile struct ioa_registers v_ioa_regs_t;

and
struct ioc {
        v_ioa_regs_t __iomem *ioc_regs;      /* I/O MMU base address */
[snip]
};


Tx,
    r.
---
Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
http://www.scarlet.be/
