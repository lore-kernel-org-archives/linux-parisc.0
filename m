Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (p50844C46.dip.t-dialin.net [80.132.76.70])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6EC2C482A
	for <parisc-linux@parisc-linux.org>; Thu, 28 Mar 2002 12:34:25 -0700 (MST)
Date: Thu, 28 Mar 2002 00:32:54 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: Chuck Slivkoff <caslivkoff@yahoo.com>,
	Ryan Bradetich <rbradetich@uswest.net>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] X on J5000
Message-ID: <20020328003254.A2300@solo.franken.de>
References: <3CA1701C.9000903@yahoo.com> <Pine.LNX.4.33L2.0203262318530.13376-100000@eiger.apptechsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33L2.0203262318530.13376-100000@eiger.apptechsys.com>; from jeremyd@apptechsys.com on Tue, Mar 26, 2002 at 11:22:01PM -0800
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

On Tue, Mar 26, 2002 at 11:22:01PM -0800, Jeremy Drake wrote:
> On Wed, 27 Mar 2002, Chuck Slivkoff wrote:
> 
> > That would be a Visualize-FXe. It is completely different than any of
> > the supported devices.
> 
> Does this mean I don't get any X?  Maybe I could be of some help testing

correct. None of the FX card is supported at the moment, because there is
still no documenatation available. I tried to treat the framebuffer as
a 24bit non packed framebuffer, but that gives me some really odd looking
graphic. Looks like PDC sets it up to some special pixel writing mode,
because it only deals with 3 planes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
