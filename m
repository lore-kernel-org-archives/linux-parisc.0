Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF49F4890
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Sep 2003 15:52:44 -0600 (MDT)
Date: Thu, 4 Sep 2003 17:51:27 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel crash with 2.6.0-test4-pa8 on 715/100
Message-ID: <20030904215127.GD3627@systemhalted>
References: <3F5728AB.3040501@hrzpub.tu-darmstadt.de> <20030904140615.GN18654@parcelfarce.linux.theplanet.co.uk> <3F57A22C.5050902@tiscali.be> <20030904210000.GZ18654@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030904210000.GZ18654@parcelfarce.linux.theplanet.co.uk>
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

On Thu, Sep 04, 2003 at 10:00:00PM +0100, Matthew Wilcox wrote:
> On Thu, Sep 04, 2003 at 08:35:56PM +0000, Joel Soete wrote:
> > Hi Willy,
> > >I'm seeing the same thing on my 712 without devfs.  Not sure what the
> > >problem is, and I'm having a hard time getting that box back up as it has
> > >a broken root filesystem (damn tar for being linked against libpthread!)
> > >
> > Is that libpthread the cause of your broken fs?
> 
> no, a 2.4 kernel doesn't have the same problem.

Signal related? What does the problem look like?

c.
