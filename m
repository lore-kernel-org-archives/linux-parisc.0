Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2FEF548C9
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Jan 2004 09:21:12 -0700 (MST)
Date: Fri, 16 Jan 2004 11:12:19 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [parisc-linux] Non-HP PCI cards & x86 BOOT-ROMS
Message-ID: <20040116161219.GT5550@systemhalted>
References: <Pine.GSO.4.58.0401161155280.15789@vier.idi.ntnu.no>
	<20040116115517.GM14285@lug-owl.de>
	<20040116115940.GN14285@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040116115940.GN14285@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Jan 16, 2004 at 12:59:40PM +0100, Jan-Benedict Glaw wrote:
> On Fri, 2004-01-16 12:55:17 +0100, Jan-Benedict Glaw <jbglaw@lug-owl.de>
> wrote in message <20040116115517.GM14285@lug-owl.de>:
> > On Fri, 2004-01-16 12:04:22 +0100, Ivar Orskaug <Ivar.Olav.Harstad.Orskaug@idi.ntnu.no>
> > wrote in message <Pine.GSO.4.58.0401161155280.15789@vier.idi.ntnu.no>:
> 
> > Maybe it would be a nice idea to hack bochs to initialize those cards,
> > but that's a lot of work, though...
> 
> Thinking again about that, it maybe isn't all *that* hard. Bochs already
> does know about the concept of shared DRAM and ROM BIOSes etc. Maybe
> it's really just enough to hack it's memory class (yup, it's written in
> C++) to not back the memory by RAM or on-disk storage, but to redirect
> all accesses to physical RAM.
> 
> The same is to be done with I/O ports too, of course... For complex card
> (SCSI RAID host adaptors), you may need to service interrupts, too:-(

How can you use Bochs? It runs a virtualized machine. The purpose of
running card firmware is to effect the *current* machine with some
configuration process.

c.
