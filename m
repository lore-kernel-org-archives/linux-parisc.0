Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA26493
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Aug 2000 09:03:29 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 24 Aug 2000 15:03:24 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 24 Aug 2000 15:02:41 -0000
Date: Thu, 24 Aug 2000 09:58:15 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Cc: rhirst@linuxcare.com
Subject: Re: linux-2.3 rhirst
Message-ID: <20000824095815.B29677@vodka.thepuffingroup.com>
References: <200008240856.CAA20660@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200008240856.CAA20660@puffin.external.hp.com>; from Richard Hirst on Thu, Aug 24, 2000 at 02:56:04AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 24, 2000 at 02:56:04AM -0600, Richard Hirst wrote:
> Log message:
> Changed to use pci_alloc_consistent, pci_map_single, etc. using patches
> from Bob Pflederer.  Handles systems with and without consistent memory,
> based on whether or not pci_alloc_consistent() fails.

> pci_alloc_consistent() always succeeds atm, so I have patched the driver
> to fall back to dma_cache_wback/inv regardless.

that's no longer the case since Tuesday :-)

pci_alloc_consistent will now fail on PCX-S and PCX-T machines.  PCX-L
and PCX-L2 machines set the hppa_dma_ops to succeed (use Uncacheable
pages) and PCX-T', PCX-U and upwards all have IOMMUs that will set the
hppa_dma_ops to something appropriate.

i'm sure that the tables in the kernel for mapping from hversion to cpu
type are currently broken.  i'm going to fix that today (now that i have
the tables we're currently using in the hwdb).

-- 
Revolutions do not require corporate support.
