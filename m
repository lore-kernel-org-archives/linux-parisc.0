Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8627E482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Jul 2001 09:15:10 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15HRtN-0002cE-00; Tue, 03 Jul 2001 16:15:09 +0100
Date: Tue, 3 Jul 2001 16:15:09 +0100
From: Matthew Wilcox <willy@debian.org>
To: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
Cc: jfs-discussion@oss.software.ibm.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] JFS on PA-RISC-Linux
Message-ID: <20010703161509.A6103@parcelfarce.linux.theplanet.co.uk>
References: <20010702180851.A19547@nickel.kgarner.com> <Pine.LNX.4.33.0107031224210.15161-100000@leo.uni-sw.gwdg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0107031224210.15161-100000@leo.uni-sw.gwdg.de>; from weilbach@uni-sw.gwdg.de on Tue, Jul 03, 2001 at 12:51:27PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 03, 2001 at 12:51:27PM +0200, Peter Weilbacher wrote:
> 	<4>mkfs.jfs(379): unaligned access to 0x00035245 at ip=0x000137af
> 	Not-handled unaligned insn 0x4a740108
> 	Unaligned handler failed, ret = -1
> 
> (optionally without <4> or with Bus error)
> 
> Is it JFS's fault or that of the PA-RISC-Linux port? The messages do
> not seem to be from mkfs.jfs, as I did not find anything like that
> in its source. Is it too early to try things like this?

It's the fault of both, really.  The userspace program is attempting to do
an unaligned access.  say, loading an int from a non-word-aligned address.
Most CPUs can't handle this and take a fault.  We haven't yet implemented
a trap handler for that fault.

Or rather, tausq has implemented one, but hasn't activated it yet,
I believe.... tausq?

-- 
Revolutions do not require corporate support.
