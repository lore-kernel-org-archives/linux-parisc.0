Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0F52B482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Nov 2001 10:47:34 -0700 (MST)
Message-ID: <3C028033.5DBB735@gmx.at>
Date: Mon, 26 Nov 2001 18:47:31 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: E55 status - THE DRIVER !
References: <3BF99676.2A291CDD@gmx.at> <1006299638.4898.16.camel@beavis>
		<3BFBFD98.29F4D69A@gmx.at> <1006760706.14588.7.camel@beavis>
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

Hello again !

Yes especially I am interesting in writing the driver for my E55
MUX board ....

With friendly regards
Christoph P.


Ryan Bradetich wrote:
> 
> On Wed, 2001-11-21 at 12:16, Christoph Plattner wrote:
> > Hello again,
> >
> > Are you able to write the drivers ?
> 
> Not sure, but we will find out :)
> 
> > Do you have the documentation for that ?
> Depends on if I can find it.  A lot of this older documentation I have
> not been able to locate *sigh*.  I have not spent much time looking for
> it yet, because I have not started on the drivers yet.  The only driver
> I have started on was the MUX driver, and I was unable to locate
> documenation so far, but I have not given up yet.
> 
> > I have problems with my spare time, but I am also interested in writing
> > drivers (especially for my machine !)
> 
> > Which drivers will you write ?
> > MUX ?, SCSI ? (parallel port ?)
> 
> I have a bunch of cards, so pick one that you want to work on, and I can
> start on a different one.  I've been working on the MUX lately, but with
> your PDC patch, I'm kinda leaning towards the skunk or wizard scsi
> card.  I have a stack of cards that to work on, so feel free to grab the
> one that suits your fancy :)
> 
> - Ryan
> 
> > Bye
> > Christoph
> >
> >
> >
> > Ryan Bradetich wrote:
> > >
> > > Hello Christoph,
> > >
> > > I have integrated your patch into my tree, and have been testing out the
> > > patch on my C200+ and the K460.  With the PDC console patch, I do get to
> > > the console on the K460 which is great news.  I am still going to work
> > > on the driver for the actual hardware (in my case the Eole CAP/MUX, and
> > > in your case the Sahp Baat Kiuh AP/MUX), but this is a nice work around
> > > until that work is finished.
> > >
> > > When integrating your patch into my tree, I made the following changes:
> > >
> > > * Dropped the LCD support.
> > >         I do not understand this portion of the code very well, and it  had
> > > some uglyness that made me feel uneasy to commit to the tree.   Someone
> > > else should look at this and integrate it properly.
> > >
> > > * Renamed the pdc_drv to pdc_console.
> > >         Just seemed more accurate to me .. I am open for other opinions
> > >         on this.
> > >
> > > * Added the configure option and help text for the PDC software console.
> > > * Inegerated CONFIG_PDC_CONSOLE into the drivers/char/Makefile.
> > > * Integrated CONFIG_PDC_CONSOLE into arch/parisc/kernel/pdc_cons.c and
> > >         performed some minor cleanups.
> > >
> > > * probably other things I've forgotten :)
> > >
> > > Overall I though the patch looked great, but I still have 1 concern left
> > > and that is about the major number.
> > >
> > > According to Documentation/devices.txt major number 30 is reserved for:
> > >  30 char        iBCS-2 compatibility devices
> > >
> > > I understand about --><-- much about how major numbers are handled and I
> > > know this is a topic of debate among the main stream kernel developers.
> > > If we ever want to move this driver into the mainstream kernel this
> > > issue will probably need to be resolved ... and I have no idea on how to
> > > proceed.  Maybe others on this list will have an idea, or when the time
> > > comes we will need to address this on the lkml.  Before I commit this
> > > patch to the CVS repository, I'd like to get some concensus on this list
> > > about what is right.  (ie for the debian installer to work with this
> > > device, /dev/ttyB0 will need to be added to the MAKEDEV package, etc).
> > >
> > > Anyways the patch is available for feedback at:
> > > ftp://ftp.parisc-linux.org/patches/pdc_console.diff
> > >
> > > I am still working on testing this driver ... I would be very happy to
> > > see install the K460 using the debian installer using this patch.  I am
> > > currently working on making that happen.
> > >
> > > Thanks,
> > >
> > > - Ryan
> >
> > --
> > -------------------------------------------------------
> > private:      christoph.plattner@gmx.at
> > company:      christoph.plattner@alcatel.at
> >
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
