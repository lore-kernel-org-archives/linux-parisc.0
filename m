Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7B55482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 08:56:20 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15bkHr-00076p-00; Tue, 28 Aug 2001 15:56:19 +0100
Date: Tue, 28 Aug 2001 15:56:19 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Building from scratch.
Message-ID: <20010828155619.I18341@parcelfarce.linux.theplanet.co.uk>
References: <20010826162754.A10072@megatonmonkey.net> <20010827203849.H525@parcelfarce.linux.theplanet.co.uk> <20010828003952.M28978@megatonmonkey.net> <20010828061037.A13332@parcelfarce.linux.theplanet.co.uk> <20010828071743.A1289@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010828071743.A1289@megatonmonkey.net>; from carlos@megatonmonkey.net on Tue, Aug 28, 2001 at 07:17:43AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 28, 2001 at 07:17:43AM -0400, Carlos O'Donell Jr. wrote:
> I have also tried building 2.2.4 without the diff, but with no success.

No, you definitely need the diff, you just need a little more than that
too :-)

> What would be the responsibilities of said maintianer?

Keeping the diff in the glibc tree up to date, trying to merge it upstream,
fixing bugs as they arise.

> The small fact that "uncomment the hppa-specific patch in 0list" means
> little to nothing to me ;) ... is probably an indication that I'm not
> experienced enough to take on glibc.

Let's see:

apt-get source glibc
cd glibc-2.2.4-1
vi debian/patches/0list
	delete the `#' from the front of glibc22-hppa.

I've fixed some problems with this patch, but it still dies doing the
install.

> Seeing as you are the current glibc maintainer, my question would be:
> What type of process do you follow for maintaining glibc?

Really, I don't.  I have no enthusiasm for working on glibc, so I simply
wait for debian to do new glibc releases and ensure the patch still applies.
The various bits in the patch need to get merged upstream, but I don't
enjoy dealing with drepper, so I haven't been working on that either.

> I promise to try and stop doing crazy things like building the toolchain
> by hand ;)

If you were to take over maintaining glibc, I'd forgive you :-)

-- 
Revolutions do not require corporate support.
