Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D059482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Jun 2002 06:26:25 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17EquZ-0005yC-00; Mon, 03 Jun 2002 13:26:11 +0100
Date: Mon, 3 Jun 2002 13:26:11 +0100
From: Matthew Wilcox <willy@debian.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How retrieving HPA/SPA with the device node
Message-ID: <20020603132611.I10366@parcelfarce.linux.theplanet.co.uk>
References: <3CA9BB50.1FCEBDF4@admin.france.hp.com> <20020402164417.6C6B6482A@dsl2.external.hp.com> <3CFB4D2A.F86BEDC4@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3CFB4D2A.F86BEDC4@admin.france.hp.com>; from bruno_vidal@hpfrcu03.france.hp.com on Mon, Jun 03, 2002 at 01:04:10PM +0200
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Jun 03, 2002 at 01:04:10PM +0200, Bruno Vidal wrote:
> 	Hi
> Can someone can explain what is the difference between the
> "hpa" of a scsi card (pci or not) and the "base" in the structure Scsi_Host ?
> ....
>     /* These parameters should be set by the detect routine */
>     unsigned long base;
>     unsigned long io_port;
>     unsigned char n_io_port;
>     unsigned char dma_channel;
>     unsigned int  irq; 
> ....
> 
> I'm pretty sure that it is the same, can someone say if it is wrong or not ?

I'm no expert in the SCSI layer, but it could be that base is the base
of the _chip_ and hpa is the base of the _device_.  For example, the
hpa of the serial device is 0xffd05000 but the chip itself is at 0xffd05800.
According to drivers/scsi/lasi700.c:

        unsigned long base = dev->hpa + LASI_SCSI_CORE_OFFSET;
[...]
        hostdata->base = base;

so base != hpa.  Sorry...

-- 
Revolutions do not require corporate support.
