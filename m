From: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] Re: 2.6.4-rc1-pa3 siimage/NS87415 IDE progess (and
	another mystery)!
Date: Mon, 12 Jul 2004 19:51:32 +0100
Message-ID: <20040712185132.GB11805@sal.ucc.ie>
References: <20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
	<Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
	<20040711221829.GA27835@colo.lackof.org>
	<20040711231401.GW546@tausq.org> <20040711233439.GX546@tausq.org>
	<20040712033752.GA10163@sal.ucc.ie>
	<20040712041935.GA10211@sal.ucc.ie>
	<20040712161444.GB12046@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040712161444.GB12046@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 12, 2004 at 10:14:44AM -0600, Grant Grundler wrote:

> On Mon, Jul 12, 2004 at 05:19:35AM +0100, M. Grabert wrote:
> > BTW, what are the supported DMA modes of the NS87415?
> 
> Hopefully the ns87415 data sheet will specify that.
> 
> > I suppose BM-DMA means BusMaster-DMA, but does the NS87415 support any
> > Ultra-DMA modes, or only Multi-Word DMA?
> 
> DMA from the IDE controller are just regular PCI transactions.
> There is no such thing as Ultra-DMA for PCI.

I see what you mean. Yes, sorry for mixing up these terms in
the same sentence. But it seems you understood what I wanted to say ;)

[...]

> If the IDE controller is NOT prefetching data into a local buffer,
> I don't think it will be able to efficiently burst data across
> the PCI bus.

Ah, and you fixed prefetching with the latest patch? Now I understand
the issue ...

> > Also there is a significant CPU load whenever I do a read/write access to
> > the IDE hard disk (compared to the CPU load when I access the SCSI disks),
> > which might be another indication that it's still using PIO and not DMA.
> 
> Yes, that's probably a better indicator.
>
> > Is 
> >   'hdparm -c 1' (enable 32bit I/O)
> > and
> >   'hdparm -u 1' (unmasq_irq)
> > useful/implemented on PA-RISC?

Well, it doesn't change the performance in any way.

> I don't think this is platform specific.
> I expect both of those to be card/driver specific.

The first, yes. But I'm not sure about the second (unmask_irq).


Thanks,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
