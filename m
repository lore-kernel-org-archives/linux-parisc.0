Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 80127482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 13:02:39 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15ZzkQ-0000Op-00; Thu, 23 Aug 2001 20:02:34 +0100
Date: Thu, 23 Aug 2001 20:02:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: nick@snowman.net
Cc: Matthew Wilcox <willy@debian.org>, Helge Deller <deller@gmx.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
Message-ID: <20010823200234.D27374@parcelfarce.linux.theplanet.co.uk>
References: <20010823194014.C27374@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0108231456280.16296-100000@ns>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0108231456280.16296-100000@ns>; from nick@snowman.net on Thu, Aug 23, 2001 at 02:57:17PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 23, 2001 at 02:57:17PM -0400, nick@snowman.net wrote:
> Well thanks to your suggestion I tried not even attempting to change the
> params and just see what happened.  what I got was
> The 64-bit Kernel has started...
> Determining PDC firmware type: Ancient Box (bus_id = 0x0)
> Kernel panic: This system will probably never run Linux.
> 
> In idle task - not syncing
> 
> Is that as bad as it sounds?  Can I update the PDC firmware, or would that
> not help?
> 	Thanks

You should run a 32-bit kernel on the C180 :-)

-- 
Revolutions do not require corporate support.
