From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] parisc: provide pci_mmap_page_range() for parisc
Date: Fri, 14 Jun 2013 10:36:58 +0200
Message-ID: <20130614083658.GA5391@alpha.franken.de>
References: <20130614070541.GA10443@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130614070541.GA10443@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 14, 2013 at 09:05:41AM +0200, Helge Deller wrote:
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> pci_mmap_page_range() is needed for X11-server support on C8000 with ATI
> FireGL card.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

You could add my Acked-By or Signed-off-by whatever fits your needs.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
