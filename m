Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mr14.vic-remote.bigpond.net.au (mr14.vic-remote.bigpond.net.au [24.192.1.29])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B8814A19
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 Feb 2001 08:09:00 -0700 (MST)
From: penfold@customware.com.au
Message-Id: <200102031508.CAA25485@customware.com.au>
Subject: Re: [parisc-linux] _working_ rbootd for redhat
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 4 Feb 2001 02:08:44 +1100 (EST)
Cc: christoph.plattner@alcatel.at (Christoph Plattner)
In-Reply-To: <3A7A7E14.9EB320A4@alcatel.at> from "Christoph Plattner" at Feb 02, 2001 10:29:56 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> 
> Hello !
> I will try your setup.
> 
> One more question here:
> 
> Have I to configure something concerning the LAN on the
> boot monitor prompt (PDC..) to be able to use the LAN as
> boot device ?

hmmm, not sure what you mean here.

In my case I disconnected all SCSI devices to _ensure_ the box would not
boot from disk.

All I do is let it search (or, _re_search if I had forgotten to start rbootd)
and then select path P0 to boot from.

> 
> To your question: Yes my Linux has booted. I only needed 
> this TRAP18-FIX and ..... success !!

Does your kernel see the scsi interface on the 720 ?

If so, I am keen to try your kernel - are you able to make it available
for download somewhere?
If convenient for you, you also email it to me.

Damian
penfold@customware.com.au
