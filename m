Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from azrael.blades.cxm (ua8d10hel.dial.kolumbus.fi [62.248.137.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A2694829
	for <parisc-linux@parisc-linux.org>; Mon, 17 Feb 2003 08:47:43 -0700 (MST)
Received: (from blades@localhost)
	by azrael.blades.cxm (SGI-8.9.3/8.9.3) id RAA88618
	for parisc-linux@parisc-linux.org; Mon, 17 Feb 2003 17:47:42 +0200 (EET)
Date: Mon, 17 Feb 2003 17:47:42 +0200
From: Harri Haataja <harri.haataja@kolumbus.fi>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] removal of gnat
Message-ID: <20030217174742.A87954@azrael.blades.cxm>
References: <20030217151659.D28902@parcelfarce.linux.theplanet.co.uk> <20030217172157.A83956@azrael.blades.cxm> <20030217152631.E28902@parcelfarce.linux.theplanet.co.uk> <20030217173151.A88439@azrael.blades.cxm> <20030217154226.F28902@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030217154226.F28902@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Mon, Feb 17, 2003 at 03:42:26PM +0000
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

On Mon, Feb 17, 2003 at 03:42:26PM +0000, Matthew Wilcox wrote:
> On Mon, Feb 17, 2003 at 05:31:51PM +0200, Harri Haataja wrote:
> > On Mon, Feb 17, 2003 at 03:26:31PM +0000, Matthew Wilcox wrote:
> > > On Mon, Feb 17, 2003 at 05:21:58PM +0200, Harri Haataja wrote:
> > > > If there's ada stuff and gnat in particular there, I hope
> > > > removing that won't take out the last ada system available. I
> > > > believe it's quite hard to get back.
> > > No danger of that -- it's built as part of the debian gcc-3.2
> > > build, so there are substantially more recent compilers available.
> > So it'll be there in debian.
> Yup.  And it'll be there for anyone to use if they want to bootstrap
> their own compiler.  You have to start bootstrapping from _somewhere_;
> you seem to be suggesting that it's morally repugnant to start from
> debian's gcc+gnat rather than some random gcc+gnat found on a project
> website..  I'm not sure I agree.

I hadn't looked. So this is just an old version. I have nothing against
removing old binaries unless someone wants a piece of history or it has
some other signifigance. Great.

> > > gnat is written in Ada, so it is known to work at least well
> > > enough to compile itself.
> > .. if you have an Ada compiler :)
> 
> Sure, but who doesn't?  ;-)  I even posted instructions in the form of
> a shell script to debian-gcc last year on how to cross-bootstrap from
> another architecture.

I don't remember where I would have wanted it some ages ago. Maybe
netbsd/sparc or something :) They hadn't bootstrapped it there yet.

Sorry about the mixup, somehow I didn't even remember there was a debian
already and that it's a separate project with their piles of software :)

-- 
Why is TV called a medium?
Because it's neither rare nor well done.
	-- .sig of Marco Rinck
