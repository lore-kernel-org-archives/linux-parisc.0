Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE98E482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Aug 2001 13:38:51 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15bSDi-0001NL-00; Mon, 27 Aug 2001 20:38:50 +0100
Date: Mon, 27 Aug 2001 20:38:49 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Building from scratch.
Message-ID: <20010827203849.H525@parcelfarce.linux.theplanet.co.uk>
References: <20010826162754.A10072@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010826162754.A10072@megatonmonkey.net>; from carlos@megatonmonkey.net on Sun, Aug 26, 2001 at 04:27:54PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Aug 26, 2001 at 04:27:54PM -0400, Carlos O'Donell Jr. wrote:
> I started by building the tools, as per the instructions on the website.
> 
> - Built binutils
> - Partially build gcc
> - Unpack and configure kernel
> - Build glibc...

Where did you get glibc from?  The only place with current patches is the
Debian package.  Our CVS is terribly out of date.

-- 
Revolutions do not require corporate support.
