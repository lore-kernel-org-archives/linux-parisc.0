Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA00423
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Nov 2000 04:12:18 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 10 Nov 2000 11:14:12 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 39314B007; Fri, 10 Nov 2000 11:12:20 +0000 (GMT)
Date: Fri, 10 Nov 2000 11:12:20 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "David S. Miller" <davem@redhat.com>
Cc: matthew@wil.cx, grundler@cup.hp.com, parisc-linux@thepuffingroup.com,
        jgarzik@mandrakesoft.com
Subject: Re: [parisc-linux] tulip DMA mapping
Message-ID: <20001110111220.J32715@linuxcare.com>
References: <200011092012.MAA06943@milano.cup.hp.com> <20001110101808.B11268@parcelfarce.linux.theplanet.co.uk> <200011101016.CAA12058@pizda.ninka.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011101016.CAA12058@pizda.ninka.net>; from davem@redhat.com on Fri, Nov 10, 2000 at 02:16:11AM -0800
List-ID: <linux-parisc.vger.kernel.org>

I've quoted the whole of Grants message below, so you can see the
context.  It looks like tulip is treating zero as meaning it
doesn't have anything to pci_unmap...

Grant Grundler wrote:
> Hi all,
> I see a "bug" in tulip's usage of mapping services.
> It's not the bug I was looking for unfortunately.
> 
> In line 217 of drivers/net/tulip/interrupt.c:
> 
>         if (tp->tx_buffers[entry].mapping)
>                 pci_unmap_single(tp->pdev,
>                                 tp->tx_buffers[entry].mapping,
>                                 sizeof(tp->setup_frame),
>                                 PCI_DMA_TODEVICE);
> 
> 0 is a valid pci_map_single() return value when the system has an IO MMU.
> 
> The system will panic before pci_map_single() will fail.
> The driver needs to remember some other way if a buffer was mapped or not.
> Or the Documentation/DMA-mapping.txt should be changed - ie add this
> to the interface definition and I can reserve the 1st mapping
> entry so no-one uses it.

Richard


On Fri, Nov 10, 2000 at 02:16:11AM -0800, David S. Miller wrote:
>    Date: Fri, 10 Nov 2000 10:18:08 +0000
>    From: Matthew Wilcox <matthew@wil.cx>
> 
>    > Should I be mailing Jeff Garzik <jgarzik@mandrakesoft.com> directly?
>    > Or can someone who knows Jeff point this out to him?
> 
>    i've cc'd jeff & dave miller on this.
> 
> In 2.4.x there is _NO_ error return from the PCI dma functions except
> the consistent DMA mapping ones.
> 
> This was an explicit design decision, the dynamic mapping functions
> should never fail, and if they do it is a hard error.
> 
> Therefore no drivers need to check for failure, as far as they are
> concerned, there is no failure.
> 
> So what is the issue?  In 2.5.x I'll add an error return facility
> (BTW: -1 ie. 0xfffffff would probably work as an error value on all
>  platforms :-)
> 
> Later,
> David S. Miller
> davem@redhat.com
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
