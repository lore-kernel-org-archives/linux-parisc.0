Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C107482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Aug 2001 23:10:39 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15bb93-0003jI-00; Tue, 28 Aug 2001 06:10:37 +0100
Date: Tue, 28 Aug 2001 06:10:37 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Building from scratch.
Message-ID: <20010828061037.A13332@parcelfarce.linux.theplanet.co.uk>
References: <20010826162754.A10072@megatonmonkey.net> <20010827203849.H525@parcelfarce.linux.theplanet.co.uk> <20010828003952.M28978@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010828003952.M28978@megatonmonkey.net>; from carlos@megatonmonkey.net on Tue, Aug 28, 2001 at 12:39:52AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 28, 2001 at 12:39:52AM -0400, Carlos O'Donell Jr. wrote:
> wget ftp://ftp.debian.org/debian/pool/main/g/glibc/glibc_2.2.4.orig.tar.gz
> 
> And applied glibc_2.2.4-1.diff from same directory.

2.2.4-1 doesn't build.  I haven't investigated in any detail, but it gets
further than your build error indicates.  Use dpkg-buildpackage to build
it... and you need to uncomment the hppa-specific patch in 0list... and
you need to edit the patch anyway to get it to apply...

I have no enthusiasm for working on glibc.  Please, someone, take it
off my hands.

-- 
Revolutions do not require corporate support.
