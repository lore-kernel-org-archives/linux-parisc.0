Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88BB64A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Mar 2001 21:26:29 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA23961;
	Wed, 14 Mar 2001 15:24:36 +1100
Date: Wed, 14 Mar 2001 15:24:36 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org, John Wehle <john@feith.com>
Subject: Re: [parisc-linux] segfaults with new binutils 
In-Reply-To: <Pine.LNX.4.21.0103141102190.27636-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0103141509470.27636-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 14 Mar 2001, Alan Modra wrote:

> It's a compiler bug. :-(

And we're indebted to John for already fixing it.

Thu Mar  8 23:29:37 2001  John Wehle  (john@feith.com)

	* rtlanal.c (rtx_varies_p): Check operand 0 of a
	LO_SUM unless for_alias is set.

The above probably makes some of my hacks redundant.  For the time being,
I've left them in, and just added John's fix to puffin.external.hp.com
CVS.

Alan
-- 
Linuxcare
