From: Kyle McMartin <kyle@infradead.org>
Subject: Re: HPMC bus timeout on C3600
Date: Sat, 20 Dec 2008 17:16:53 -0500
Message-ID: <20081220221653.GA12880@bombadil.infradead.org>
References: <20081220133915.4c167e09@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081220133915.4c167e09@bleh.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Dec 20, 2008 at 01:39:15PM +0100, Guy Martin wrote:
> I'm recently running into HPMC bus timeout problem. While this never
> caused any problem before, I've noticed a few strange things. I've
> attached the output I get from "pim hpmc" in the PDC.
> 
> This BUS timeout occurs after one or two days of idling when I plug a
> specific card reader in the USB PCI card I plugged in. I think this
> card reader causes problems because it's being polled every 2-3 seconds.
> 
> Nevertheless, looking at the pdc output, it seems that the OS HPMC
> handler is not kicking off according to the chassis code CBF2 and CBFC.
> CBF2 : bas OS HPMC len
> CBFC : OS HPMC br err
> 
> I've check GR02 and it points to inw() which makes sens. Nothing
> interesting there.
> 
> The failing device appears to be the built-in NIC according the path
> provided in the output (10/0/12/0) and the C3600 service manual (figure
> 5-2).
> 
> Even if this look HW pb, I've had a few reports recently about HPMC PCI
> timeout issues and I have a few doubts.
> 
> Now my questions are :
>  - does this look like an HW or SW problems ?
>  - why isn't the HPMC handler kicked off ?
>  - could the HPMC handler recover this ?
>  - what debug can I enable to get more info about this if applicable ?
> 

"bus timeout" usually means we tried to read an address that doesn't
respond. that is, nothing on the bus accepted the transaction for it,
so it timed out and HPMC'd the box.

what you really need is the IIR, and the address it tried to access
(both the kernel vaddr which will be in the register, and the "system
requester address" from the hpmc dump which will be the physical address
mapped.

not sure why the hpmc handler is getting skipped, that's a little weird.

you can try hacking elroy to set softfail mode on that bus, which will
result in a timeout on the pci bus to return -1 (like what x86 and most
other architectures do) rather than hang the box, but it really likely
means a driver bug.
