Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9FF91482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 09:10:22 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 318CBB007; Tue,  5 Jun 2001 16:06:53 +0100 (BST)
Date: Tue, 5 Jun 2001 16:06:53 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: djweis@sjdjweis.com
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] D310 boot messages
Message-ID: <20010605160653.L25745@linuxcare.com>
References: <20010605145156.J25745@linuxcare.com> <Pine.LNX.4.21.0106050904490.22868-100000@oliver.internal.sjdjweis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0106050904490.22868-100000@oliver.internal.sjdjweis.com>; from djweis@sjdjweis.com on Tue, Jun 05, 2001 at 09:14:05AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 05, 2001 at 09:14:05AM -0500, djweis@sjdjweis.com wrote:
> 
> On Tue, 5 Jun 2001, Richard Hirst wrote:
> 
> > So with the nfsroot you have the D310 booting, but with the 0.9 ISO
> > it stops after serial driver initialisation.
> 
> No, if I boot off the cd, I get IPL errors. When I netboot the kernel off
> the cd, it stopped at serial init. I don't think it actually stopped, I
> think it no longer printed but still booted.

Ah, ok.  I'd misunderstood you.  So the kernel on the CD is no
different from the one you built yourself.  That's a relief!

Have you checked both serial ports, just in case the one the
kernel finds isn't the one you are using?
