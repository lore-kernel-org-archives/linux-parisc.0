Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 16 Feb 2003 22:11:08 -0700
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Watchdog on parisc?
Message-ID: <20030217051108.GB17823@dsl2.external.hp.com>
References: <20030214181124.GJ13355@lug-owl.de> <20030216083110.GC18888@dsl2.external.hp.com> <20030216094234.GG351@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030216094234.GG351@lug-owl.de>
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

On Sun, Feb 16, 2003 at 10:42:35AM +0100, Jan-Benedict Glaw wrote:
> So there's nothing what's like a watchdog as you know it from some
> machines (SGI Indys for example) or as add-on cards in machines (PCI/ISA
> cards).

Offhand, I think all the HP9000/8xx servers have either built-in
or add-on "management ports" for remote console. And that always
includes ability to reset or cycle power on the machine (or generate TOC).

> > not if it's what I'm thinking of (transaction timeout, ie causes an
> > HPMC). This is a built-in HW feature. 
> 
> Hmmm... Triggering a HPMC would be a neat feature. So we could think
> about a way to initiate something that, if not handled, would trigger a
> HPMC some 60 seconds later:-?

Generating an HPMC is easy. reference an address in MMIO space that
isn't maintained by a device.  Figuring out a failsafe way of knowing
when to trigger the HPMC is the hardpart.
 
Besides, Lamont proposed a patch to reset the machine after HPMC/panic.
I thought it was a great idea but several people I trust tell me it
needs a bit more work.

grant
