Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9CC33482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 08:03:28 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rgQo-0006PH-00; Thu, 11 Oct 2001 15:03:26 +0100
Date: Thu, 11 Oct 2001 15:03:26 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Glibc 2.2.4-2 No Optimizations = No Compliation
Message-ID: <20011011150326.C22924@parcelfarce.linux.theplanet.co.uk>
References: <20011011073101.B5637@megatonmonkey.net> <20011011144718.A22924@parcelfarce.linux.theplanet.co.uk> <20011011095913.A8106@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011011095913.A8106@megatonmonkey.net>; from carlos@megatonmonkey.net on Thu, Oct 11, 2001 at 09:59:13AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 11, 2001 at 09:59:13AM -0400, Carlos O'Donell Jr. wrote:
> Really?
> How about unrolled loops? ;)

Sometimes.  More importantly, gcc stops doing stupid things with -O1,
particulalry shifting registers backwards and forwards with no net effect.

> True. But that really shouldn't make much difference since
> AFAIK inlining doesn't happen until -O2, but config.h just says...
> "You must have atleast -O1"

Not the case.  gcc will inline functions marked as such at -O1.  At -O3,
it decides for itself to inline some things.

-- 
Revolutions do not require corporate support.
