Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7468D4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 07:48:40 -0600 (MDT)
Date: Wed, 16 Apr 2003 14:48:35 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Matthew Wilcox <willy@debian.org>
Cc: Gavin Hubbard <ghub005@xtra.co.nz>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Presicionbook success
In-Reply-To: <20030416134433.GP30643@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.44.0304161445420.28370-100000@sal.ucc.ie>
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

On Wed, 16 Apr 2003, Matthew Wilcox wrote:

> Date: Wed, 16 Apr 2003 14:44:33 +0100
> From: Matthew Wilcox <willy@debian.org>
> To: M. Grabert <xam@cs.ucc.ie>
> Cc: Matthew Wilcox <willy@debian.org>, Gavin Hubbard <ghub005@xtra.co.nz>,
>      parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] Re: Presicionbook success
>
> On Wed, Apr 16, 2003 at 02:36:25PM +0100, M. Grabert wrote:

[...]

> > The initialization of the CMD PCI0643 IDE controller fails when using
> > the ESIEE kernel (which has support built-in for this chip).
> > Something like "failed to get IRQ, will probe later".
>
> Oh, I thought you said the kernel hung when probing with this driver.
> If it just whines about being unable to do anything, that's no problem.

Maybe I was a little bit confusing to you:

1. Using a kernel with CMD IDE support, it will hang with the message
   "will probe IRQs later" ...
2. it will not hang if you pass a ide=nodma, but then it will show
   no devices
3. It will just boot fine without any CMD IDE support in the kernel

> > So no devices were found on the IDE bus, just on the LASI SCSI.
> > Probably it's the best just to use SCSI and not to use IDE support at all ...
>
> *nod*.  It might be fun for someone to play with fixing the IDE driver,
> but I don't think that's necessary.

;)


Slan, Max
