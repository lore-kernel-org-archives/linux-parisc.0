Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8TL4lq32392;
	Mon, 29 Sep 2003 17:04:47 -0400
Subject: Re: [parisc-linux] Re: NCR53c720
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Matthew Wilcox <willy@debian.org>,
	Roman Zippel <zippel@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org, linux-apus-devel@lists.sourceforge.net
In-Reply-To: <20030929205548.GA13226@dsl2.external.hp.com>
References: <Pine.GSO.4.21.0309291116250.7432-100000@vervain.sonytel.be>
	<Pine.LNX.4.44.0309291434260.17812-100000@serv>
	<20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk>
	<Pine.LNX.4.44.0309291818060.17548-100000@serv>
	<20030929162749.GR24824@parcelfarce.linux.theplanet.co.uk>
	<20030929205548.GA13226@dsl2.external.hp.com>
Content-Type: text/plain
Date: 29 Sep 2003 16:00:10 -0500
Message-Id: <1064869488.1782.240.camel@mulgrave>
Mime-Version: 1.0
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

On Mon, 2003-09-29 at 15:55, Grant Grundler wrote:
> On Mon, Sep 29, 2003 at 05:27:49PM +0100, Matthew Wilcox wrote:
> > > Um, which one is the current right dma device API?
> > 
> > The one in Documentation/DMA-API.txt.
> 
> Matthew, which version of the source tree?
> 2.4.22 and 2.6.x versions of this file are not identical.
> 
> grundler@gsyprf3:/usr/src$ diff linux-2.?/Documentation/DMA-mapping.txt | wc -l
>    117
> grundler@gsyprf3:/usr/src$ wc -l linux-2.?/Documentation/DMA-mapping.txt
>     798 linux-2.4/Documentation/DMA-mapping.txt
>     828 linux-2.5/Documentation/DMA-mapping.txt
>    1626 total

DMA-mapping.txt is only the pci_ DMA API.  The ncr53c8xx doesn't use
that any more.  It only uses the generic DMA API, which is documented in
DMA-API.txt like willy said, and is only in 2.6 (not 2.4).

James
