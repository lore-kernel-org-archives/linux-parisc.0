Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2146482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 08:11:00 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15uDsw-0007Z3-00; Thu, 18 Oct 2001 15:10:58 +0100
Date: Thu, 18 Oct 2001 15:10:58 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc update
Message-ID: <20011018151058.B25234@parcelfarce.linux.theplanet.co.uk>
References: <20011017122313.C4123@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011017122313.C4123@tausq.org>; from randolph@tausq.org on Wed, Oct 17, 2001 at 12:23:13PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 17, 2001 at 12:23:13PM -0700, Randolph Chung wrote:
> 3. with the glibc build (using old binutils) some of the linuxthreads
> tests are failing. in particular there's one case where it seems to get
> into a deadlock. i left it running overnight and it's still stuck ... 
> i don't know if this has always been broken though.

That's right, some of the tests have always failed.  However, this was
better than the previous state where all tests failed, so I uploaded...

I have a list of tests which fail that I posted to parisc-linux some
time ago.  As far as I know, nobody fixed them.

http://lists.parisc-linux.org/pipermail/parisc-linux/2001-May/012560.html

-- 
Revolutions do not require corporate support.
