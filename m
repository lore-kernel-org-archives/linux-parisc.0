Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Christoph Plattner <christoph.plattner@gmx.at>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Status SPIFI SCSI 
In-Reply-To: Message from Ryan Bradetich <rbradetich@uswest.net>
   of "16 Sep 2002 20:25:01 MDT." <1032229501.930.45.camel@beavis>
References: <3D8516EF.7A7D8206@gmx.at>  <1032229501.930.45.camel@beavis> 
Date: Mon, 16 Sep 2002 21:53:27 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020917035327.E51E34829@dsl2.external.hp.com>
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

Ryan Bradetich wrote:
> >   __raw_writel(CMD_RESET, dev->hpa + IO_MODULE_COMMAND);

This looks like something will be documented in the IO ACD.
CMD_RESET is an architecture defined command PA IO devices
are required to accept.

> > Is this a reset method via the IO PDC address space
> > common for all HP devices?

I believe so. That doesn't mean *all* of them implement
it properly or even need it.

> That is where I am also. We actually read the type SPIFI-3 (SE) for the
> SKUNK card, and SPIFI-3 (DF) for the wizard (16-bit) card.

I'm pretty sure wizard card used SPIFI-4.


hth,
grant
