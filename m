Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45FBE482B
	for <parisc-linux@parisc-linux.org>; Fri,  6 Jul 2001 16:35:29 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15IeBy-00083x-00; Fri, 06 Jul 2001 23:35:18 +0100
Date: Fri, 6 Jul 2001 23:35:18 +0100
From: Matthew Wilcox <willy@debian.org>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.4.6 boots!
Message-ID: <20010706233518.G6103@parcelfarce.linux.theplanet.co.uk>
References: <E15IdRv-00051U-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E15IdRv-00051U-00@noam.fc.hp.com>; from bame@fc.hp.com on Fri, Jul 06, 2001 at 03:47:43PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jul 06, 2001 at 03:47:43PM -0600, Paul Bame wrote:
> Boot-time IP configuration
> (PNP+BOOTP) isn't working (with tulip anyway) but static network
> configuration works.

Apparently this changed upstream so you need to specify ip=bootp on
the kernel command line.  My palo/Makefile now reads:

CMDLINE = 0/vmlinux64 HOME=/ TERM=linux $(ROOT) $(CONSOLE) ip=bootp sym53c8xx=buschk:2

NFS Root is now working on my machine.

-- 
Revolutions do not require corporate support.
