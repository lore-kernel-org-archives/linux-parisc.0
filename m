Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE4554829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Sep 2002 20:29:24 -0600 (MDT)
Subject: Re: [parisc-linux] Re: SCSI/MUX driver on E55, NDA for sorce code
From: Ryan Bradetich <rbradetich@uswest.net>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: Matthew Wilcox <willy@debian.org>, varenet@esiee.fr,
	"MEYER,ALAN C.   " "(HP-FtCollins,ex1)" <alan_meyer@hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3D8519D7.55D90667@gmx.at>
References: <3D825FDF.CD6E8CE2@gmx.at> <1031962399.930.17.camel@beavis>
	<3D8281F4.F03A2007@gmx.at> <1031964117.1043.29.camel@beavis>
	<3D84CD3B.88A9528B@gmx.at>
	<20020915192500.D10583@parcelfarce.linux.theplanet.co.uk>
	<3D8519D7.55D90667@gmx.at>
Content-Type: text/plain
Date: 16 Sep 2002 20:29:22 -0600
Message-Id: <1032229762.1043.50.camel@beavis>
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

On Sun, 2002-09-15 at 17:37, Christoph Plattner wrote:
> Thanks for that !
> 
> But I think, my Linux code dose the same !!!
> 
> 	info->iomem_base = (void *)(hpa + MUX_OFFSET + 
> 				    (line * MUX_LINE_OFFSET));
> 
> This info->iomem_base is used by all accesses, the 
> registers of i/o are defined by Ryan as:
> 
> #define IO_COMMAND_REG_OFFSET 0x30
> #define IO_STATUS_REG_OFFSET 0x34
> #define IO_DATA_REG_OFFSET 0x3c
> #define IO_DCOUNT_REG_OFFSET 0x40
> #define IO_UCOUNT_REG_OFFSET 0x44
> #define IO_FIFOS_REG_OFFSET 0x48
> 
> So the offset of 0x30 is inside those macros.
> 
> An example of an access:
> 
> 		data = __raw_readl((unsigned long)info->iomem_base 
> 				   + IO_DATA_REG_OFFSET);
> 
> ... reading characters from the input buffers.
> 
> Any further idea ?
> 
> Ryan, you mentioned problems concerning missing locks, but
> I cannot think about this. Those devices should be controlled
> independent, am I wrong ?

Locks was just an idea of why it might now work.  Nothing suggested that
yet.  I found the MPD, now I just need to make a cable for it to hook up
to a different system and test with.  Hopefully will get this done this
week and I'll take a look at it :)

> I hope, we will solve this all (all means including SPIFI
> SCSI driver too !).
> 
> Christoph
