Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id A60D0488B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 08:23:57 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17U6lY-0007QG-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 15:23:56 +0100
Date: Mon, 15 Jul 2002 15:23:56 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] O_DIRECT on devices
Message-ID: <20020715142356.GN808@tykepenguin.com>
References: <20020711082259.GF822@tykepenguin.com> <20020715034632.E27706@parcelfarce.linux.theplanet.co.uk> <willy@debian.org> <20020715074219.18CD54861@dsl2.external.hp.com> <20020715122919.F27706@parcelfarce.linux.theplanet.co.uk> <20020715135757.GM808@tykepenguin.com> <20020715151013.N27706@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20020715151013.N27706@parcelfarce.linux.theplanet.co.uk>
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

On Mon, Jul 15, 2002 at 03:10:13PM +0100, Matthew Wilcox wrote:
> On Mon, Jul 15, 2002 at 02:57:57PM +0100, Patrick Caulfield wrote:
> > My machine isn't SMP but could a similar bug cause the problem to occur between
> > the CPU and the DMA controller of the SCSI card ?
> 
> you're on a C110, right?  that has a ccio IOC so you shouldn't have any
> problems, unless there's a driver bug.  and the symbios driver gets a
> lot of testing ;-)

yes.
 
> what we could be seeing on your machine is incoherency between user &
> kernel space.

ah OK. makes sense.

patrick
