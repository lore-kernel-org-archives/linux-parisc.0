Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0CD97482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Sep 2001 16:29:49 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 25984B00C; Wed, 19 Sep 2001 23:28:58 +0100 (BST)
Date: Wed, 19 Sep 2001 23:28:58 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: marka@sea.checkpoint.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] interesting problem in tty? telnetd? ls?
Message-ID: <20010919232858.B19441@linuxcare.com>
References: <Pine.WNT.4.33.0109191442050.5872-100000@nemo.dev.metainfo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.WNT.4.33.0109191442050.5872-100000@nemo.dev.metainfo.com>; from marka@sea.checkpoint.com on Wed, Sep 19, 2001 at 02:55:13PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Sep 19, 2001 at 02:55:13PM -0700, marka@sea.checkpoint.com wrote:
> I'm not sure where this problem is occuring, but I suspect it's telnetd.
> 
> telnet to your pa-risc linux box
> cd to the root directory
> execute 'ls -alR'
> 
> you'll lose your ptty and telnet session after a short while (seconds), but
> never at the the same place during the listing.  This does not occur over the
> serial console, but since that's only running at 9600 it may not be fast
> enough for the drop to occur.

I had this problem; it went away when I move up to a 2.4.9 kernel.

Richard
