Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4E91482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Apr 2001 05:31:59 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 76D20B008; Fri,  6 Apr 2001 12:31:19 +0100 (BST)
Date: Fri, 6 Apr 2001 12:31:19 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010406123119.U9198@linuxcare.com>
References: <20010404234654.H9198@linuxcare.com> <Pine.LNX.4.21.0104050920520.13605-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0104050920520.13605-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Thu, Apr 05, 2001 at 09:27:32AM +1000
Subject: [parisc-linux] Re: 64 bit kernel and module dp values again
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Apr 05, 2001 at 09:27:32AM +1000, Alan Modra wrote:
> On Wed, 4 Apr 2001, Richard Hirst wrote:
> 
> > On Wed, Apr 04, 2001 at 04:32:40PM +0100, Richard Hirst wrote:
> > > Hi Alan,
> > >   Code from drivers/block/loop.o, built as a 64 bit module, using
> > > xc-20010307.tgz
> > > 
> > > The stub to call $$divU is called with the kernels dp value as that is
> > > what dp is left with follwing the __muldi3 call.
> 
> Sorry Richard, I should have picked up on this when I saw you exporting
> millicode from the kernel yesterday.

Just for the record, I've solved this problem by reworking the stub
that modutils builds for 64 bit modules to call millicode functions
in the kernel.  The stub cannot assume dp is valid for the local module,
and must not modify dp.

If we have further problems in this area we should consider linking
each module against libgcc.a, so they each have their own local
millicode functions.

Richard
