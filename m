Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA11834
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 10:13:10 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 1 Sep 2000 16:12:50 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13UtQf-0001PO-00; Fri, 01 Sep 2000 17:12:33 +0100
Date: Fri, 1 Sep 2000 17:12:33 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: David Huggins-Daines <dhd@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Oops in sim700.c on C360
Message-ID: <20000901171233.C1538@parcelfarce.linux.theplanet.co.uk>
References: <87zolsktgr.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87zolsktgr.fsf@linuxcare.com>; from dhd@linuxcare.com on Fri, Sep 01, 2000 at 11:44:20AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 01, 2000 at 11:44:20AM -0400, David Huggins-Daines wrote:
> <sim700.c, line 1664>:
> 
>     host = scsi_register(tpnt, sizeof(struct sim700_hostdata));
>     hostdata = (struct sim700_hostdata *)host->hostdata;
>     memset(hostdata, 0, sizeof(struct sim700_hostdata));
>     hostdata->targets = pci_alloc_consistent(NULL, PAGE_SIZE << 3, &dma_addr);

pci_alloc_consistent is a macro which indirects via hppa_dma_ops.

>     4cd8:       e8 40 00 00     b,l 4ce0 <sim700_init_host+0x90>,rp
>     4cdc:       08 07 02 5a     copy r7,r26
>     4ce0:       49 d3 00 00     ldw 0(sr0,r14),r19
>     4ce4:       34 1a 00 00     ldi 0,r26
>     4ce8:       23 24 00 00     ldil 8000,r25
>     4cec:       0e 68 10 96     ldw  4(sr0,r19),r22
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  This instruction here
>     4cf0:       37 d8 3f 11     ldo -78(sp),r24
>     4cf4:       e6 c0 20 00     be,l 0(sr4,r22),%sr0,%r31
>     4cf8:       08 1f 02 42     copy r31,rp
> 
> Looks like pci_alloc_consistent is broken...

And that's clearly hppa_dma_ops being NULL.  Before I committed the
support for PCX-S,T machines, this was initialised to pa11_dma_ops
but I now leave it uninitialised.  If the CPU detection code detects a
PCX-L or PCX-L2 CPU then hppa_dma_ops gets initialised to pa11_dma_ops.
If it detects a PCX-S or PCX-T CPU then it initialises it to fail_dma_ops
(i think richard changed the name recently?).  The CCIO support and
the SBA/LBA support initialise hppa_dma_ops with their respective
support routines.  So I deduce that the CCIO support hasn't recognised
your machine.  Perhaps we should initialise it to a routine which prints
that the PCI ops haven't been initialised and halts.

-- 
Revolutions do not require corporate support.
