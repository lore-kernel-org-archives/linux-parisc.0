Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 437FE4843
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 11:43:46 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AlYBd-0006ZJ-K5; Tue, 27 Jan 2004 18:43:45 +0000
Date: Tue, 27 Jan 2004 18:43:45 +0000
From: Matthew Wilcox <willy@debian.org>
To: Naresh Kumar <knaresh@india.hp.com>
Subject: Re: [parisc-linux] Using PAT_IO calls for PCI config space reads and
	writes.
Message-ID: <20040127184345.GD11844@parcelfarce.linux.theplanet.co.uk>
References: <401623CA.59AE3CCD@india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <401623CA.59AE3CCD@india.hp.com>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Jan 27, 2004 at 02:09:38PM +0530, Naresh Kumar wrote:
> --------------------START------------------------------------------------------------------------------
> 
> --- lba_pci.c.1.54       Fri Jan 23 15:47:41 2004
> +++ lba_pci.c.modified   Fri Jan 23 15:53:15 2004
> @@ -504,6 +504,13 @@ lba_rd_cfg(struct lba_device *d, u32 tok
>         return(data);
>  }
> 
> +#ifdef __LP64__
> +#define PAT_CFG_READ(a,b,c)    pdc_pat_io_pci_cfg_read(a,b,c)
> +#define PAT_CFG_WRITE(a,b,c)   pdc_pat_io_pci_cfg_write(a,b,c)
> +#else
> +#define PAT_CFG_READ(a,b,c)
> +#define PAT_CFG_WRITE(a,b,c)
> +#endif

Hmm.  Why the abstraction?  The normal way to do this is to define dummy
functions when they can't be called.  See include/asm-parisc/pdc.h:

#else /* !__LP64__ */
/* No PAT support for 32-bit kernels...sorry */
#define pdc_pat_get_irt_size(num_entries, cell_numn)    PDC_BAD_PROC
#define pdc_pat_get_irt(r_addr, cell_num)       PDC_BAD_PROC

I actually think the right way to handle this is probably like this:

#define pat_cfg_addr(bus, devfn, addr) ((bus << 16) | (devfn << 8) | addr)

static int pat_cfg_read(struct pci_bus *bus, unsigned int devfn, int pos, int size, u32 *data)
{
	int tok = pat_cfg_addr(bus->number, devfn, pos);
	int ret = pdc_pat_io_pci_cfg_read(tok, size, &data);
	return (ret == SUCCESS);
}

... same for write here ...

static struct pci_ops pat_cfg_ops = {
	.read = pat_cfg_read,
	.write = pat_cfg_write,
};

And then choose whether to use pat_cfg_ops or lba_cfg_ops at probe time.

> +/**
> + * pdc_pat_io_pci_cfg_read - Read PCI configuration space.
> + * @pci_addr: PCI configuration space address for which the read
> request is being made.
> + * @pci_size: Size of read in bytes. Valid values are 1, 2, and 4.
> + * @mem_addr: Pointer to return memory buffer.
> + *
> + */
> +int pdc_pat_io_pci_cfg_read(unsigned long pci_addr, int pci_size, void
> *mem_addr)
> +{
> +       int retval;
> +       spin_lock_irq(&pdc_lock);
> +       retval = mem_pdc_call(PDC_PAT_IO, PDC_PAT_IO_PCI_CONFIG_READ,
> __pa(pdc_result),
> +                             pci_addr, pci_size);
> +       memcpy((char *)mem_addr, (char *) ((char *)pdc_result +
> (sizeof(unsigned long) - pci_size))
> , pci_size);
> +       spin_unlock_irq(&pdc_lock);
> +
> +       return retval;
> +}

I don't see why you need a memcpy, the data should be sufficiently aligned.
Casting to the right data type should be enough.

> A couple of questions:
> 1. In the definition of 'pdc_pat_io_pci_cfg_read( )' and
> 'pdc_pat_io_pci_cfg_write( )' above, can I  use 'cpu_to_le64( )' kind of
> function instead of ordering the bytes manually in the 'memcpy( )'?
> 2. Can these changes be propagated to 2.6 also?

You should be developing against 2.6 in the first place.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
