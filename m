Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2194E4840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Nov 2003 11:49:41 -0700 (MST)
Date: Thu, 27 Nov 2003 11:49:39 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and 2.6 - need config help
Message-ID: <20031127184939.GC9746@colo.lackof.org>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie> <Pine.LNX.4.58.0311270244030.9783@sal.ucc.ie> <20031127042103.GC1321@colo.lackof.org> <Pine.LNX.4.58.0311270423120.9783@sal.ucc.ie> <Pine.LNX.4.58.0311270444110.9783@sal.ucc.ie> <20031127061557.GE1321@colo.lackof.org> <Pine.LNX.4.58.0311271450260.13181@sal.ucc.ie> <20031127181531.GB9746@colo.lackof.org> <Pine.LNX.4.58.0311271817360.14260@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0311271817360.14260@sal.ucc.ie>
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

On Thu, Nov 27, 2003 at 06:21:26PM +0000, M. Grabert wrote:
> On Thu, 27 Nov 2003, Grant Grundler wrote:
> 
> > On Thu, Nov 27, 2003 at 03:16:08PM +0000, M. Grabert wrote:
> > > The max. transfer rate of any 100BT network is around 5MByte/s.
> >
> > 100BT is capable of 90-95Mb/s ~= 11MB/s.
> 
> That's theoretical, not really practically possible/feasible :-/

it's possible with a switched network. It's not possible
with regular hub where one has to deal with collisions.
Full duplex switched networks obsolete token passing as a method to
avoid packet collisions.

> > There's a website someplace that has 100BT performance numbers
> > for all sorts of card/OS combinations.
> >
> > I've measured ftp transfers > 10MB/s between ia64 and ia32 machines
> > over 100BT link.
> 
> ftp? uncompressed? Well I'm impressed ...
> The fastest 100MBit link I ever had was 7MBytes/s.

This is an excellent paper on routing:
	http://robur.slu.se/Linux/net-development/jamal/FF-html/

Peak throughput (in one port of a 4-port tulip card and out another)
is about 50Mb/s because the single CPU is saturated.  He does better
with an SMP machine. Jamal later got 20% perf improvement (measured in
packets per second) using MMIO instead of IO port space . But still
saturating the CPU. Jamal was confident at the time he could route at
link rate (95Mb/s) with 64byte packets on a faster SMP machine.

grant
