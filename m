From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] Re: 2.6.4-rc1-pa3 siimage/NS87415 IDE progess
	(and another mystery)!
Date: Mon, 12 Jul 2004 20:44:06 +0100
Message-ID: <1089661444.11710.19.camel@localhost.localdomain>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
	<20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
	<Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
	<20040711221829.GA27835@colo.lackof.org>
	<20040711231401.GW546@tausq.org>
	<20040711233439.GX546@tausq.org> <20040712033752.GA10163@sal.ucc.ie>
	<20040712041935.GA10211@sal.ucc.ie>
	<20040712161444.GB12046@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
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

On Llu, 2004-07-12 at 17:14, Grant Grundler wrote:
> > Is 
> >   'hdparm -c 1' (enable 32bit I/O)
> > and
> >   'hdparm -u 1' (unmasq_irq)
> > useful/implemented on PA-RISC?
> 
> I don't think this is platform specific.
> I expect both of those to be card/driver specific.

Both are implemented in the core code. In the case of -c 1 it isnt going
to do anything relevant. -u 1 ought to have little effect in DMA modes

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
