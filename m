From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: 2.6.4-rc1-pa3 siimage/NS87415 IDE progess (and
	another mystery)!
Date: Mon, 12 Jul 2004 21:56:32 -0600
Message-ID: <20040713035632.GA27696@colo.lackof.org>
References: <Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
	<Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
	<20040711221829.GA27835@colo.lackof.org>
	<20040711231401.GW546@tausq.org> <20040711233439.GX546@tausq.org>
	<20040712033752.GA10163@sal.ucc.ie>
	<20040712041935.GA10211@sal.ucc.ie>
	<20040712161444.GB12046@colo.lackof.org>
	<20040712185132.GB11805@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "M. Grabert" <xam@cs.ucc.ie>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040712185132.GB11805@sal.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 12, 2004 at 07:51:32PM +0100, M. Grabert wrote:
> > If the IDE controller is NOT prefetching data into a local buffer,
> > I don't think it will be able to efficiently burst data across
> > the PCI bus.
> 
> Ah, and you fixed prefetching with the latest patch? Now I understand
> the issue ...

I don't think so. I think I've got the various parts of the IDE
controller to NOT prefetch. You need to read the 87560.pdf file
that is available from the parisc-linux.org Tech Docs page.
Then you'll know as much as I do about this IDE controller.
I'm really clueless about how IDE works internally.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
