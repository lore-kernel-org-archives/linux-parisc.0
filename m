Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD90519F9.dip.t-dialin.net [217.5.25.249])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF5A3482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Sep 2001 13:07:56 -0600 (MDT)
Date: Tue, 25 Sep 2001 21:00:35 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Additional Address cleanup
Message-ID: <20010925210035.A22586@solo.franken.de>
References: <20010921104838.A2049@beavis.ybsoft.com> <3BAF13BC.3090302@hrzpub.tu-darmstadt.de> <20010924215918.A23464@beavis.ybsoft.com> <3BB0BFF9.50708@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3BB0BFF9.50708@hrzpub.tu-darmstadt.de>; from rscholz@hrzpub.tu-darmstadt.de on Tue, Sep 25, 2001 at 07:33:45PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Sep 25, 2001 at 07:33:45PM +0200, Rüdiger Scholz wrote:
> Ryan Bradetich wrote:
> 
> >
> >First I am assuming this worked before you tested this patch....
> >
> No ;-) It crashes, when the kernel tries to initialize the first 
> graphics card (Coral), during STICALL (...) in function sti_init_graph...

bug in the sti code. It doesn't use the sti rom from the card, but from
the onboard sti rom. I've played with my 715/100 with an extra HCRX and
had the same problem. I've disabled the HCRX by removing the connection
between mainboard and HCRX, then the kernel from the 0.9.2 crashed after
starting the init from the install ramdisk (Kernel Fault: Code=15) :-(

Hopefully I'll get some sti hacking done during the upcoming Linux
Hackermeeting in Oldenburg coming weekend.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
