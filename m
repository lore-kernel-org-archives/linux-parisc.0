From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] LBA PCI : avoid crash when pluging a pcmcia bridge
Date: Wed, 15 Nov 2006 05:23:52 -0700
Message-ID: <20061115122352.GH19143@parisc-linux.org>
References: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
	<20061115080022.GB30664@colo.lackof.org>
	<20061115122506.523bdd01.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061115122506.523bdd01.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Nov 15, 2006 at 12:25:06PM +0100, Guy Martin wrote:
> It looks like pci_find_bus() return non null for the pcmcia bridge.
> 
>         if (pci_find_bus(pci_domain_nr(b), bus)) {
>                 /* If we already got to this bus through a different bridge, ignore it */
>                 pr_debug("PCI: Bus %04x:%02x already known\n", pci_domain_nr(b), bus);
>                 goto err_out;
>         }

Oh.  So we got a bus numbering conflict.  Yay.

> With PCI_DEBUG and some more printk() I can see this in my dmesg :
> 
> PCI: Found 0000:01:06.0 [1180/0475] 000607 02
> PCI: Calling quirk 102564c8 for 0000:01:06.0
> PCI: Fixups for bus 0000:01
> PCI: Scanning behind PCI bridge 0000:01:06.0, config 000000, pass 0
> PCI: Scanning behind PCI bridge 0000:01:06.0, config 000000, pass 1
> PCI: Bus scan for 0000:01 returning with max=05
> PCI: Enabling bus mastering for device 0000:01:06.0
> PCI: Bus 0000:02 already known
> PCI: Reached err_out:
> 
> Let me know if you need anything else.

I bet a plain lspci will show a bus 2 elsewhere (probably one of the
root busses).  ie: we need to renumber all our busses, just like we do
for Dino.  Either that, or start using PCI domains, but I'd rather not
go there just yet.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
