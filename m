From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: parisc: pcibios_init_bus() isn't called
Date: Mon, 16 Jun 2008 16:41:07 -0600
Message-ID: <20080616224107.GA32030@colo.lackof.org>
References: <20080615161327.GC7865@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Adrian Bunk <bunk@kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080615161327.GC7865@cs181133002.pp.htv.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 15, 2008 at 07:13:27PM +0300, Adrian Bunk wrote:
> arch/parisc/kernel/pci.c:pcibios_init_bus() never gets called - this
> doesn't seem to be intentionally?

I think this is accidentally abandoned code and introduced here:
    http://lkml.org/lkml/2001/12/22/43

So it was called from pci_do_scan_bus(). Can you track down when this
was removed from pci_do_scan_bus() ?

But it was once used by parisc port:
    http://lists.parisc-linux.org/pipermail/parisc-linux/2001-June/037259.html

and then perhaps got removed soon after in the generic code:
    http://www.cs.helsinki.fi/linux/linux-kernel/2003-01/0388.html

But I'm not finding the exact patch that removed it.

thanks,
grant
