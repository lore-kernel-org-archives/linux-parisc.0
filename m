From: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] Re: 2.6.4-rc1-pa3 siimage/NS87415 IDE progess (and
	another mystery)!
Date: Mon, 12 Jul 2004 04:37:52 +0100
Message-ID: <20040712033752.GA10163@sal.ucc.ie>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
	<20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
	<Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
	<20040711221829.GA27835@colo.lackof.org>
	<20040711231401.GW546@tausq.org> <20040711233439.GX546@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040711233439.GX546@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 11, 2004 at 04:34:39PM -0700, Randolph Chung wrote:

> > don't have an IDE drive to try it with, but if it works, shouldn't it be
> > done as a pcibios fixup instead? We already have a fixup routine in
> > drivers/parisc/superio.c:superio_fixup_pci(), so you can probably just
> > add it there.
> 
> i.e. (the progif write was removed since it's redundant):
> 
> Index: drivers/parisc/superio.c
> ===================================================================
> RCS file: /var/cvs/linux-2.6/drivers/parisc/superio.c,v
> retrieving revision 1.9
> diff -u -p -r1.9 superio.c
> --- drivers/parisc/superio.c	18 May 2004 13:08:56 -0000	1.9
> +++ drivers/parisc/superio.c	11 Jul 2004 23:33:06 -0000
> @@ -482,6 +482,16 @@ void superio_fixup_pci(struct pci_dev *p
>  	pci_write_config_byte(pdev, PCI_CLASS_PROG, pdev->class);
>  
>  	pci_read_config_byte(pdev, PCI_CLASS_PROG, &prog);
> +
> +	/* IODC clobbers the CTRL registers with:
> +	 * CTRL1 = 0xf0 = "ATAPI buffer mode (no prefetching)" for everyone
> +	 * CTRL2 = 0x03 = mask chan1/2 interrupts
> +	 * CTRL3 = 0x00 = "disable prefetch buffer"/"Master Wait States"
> +	 */
> +	pci_write_config_byte(pdev, 0x40, 0xf0); /* IDE_CTRL1 */
> +	pci_write_config_byte(pdev, 0x41, 0x00); /* IDE_CTRL2 */
> +	pci_write_config_byte(pdev, 0x42, 0x00); /* IDE_CTRL3 */
> +
>  	printk("PCI: Enabled native mode for NS87415 (pif=0x%x)\n", prog);
>  }
>  
> 
> works fine on my c3750 with a cdrom drive too! Great job Grant :)

Tested above patch, but unfortunately it didn't work for me,
the NS87415 still doesn't use DMA (or so it seems, at least it's
still the 3MB/s instead of the expected 30-40MB/s).

hdparm -c /dev/hda showed DMA was turned on, and I even set it on
again (hdparm -c 1), just to be sure, but it didn't make any
difference in performance :(

Thanks,
   Max


PS: shall I try Grant's patch aswell?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
