Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B4E7482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Sep 2001 13:10:35 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15f4Xp-000882-00; Thu, 06 Sep 2001 20:10:33 +0100
Date: Thu, 6 Sep 2001 20:10:33 +0100
From: Matthew Wilcox <willy@debian.org>
To: Galen Arnold <arnoldg@ncsa.uiuc.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] smp kernel hangs during boot on L2000...
Message-ID: <20010906201033.H316@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.33.0109061359230.530-100000@osage.ncsa.uiuc.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0109061359230.530-100000@osage.ncsa.uiuc.edu>; from arnoldg@ncsa.uiuc.edu on Thu, Sep 06, 2001 at 02:02:20PM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 06, 2001 at 02:02:20PM -0500, Galen Arnold wrote:
> 
> I've built the latest kernel (downloaded this morning) and am trying to
> boot it on an L2000 with smp supported (64 bit also).
> 
> The kernel hangs immediately and the last line printed is:
> 
> 	branching to kernel entry point 0x00100000

I suggest you edit arch/parisc/kernel/pdc_cons.c and turn #undef
EARLY_DEBUG into #define EARLY_DEBUG; this should let you see where the
crash occurs.

-- 
Revolutions do not require corporate support.
