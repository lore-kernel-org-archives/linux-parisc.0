Return-Path: <bjorn.helgaas@hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id DABC9499F
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 22 Mar 2004 09:24:16 -0700 (MST)
From: Bjorn Helgaas <bjorn.helgaas@hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [DOC] Linux
Date: Mon, 22 Mar 2004 09:23:58 -0700
References: <mnet2.1079773336.27405.pinotj@club-internet.fr>
	<20040320114011.20de3426.varenet@esiee.fr>
	<20040320134916.GX25059@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20040320134916.GX25059@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200403220923.58173.bjorn.helgaas@hp.com>
Cc: Thibaut VARENE <varenet@esiee.fr>, ajwalker@broadpark.no,
	Matthew Wilcox <willy@debian.org>, pinotj@club-internet.fr,
	joey@infodrom.org, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Saturday 20 March 2004 6:49 am, Matthew Wilcox wrote:
> On Sat, Mar 20, 2004 at 11:40:11AM +0100, Thibaut VARENE wrote:
> > > +       Superdome will need some additional work.
> > 
> > Superdome, if ever supported, will not be supported as a "Superdome"
> > system, but as separate units, as far as I've been told. The same goes
> > for 742/743 VME boards that works standalone.
> 
> I think that's incorrect.  Superdome works as a big SMP box.

I thought Superdome needed the kmap trick to deal with the fact
that it doesn't do non-equivalent aliasing quite right.  Or maybe
that's already been done?
