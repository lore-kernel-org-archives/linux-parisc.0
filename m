Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C47054837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 07:45:42 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15mbTu-0004iH-00; Thu, 27 Sep 2001 14:45:38 +0100
Date: Thu, 27 Sep 2001 14:45:38 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jurij Smakov <jurij@lokmail.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Message-ID: <20010927144538.B16096@parcelfarce.linux.theplanet.co.uk>
References: <200109271223.IAA32108@mail.lokmail.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109271223.IAA32108@mail.lokmail.net>; from jurij@lokmail.net on Thu, Sep 27, 2001 at 08:23:09AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 27, 2001 at 08:23:09AM -0400, Jurij Smakov wrote:
> It does not seem so complicated... Even with my rudimentary C programming
> skills :-). I'll try to put something together. Is there a way to check
> if we are running on a 720?

There is -- but don't bother.  Check to see if the register being read is
cr26 or cr27 and perform the access if it is.  Obviously, reads of other
control registers should not be emulated.

-- 
Revolutions do not require corporate support.
