Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A7A74840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Nov 2003 11:21:28 -0700 (MST)
Date: Thu, 27 Nov 2003 18:21:26 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and 2.6 - need config help
In-Reply-To: <20031127181531.GB9746@colo.lackof.org>
Message-ID: <Pine.LNX.4.58.0311271817360.14260@sal.ucc.ie>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie>
 <Pine.LNX.4.58.0311270244030.9783@sal.ucc.ie> <20031127042103.GC1321@colo.lackof.org>
 <Pine.LNX.4.58.0311270423120.9783@sal.ucc.ie> <Pine.LNX.4.58.0311270444110.9783@sal.ucc.ie>
 <20031127061557.GE1321@colo.lackof.org> <Pine.LNX.4.58.0311271450260.13181@sal.ucc.ie>
 <20031127181531.GB9746@colo.lackof.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 27 Nov 2003, Grant Grundler wrote:

> On Thu, Nov 27, 2003 at 03:16:08PM +0000, M. Grabert wrote:
> > The max. transfer rate of any 100BT network is around 5MByte/s.
>
> 100BT is capable of 90-95Mb/s ~= 11MB/s.

That's theoretical, not really practically possible/feasible :-/

> There's a website someplace that has 100BT performance numbers
> for all sorts of card/OS combinations.
>
> I've measured ftp transfers > 10MB/s between ia64 and ia32 machines
> over 100BT link.

ftp? uncompressed? Well I'm impressed ...
The fastest 100MBit link I ever had was 7MBytes/s.

> I'll take another look at why DMA isn't working.
> It looks like NS87415 driver has the support in place.
> The key bit seems to be init_hwif_ns87415().

Thanks alot,

 Max
