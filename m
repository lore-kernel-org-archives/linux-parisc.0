Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA12130
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 10:26:25 -0600
Received: from user33-49.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.33.49)
  by mailserv2.iuinc.com with SMTP; 1 Sep 2000 16:26:31 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C8646B005; Fri,  1 Sep 2000 17:26:02 +0100 (BST)
Date: Fri, 1 Sep 2000 17:26:02 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Oops in sim700.c on C360
Message-ID: <20000901172602.K877@linuxcare.com>
References: <87zolsktgr.fsf@linuxcare.com> <20000901171233.C1538@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000901171233.C1538@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Fri, Sep 01, 2000 at 05:12:33PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 01, 2000 at 05:12:33PM +0100, Matthew Wilcox wrote:
> And that's clearly hppa_dma_ops being NULL.  Before I committed the
> support for PCX-S,T machines, this was initialised to pa11_dma_ops
> but I now leave it uninitialised.  If the CPU detection code detects a
> PCX-L or PCX-L2 CPU then hppa_dma_ops gets initialised to pa11_dma_ops.
> If it detects a PCX-S or PCX-T CPU then it initialises it to fail_dma_ops
> (i think richard changed the name recently?).  The CCIO support and
> the SBA/LBA support initialise hppa_dma_ops with their respective
> support routines.  So I deduce that the CCIO support hasn't recognised
> your machine.  Perhaps we should initialise it to a routine which prints
> that the PCI ops haven't been initialised and halts.


        switch (boot_cpu_data.cpu_type) {
        case pcx:
        case pcxs:
        case pcxt:
                hppa_dma_ops = &pcx_dma_ops;
                break;
        case pcxl2:
                pa7300lc_init();
        case pcxl: /* falls through */
                hppa_dma_ops = &pcxl_dma_ops;
                break;
        default:
                break;
        }

I changed fail_dma_ops to pcx_dma_ops because the only difference between
the two sets of machines is that pci_alloc_consistent fails on pcx.  The
other functions referenced by hppa_dma_ops are still valid (pci_map_single,
for example), and are used in sim700 and lasi_82596.

Richard
