Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA29740
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Nov 2000 03:24:11 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 10 Nov 2000 10:26:07 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13uBG4-0003NY-00; Fri, 10 Nov 2000 10:18:08 +0000
Date: Fri, 10 Nov 2000 10:18:08 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com, jgarzik@mandrakesoft.com,
        davem@redhat.com
Subject: Re: [parisc-linux] tulip DMA mapping
Message-ID: <20001110101808.B11268@parcelfarce.linux.theplanet.co.uk>
References: <200011092012.MAA06943@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011092012.MAA06943@milano.cup.hp.com>; from grundler@cup.hp.com on Thu, Nov 09, 2000 at 12:12:25PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 09, 2000 at 12:12:25PM -0800, Grant Grundler wrote:
> 0 is a valid pci_map_single() return value when the system has an IO MMU.

Oh dear.  You can bet tulip won't be the only driver which assumes it
isn't a valid return value.  Can't our IOMMU code be limited in such a
way that 0 is not a valid return value?  Say, constrain all allocated
addresses to the top half of the device bus?

(um, just check me on this, map_single returns a device bus address,
not a processor bus address, right?)

> The system will panic before pci_map_single() will fail.
> The driver needs to remember some other way if a buffer was mapped or not.
> Or the Documentation/DMA-mapping.txt should be changed - ie add this
> to the interface definition and I can reserve the 1st mapping
> entry so no-one uses it.

we should probably have a BAD_DMA_ADDR define which that array should be
initialised to.  it's a little late in 2.4 to go through and audit all
the drivers again.

> Should I be mailing Jeff Garzik <jgarzik@mandrakesoft.com> directly?
> Or can someone who knows Jeff point this out to him?

i've cc'd jeff & dave miller on this.

-- 
Revolutions do not require corporate support.
