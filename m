Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B03C487E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 07:57:59 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17U6MP-0007MM-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 14:57:57 +0100
Date: Mon, 15 Jul 2002 14:57:57 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] O_DIRECT on devices
Message-ID: <20020715135757.GM808@tykepenguin.com>
References: <20020711082259.GF822@tykepenguin.com> <20020715034632.E27706@parcelfarce.linux.theplanet.co.uk> <willy@debian.org> <20020715074219.18CD54861@dsl2.external.hp.com> <20020715122919.F27706@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20020715122919.F27706@parcelfarce.linux.theplanet.co.uk>
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

On Mon, Jul 15, 2002 at 12:29:19PM +0100, Matthew Wilcox wrote:
> On Mon, Jul 15, 2002 at 01:42:19AM -0600, Grant Grundler wrote:
> > Randolph and I think most SMP bugs reported (and we seen ourselves)
> > suggest a D-cache problem.
> 
> Entirely plausible.  PA has bigger virtually indexed caches than anyone
> else, so we're more susceptible to cache aliasing bugs than anyone else.
> It could be a missing flush somewhere in the arch-independent code.

My machine isn't SMP but could a similar bug cause the problem to occur between
the CPU and the DMA controller of the SCSI card ?

patrick
