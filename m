Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20433482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 19:31:36 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15a5or-0001fr-00; Fri, 24 Aug 2001 02:31:33 +0100
Date: Fri, 24 Aug 2001 02:31:33 +0100
From: Matthew Wilcox <willy@debian.org>
To: nick@snowman.net
Cc: Matthew Wilcox <willy@debian.org>, Helge Deller <deller@gmx.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
Message-ID: <20010824023133.A32128@parcelfarce.linux.theplanet.co.uk>
References: <20010823200234.D27374@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0108231532130.16296-100000@ns>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0108231532130.16296-100000@ns>; from nick@snowman.net on Thu, Aug 23, 2001 at 03:33:36PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 23, 2001 at 03:33:36PM -0400, nick@snowman.net wrote:
> Ok, only one more question hopefully.  I updated my PDC firmware from v2.7
> to v6.1, that went fine.  I tried booting a 32bit lifimage, that worked
> untill it got to the SCSI, at which point it spat out lots of errors for
> id's 0, 1 and 2, then locked.  Is there something special I need to do to
> keep C180's scsi happy?  I am useing the debian iso's lifimages right now.

I don't recognise this problem, can you post the SCSI messages?

-- 
Revolutions do not require corporate support.
