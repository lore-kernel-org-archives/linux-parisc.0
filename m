Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1418A482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 21:16:12 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15WrAA-0004Xp-00; Wed, 15 Aug 2001 04:16:10 +0100
Date: Wed, 15 Aug 2001 04:16:10 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Users staying up to date.
Message-ID: <20010815041610.M22144@parcelfarce.linux.theplanet.co.uk>
References: <20010814154037.I25258@megatonmonkey.net> <20010815010034.K22144@parcelfarce.linux.theplanet.co.uk> <20010814215030.A26703@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010814215030.A26703@megatonmonkey.net>; from carlos@baldric.uwo.ca on Tue, Aug 14, 2001 at 09:50:30PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 14, 2001 at 09:50:30PM -0400, Carlos O'Donell Jr. wrote:
> In general, I don't want to submit a bugreport and have the
> list say "That's already fixed in the latest updated package" :)

That's fair enough.

> I'm currently running apt-get on one of our nodes, and trying
> to get it to an updated state.
> 
> Hrm. apg-get segfaults randomly. 

Yes, it does.  Until you've managed to get sully synced up to latest
toolchain/libs/kernel at which point, it magically stops.

> We're running a hand rolled:
> Linux node10 2.4.0 #37 Tue Jul 17 22:33:26 EDT 2001 parisc unknown

OK, you _definitely_ need to update this.  You could pull from CVS or
grab a snapshot tarball, see the webpages on how to do this.

> (Reading database ... 17525 files and directories currently installed.)
> Preparing to replace dpkg 1.8.3 (using .../archives/dpkg_1.9.16_hppa.deb) ...
> Unpacking replacement dpkg ...
> dpkg: error processing /var/cache/apt/archives/dpkg_1.9.16_hppa.deb (--unpack):
>  trying to overwrite directory `/usr/share/locale/cs' in package texinfo with nondirectory
> dpkg-deb: subprocess paste killed by signal (Broken pipe)

Umm.  That's rather interesting.  an excerpt from dpkg --listfiles dpkg
on paer.debian.org:

/usr/share/locale
/usr/share/locale/cs
/usr/share/locale/cs/LC_MESSAGES
/usr/share/locale/cs/LC_MESSAGES/dpkg.mo

I seem to remember someone saying this was a bug in an old version
of dpkg.  So one way around this may be to dpkg --remove texinfo, then
install dpkg, then install texinfo again.

-- 
Revolutions do not require corporate support.
