Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15F53482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Apr 2001 17:27:58 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14kDjh-0006eh-00; Tue, 03 Apr 2001 00:27:49 +0100
Date: Tue, 3 Apr 2001 00:27:49 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Christoph Plattner <christoph.plattner@dot.at>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New kernel on 720 + Pa-Linux-0.5: Breakpoint ?
Message-ID: <20010403002749.K11435@parcelfarce.linux.theplanet.co.uk>
References: <3AC90274.4687ED7C@dot.at> <20010403001743.G9198@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010403001743.G9198@linuxcare.com>; from rhirst@linuxcare.com on Tue, Apr 03, 2001 at 12:17:43AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Apr 03, 2001 at 12:17:43AM +0100, Richard Hirst wrote:
> On Tue, Apr 03, 2001 at 12:51:32AM +0200, Christoph Plattner wrote:
> > What this in the new kernel ?
> > A manually inserted breakpoint ?
> 
> No, you need new user space stuff.  It looks like there will be a

Why do you say that?  From:

sr0-3    00000000 00000000 00000000 00000001
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 00000000 00000004

it looks like it's a kernel null pointer dereference.

> new base tarball Real Soon Now, so it might be easiest to wait a
> few days for that.  Alternatively you could try the file system
> at
> 
> http://mkhppa1.esiee.fr/en/download.html
> 
> which is pretty up to date - havn't tried that myself though.

Works well for me.  Though as you say there's a new nfsroot out RSN.

-- 
Revolutions do not require corporate support.
