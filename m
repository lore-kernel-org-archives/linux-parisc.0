Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CE0F4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Sep 2002 17:38:04 -0600 (MDT)
Message-ID: <3D8519D7.55D90667@gmx.at>
Date: Mon, 16 Sep 2002 01:37:59 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: Ryan Bradetich <rbradetich@uswest.net>, varenet@esiee.fr,
	"MEYER,ALAN C. (HP-FtCollins,ex1)" <alan_meyer@hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: SCSI/MUX driver on E55, NDA for sorce code
References: <3D825FDF.CD6E8CE2@gmx.at> <1031962399.930.17.camel@beavis> <3D8281F4.F03A2007@gmx.at> <1031964117.1043.29.camel@beavis> <3D84CD3B.88A9528B@gmx.at> <20020915192500.D10583@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
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

Thanks for that !

But I think, my Linux code dose the same !!!

	info->iomem_base = (void *)(hpa + MUX_OFFSET + 
				    (line * MUX_LINE_OFFSET));

This info->iomem_base is used by all accesses, the 
registers of i/o are defined by Ryan as:

#define IO_COMMAND_REG_OFFSET 0x30
#define IO_STATUS_REG_OFFSET 0x34
#define IO_DATA_REG_OFFSET 0x3c
#define IO_DCOUNT_REG_OFFSET 0x40
#define IO_UCOUNT_REG_OFFSET 0x44
#define IO_FIFOS_REG_OFFSET 0x48

So the offset of 0x30 is inside those macros.

An example of an access:

		data = __raw_readl((unsigned long)info->iomem_base 
				   + IO_DATA_REG_OFFSET);

... reading characters from the input buffers.

Any further idea ?

Ryan, you mentioned problems concerning missing locks, but
I cannot think about this. Those devices should be controlled
independent, am I wrong ?

I hope, we will solve this all (all means including SPIFI
SCSI driver too !).

Christoph



Matthew Wilcox wrote:
> 
> On Sun, Sep 15, 2002 at 08:11:07PM +0200, Christoph Plattner wrote:
> > The status of MUX: It is not working to access to offset
> > 0x80 for the lines. The machine dies. I think this problem
> > can be solved very easy, looking in the HP-UX driver code.
> 
> Not so sure...
> 
> common/sio/mux2.c:
> 
> for (loop = 0; loop < ports; loop++, ttyp++) {
>         HW.hpa                  = MUX_DATA.hpa + 0x800 + (loop * 0x80);
>         HW.io_reg_ptr           = (io_reg_type *)(HW.hpa + 0x30);
> }
> 
> --
> Revolutions do not require corporate support.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
