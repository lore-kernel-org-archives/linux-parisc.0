Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7FCA84829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Sep 2002 12:25:04 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17qe4q-0003OP-00; Sun, 15 Sep 2002 19:25:00 +0100
Date: Sun, 15 Sep 2002 19:25:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: Ryan Bradetich <rbradetich@uswest.net>, varenet@esiee.fr,
	"MEYER,ALAN C. (HP-FtCollins,ex1)" <alan_meyer@hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: SCSI/MUX driver on E55, NDA for sorce code
Message-ID: <20020915192500.D10583@parcelfarce.linux.theplanet.co.uk>
References: <3D825FDF.CD6E8CE2@gmx.at> <1031962399.930.17.camel@beavis> <3D8281F4.F03A2007@gmx.at> <1031964117.1043.29.camel@beavis> <3D84CD3B.88A9528B@gmx.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D84CD3B.88A9528B@gmx.at>; from christoph.plattner@gmx.at on Sun, Sep 15, 2002 at 08:11:07PM +0200
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

On Sun, Sep 15, 2002 at 08:11:07PM +0200, Christoph Plattner wrote:
> The status of MUX: It is not working to access to offset
> 0x80 for the lines. The machine dies. I think this problem
> can be solved very easy, looking in the HP-UX driver code.

Not so sure...

common/sio/mux2.c:

for (loop = 0; loop < ports; loop++, ttyp++) {
        HW.hpa                  = MUX_DATA.hpa + 0x800 + (loop * 0x80);
        HW.io_reg_ptr           = (io_reg_type *)(HW.hpa + 0x30);
}

-- 
Revolutions do not require corporate support.
