Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8E6AF48F5
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 22 Mar 2004 10:39:29 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B5TOV-00053M-1p; Mon, 22 Mar 2004 17:39:23 +0000
Date: Mon, 22 Mar 2004 17:39:22 +0000
From: Matthew Wilcox <willy@debian.org>
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: [parisc-linux] Re: [DOC] Linux
Message-ID: <20040322173922.GF25059@parcelfarce.linux.theplanet.co.uk>
References: <mnet2.1079773336.27405.pinotj@club-internet.fr>
	<20040320114011.20de3426.varenet@esiee.fr>
	<20040320134916.GX25059@parcelfarce.linux.theplanet.co.uk>
	<200403220923.58173.bjorn.helgaas@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200403220923.58173.bjorn.helgaas@hp.com>
Sender: <willy@www.linux.org.uk>
Cc: Thibaut VARENE <varenet@esiee.fr>, ajwalker@broadpark.no,
	Matthew Wilcox <willy@debian.org>, pinotj@club-internet.fr,
	joey@infodrom.org, parisc-linux@lists.parisc-linux.org,
	parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Mar 22, 2004 at 09:23:58AM -0700, Bjorn Helgaas wrote:
> On Saturday 20 March 2004 6:49 am, Matthew Wilcox wrote:
> > On Sat, Mar 20, 2004 at 11:40:11AM +0100, Thibaut VARENE wrote:
> > > > +       Superdome will need some additional work.
> > > 
> > > Superdome, if ever supported, will not be supported as a "Superdome"
> > > system, but as separate units, as far as I've been told. The same goes
> > > for 742/743 VME boards that works standalone.
> > 
> > I think that's incorrect.  Superdome works as a big SMP box.
> 
> I thought Superdome needed the kmap trick to deal with the fact
> that it doesn't do non-equivalent aliasing quite right.  Or maybe
> that's already been done?

Right, that's the "some additional work" ;-) Thibaut was talking about
decomposing a superdome into a cluster of 4-way SMPs, I think.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
