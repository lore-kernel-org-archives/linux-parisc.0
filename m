Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 6 Jan 2003 10:00:59 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: Peter 'p2' De Schrijver <p2@mind.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Matrox Millenium II in C240
Message-ID: <20030106170059.GE9947@dsl2.external.hp.com>
References: <20030102123856.GD871@portablue.intern.mind.be> <20030103051715.GA14565@dsl2.external.hp.com> <20030105131037.E19239@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030105131037.E19239@parcelfarce.linux.theplanet.co.uk>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Sun, Jan 05, 2003 at 01:10:37PM +0000, Matthew Wilcox wrote:
> Yep.  Thought that was part of the PCI spec, though maybe I'm confused with
> 66MHz.

I think you are. 66Mhz operation requires 3.3v signaling.
AFAIK, both dino and cujo only run at 33Mhz *OR SLOWER* (eg 30Mhz).

However, HP did support only 3.3v for quite a while (at least on paper)
and I'm never quite sure which slots are 5v vs 3.3v.

> > SCSI is accessed that way. tulip driver can be tweaked to use MMIO
> > if you don't have any 100BT GSC (card-mode Dino) cards.
> 
> umm.. I thought cardmode MMIO was working now on B/C/J class machines.
> I think D/K/R still have resource management issues.

I don't recall all the details for card-mode.
My main point was the default is IO port space (CONFIG_TULIP_MMIO).

...
> > It's interesting one device has MMIO at both 0xf2800000
> > and 0xf9000000 since it would imply one PCI controller is supposed
> > to forward the entire range of addresses. But Dino only forwards
> > (any number of) 8MB chunks between 0xf0800000 and 0xff800000 (except
> > the first and last 8MB chunks).
> 
> I think this may well be the problem.  I bet Dino hasn't been programmed
> to forward the 16MB range at f900'0000, and Linux has just found an
> unused bit of address space and allocated it to the Matrox card.

Hmmm. /proc/iomem should tell us which ranges dino/cujo are forwarding.

But looking at dino.c, it's clear the code is not handling multiple
ranges correctly even if firmware did program it right.

        res = &dino_dev->hba.lmmio_space;

lmmio_space needs to be an array.
In HP speak, this is an "unsupported configuration". 

Elroy (lba_pci.c) suffers a similar problem with "directed ranges"
(code currently only handles "distributed ranges"). At some point
I'll get back to working on the lba code since it has a few other
minor oustanding issues as well.

grant
