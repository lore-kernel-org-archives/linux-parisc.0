Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 984E9482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Jun 2001 13:07:42 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 157MAq-0001gJ-00; Tue, 05 Jun 2001 20:07:28 +0100
Date: Tue, 5 Jun 2001 20:07:28 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Chuck Slivkoff <charles_slivkoff@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Forcing PA-Linux to swap / do_page_fault()
Message-ID: <20010605200728.S7349@parcelfarce.linux.theplanet.co.uk>
References: <3B180D83.F5479D0B@hp.com> <3B1D1D56.14424ACA@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B1D1D56.14424ACA@hp.com>; from charles_slivkoff@hp.com on Tue, Jun 05, 2001 at 01:56:38PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 05, 2001 at 01:56:38PM -0400, Chuck Slivkoff wrote:
> I've noticed a problem that I believe is might be related to the kernel
> not being able to use swap space.  I've never seen swap utilization > 0
> and suspect that something might be seriously wrong. Here's an example
> of the kernel error:

Hmm... none of my systems are using swap either; I had noticed this before,
but never really thought much of it.  This has to be a moderately recent
breakage because I know jsm has tested swapping.

> Does anyone have a good example of test to force the system to use swap?

Sure.  malloc 256MB, then dirty each page.

-- 
Revolutions do not require corporate support.
