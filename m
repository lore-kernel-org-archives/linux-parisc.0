Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9041482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Apr 2001 17:41:31 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 429EEB007; Tue,  3 Apr 2001 00:41:12 +0100 (BST)
Date: Tue, 3 Apr 2001 00:41:12 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Christoph Plattner <christoph.plattner@dot.at>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New kernel on 720 + Pa-Linux-0.5: Breakpoint ?
Message-ID: <20010403004112.H9198@linuxcare.com>
References: <3AC90274.4687ED7C@dot.at> <20010403001743.G9198@linuxcare.com> <20010403002749.K11435@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010403002749.K11435@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Tue, Apr 03, 2001 at 12:27:49AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Apr 03, 2001 at 12:27:49AM +0100, Matthew Wilcox wrote:
> On Tue, Apr 03, 2001 at 12:17:43AM +0100, Richard Hirst wrote:
> > On Tue, Apr 03, 2001 at 12:51:32AM +0200, Christoph Plattner wrote:
> > > What this in the new kernel ?
> > > A manually inserted breakpoint ?
> > 
> > No, you need new user space stuff.  It looks like there will be a
> 
> Why do you say that?  From:
> 
> sr0-3    00000000 00000000 00000000 00000001
> sr4-7    00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 00000000 00000004
> 
> it looks like it's a kernel null pointer dereference.

You might well be right; it just reminded me of one of the problems
I saw on my 715/old with bad spinlock alignment.

> > new base tarball Real Soon Now, so it might be easiest to wait a
> > few days for that.  Alternatively you could try the file system
> > at
> > 
> > http://mkhppa1.esiee.fr/en/download.html
> > 
> > which is pretty up to date - havn't tried that myself though.
> 
> Works well for me.  Though as you say there's a new nfsroot out RSN.

OK, I'm not sure when that was produced relative to my latest glibc
spinlock alignment fix though.

Richard
