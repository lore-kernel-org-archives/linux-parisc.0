Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2502E482E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 07:16:34 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 74906B007; Tue,  3 Apr 2001 14:16:12 +0100 (BST)
Date: Tue, 3 Apr 2001 14:16:12 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Christoph Plattner <christoph.plattner@alcatel.at>
Cc: Christoph Plattner <christoph.plattner@dot.at>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New kernel on 720 + Pa-Linux-0.5: Breakpoint ?
Message-ID: <20010403141612.Q9198@linuxcare.com>
References: <3AC90274.4687ED7C@dot.at> <20010403001743.G9198@linuxcare.com> <3AC973D3.F1453A4C@alcatel.at> <20010403101251.L9198@linuxcare.com> <3AC996AE.21A21135@alcatel.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AC996AE.21A21135@alcatel.at>; from christoph.plattner@alcatel.at on Tue, Apr 03, 2001 at 11:23:58AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Apr 03, 2001 at 11:23:58AM +0200, Christoph Plattner wrote:
> Hello,
> 
> Richard Hirst wrote:
> > 
> > On Tue, Apr 03, 2001 at 08:55:15AM +0200, Christoph Plattner wrote:
> > > With the file system of ESIEE, I always have the problem, that
> > > my machine hangs, before init does any output !
> > 
> > Have you tried using init=/bin/sash?  You may have to build your
> > own sash, from userspace/sash on pehc cvs.
> 
> No. I built up my own bash (it was statically linked by
> accident). I never used sash.

You should try sash.  It will make less demands on your system, and
might show us something useful.

Richard
