Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB34E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 08:09:51 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17FxxR-0003Uw-00; Thu, 06 Jun 2002 15:09:45 +0100
Date: Thu, 6 Jun 2002 15:09:44 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	Randolph Chung <tausq@debian.org>, patrick@tykepenguin.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb getting healthier? (PCI guru needed, that's you willy!)
Message-ID: <20020606150944.D27186@parcelfarce.linux.theplanet.co.uk>
References: <20020606092115.C6900@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020606092115.C6900@systemhalted>; from carlos@baldric.uwo.ca on Thu, Jun 06, 2002 at 09:21:15AM -0400
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

On Thu, Jun 06, 2002 at 09:21:15AM -0400, Carlos O'Donell Jr. wrote:
> The kernel still goes into an infinite loop of unknown origin:
> ---
> PCI or EISA Bus Adapter 0 is not registered...
> ---
> (see ./arch/parisc/kernel/pci.c' -> PCI_PORT_IN)
> Don't know where this gets called from, or how the ugly macro
> expands :)

that ugly macro expands into inb/inw/inl.  that printk probably needs to
go away -- i don't think it's helpful.  maybe it should stay for adapter
!= 0, but so many drivers probe ISA space for their devices that we're
going to keep getting them.

i bet the loop isn't infinite... probably driver probing.  If you turn
off CONFIG_PCI, the driver shouldn't be compiled in.

> Sadly I think I zapped my VGA out on the 712/60 (A common occurence?).
> It no longer produces _any_ video signals.
> I may have to drag a 715/50 back to my house...
> 
> c.
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
Revolutions do not require corporate support.
