Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31F5B482B
	for <parisc-linux@parisc-linux.org>; Tue, 19 Jun 2001 11:02:10 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15COtF-0006vw-00; Tue, 19 Jun 2001 18:02:09 +0100
Date: Tue, 19 Jun 2001 18:02:09 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Helge Deller <deller@gmx.de>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] fbcon diff
Message-ID: <20010619180209.T10186@parcelfarce.linux.theplanet.co.uk>
References: <20010618200635.P10186@parcelfarce.linux.theplanet.co.uk> <20010619161630.E90E5482B@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010619161630.E90E5482B@dsl2.external.hp.com>; from deller@gmx.de on Tue, Jun 19, 2001 at 06:15:41PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 19, 2001 at 06:15:41PM +0200, Helge Deller wrote:
> I absolutely agree with you.

As Larry McVoy says, that's a great way to start an email :-)

> The part behind "#elif defined(__hppa__) && !(USE_HPPA_IOREMAP)" should and 
> will go away anyway, but the change from direct memory addressing to 
> readX()/writeX() modifies generic linux code, could break other arches and 
> should IMHO be discussed with Geert, Alan Cox or Linus directly and not be 
> changed reclusively in our tree.

Certainly our tree should not be the only one making this change.

BTW, I figured out what the problem is with your ioremap
change.  You haven't modified read[bwlq], write[bwlq]
to do non-absolute addressing.  My original three ideas
all called for making this change to {read,write}[bwl]
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-March/011914.html

-- 
Revolutions do not require corporate support.
